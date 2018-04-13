using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AssetManagementSystem._DAL_AMSTableAdapters;

namespace AssetManagementSystem.Restricted
{
	public partial class EquipmentView : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				PageDataRefresh();
			}
		}

		private void PageDataRefresh()
		{
			string queryID = Request.QueryString["id"];
			int eID = 0;
			bool idValid = Int32.TryParse(queryID, out eID);
			if (eID == 0)
			{
				FvEquipmentView.ChangeMode(FormViewMode.Insert);
			}

			/* *********** Configure DAL *********** */
			EquipmentInstanceTableAdapter equipmentAdapter = new EquipmentInstanceTableAdapter();
			FvEquipmentView.DataSource = equipmentAdapter.GetByID(eID);
			FvEquipmentView.DataBind();

			RequirementsTableAdapter requirementsAdapter = new RequirementsTableAdapter();
			LvRequirementList.DataSource = requirementsAdapter.GetByEquipmentInstance(eID);
			LvRequirementList.DataBind();

			ServicesTableAdapter servicesAdapter = new ServicesTableAdapter();
			LvServiceList.DataSource = servicesAdapter.GetByEquipmentInstanceID(eID);
			LvServiceList.DataBind();

			/* ****** Refresh Drop Down Lists ****** */

			if (FvEquipmentView.CurrentMode == FormViewMode.Insert)
			{
				ddlEquipmentTypeRefresh();
				ddlSiteRefresh();

				/* ****** Hide 'Add New' buttons on sub-lists ****** */
				//btnAddNewRequirement.CssClass = "glyphicon glyphicon-plus btn disabled";
				//btnAddNewService.CssClass = " glyphicon glyphicon-plus btn disabled";
			}
			else if (FvEquipmentView.CurrentMode == FormViewMode.Edit || FvEquipmentView.CurrentMode == FormViewMode.ReadOnly)
			{
				string typeID = DataBinder.Eval(FvEquipmentView.DataItem, "EquipmentTypeID").ToString();
				ddlEquipmentTypeRefresh(typeID);

				string siteID = DataBinder.Eval(FvEquipmentView.DataItem, "SiteID").ToString();
				string buildID = DataBinder.Eval(FvEquipmentView.DataItem, "BuildingID").ToString();
				string locID = DataBinder.Eval(FvEquipmentView.DataItem, "LocationID").ToString();
				ddlSiteRefresh(siteID, 0, buildID, locID);

				/* ****** Show 'Add New' buttons on sub-lists ****** */
				//btnAddNewRequirement.CssClass = "glyphicon glyphicon-plus btn";
				//btnAddNewService.CssClass = " glyphicon glyphicon-plus btn";
			}
		}

		protected void FvEquipmentView_ItemCommand(object sender, FormViewCommandEventArgs e)
		{
			switch (e.CommandName)
			{
				case "New":
					Response.Redirect("~/Restricted/EquipmentView.aspx?id=0");
					break;
				case "Cancel":
					FvEquipmentView.ChangeMode(FormViewMode.ReadOnly);
					PageDataRefresh();
					break;
				case "ListView":
					Response.Redirect("~/Restricted/EquipmentList.aspx");
					break;
			}
		}

		protected void FvEquipmentView_ModeChanging(object sender, FormViewModeEventArgs e)
		{
			// Enable a FormView mode change (Read-Only, Edit/Update, New/Insert, Empty)
			FvEquipmentView.ChangeMode((FormViewMode)e.NewMode);
			PageDataRefresh();
		}

		protected void FvEquipmentView_ItemInserting(object sender, FormViewInsertEventArgs e)
		{
			FvEquipmentView_CallInsertOrUpdate("Insert");
		}

		protected void FvEquipmentView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
		{
			FvEquipmentView_CallInsertOrUpdate("Update");
		}

		protected void FvEquipmentView_CallInsertOrUpdate(string CallCommand)
		{
			// Code versions of all controls
			TextBox EquipmentInstanceID_txt = (TextBox)FvEquipmentView.FindControl("txtEquipmentInstanceID");
			DropDownList EquipmentTypeID_ddl = (DropDownList)FvEquipmentView.FindControl("ddlEquipmentTypeID");
			DropDownList Status_ddl = (DropDownList)FvEquipmentView.FindControl("ddlStatus");
			TextBox SerialNumber_txt = (TextBox)FvEquipmentView.FindControl("txtSerialNumber");
			DropDownList LocationID_ddl = (DropDownList)FvEquipmentView.FindControl("ddlLocation");
			TextBox InstallationDate_txt = (TextBox)FvEquipmentView.FindControl("txtInstallationDate");

			// Assign all text properties of controls to variables
			// Or skip this and assign straight into INSERT/UPDATE parameters
			int equipmentInstanceID = Convert.ToInt32(Request.QueryString["id"]);
			int equipmentTypeID = Convert.ToInt32(EquipmentTypeID_ddl.SelectedValue);
			string status = Status_ddl.SelectedValue;
			string serialNumber = SerialNumber_txt.Text;
			int locationID = Convert.ToInt32(LocationID_ddl.SelectedValue);
			string installationDate = InstallationDate_txt.Text;

			EquipmentInstanceTableAdapter equipmentAdapter = new EquipmentInstanceTableAdapter();

			try
			{
				if (CallCommand == "Update")
				{
					// Conduct Update
					equipmentAdapter.UpdateRecord(equipmentTypeID, status, serialNumber, locationID, installationDate, equipmentInstanceID);
					ClientScript.RegisterStartupScript(GetType(), "text", "AlertTimeout();", true);

					// Return to Read Only mode
					FvEquipmentView.ChangeMode(FormViewMode.ReadOnly);
					PageDataRefresh();
				}
				else if (CallCommand == "Insert")
				{ 
					//equipmentAdapter.InsertRecord(equipmentTypeID, status, serialNumber, locationID, installationDate);
					string newID = equipmentAdapter.InsertAndReturnID(equipmentTypeID, status, serialNumber, locationID, installationDate).ToString();
					ClientScript.RegisterStartupScript(GetType(), "text", "AlertTimeout();", true);
					// Redirect User
					Response.Redirect("~/Restricted/EquipmentView.aspx?id=" + newID);
				}
			}
			catch (System.Exception ex)
			{
				Response.Write("<script LANGUAGE='JavaScript' >alert('An ERROR occurred connecting to the database. " + ex.Message + "')</script>");
			}
		}

		protected void FvEquipmentView_DataBound(object sender, EventArgs e)
		{
			if (FvEquipmentView.DataItemCount == 0)
			{
				FvEquipmentView.ChangeMode(FormViewMode.Insert);
			}
			else
			{
				FvEquipmentView.ChangeMode(FormViewMode.Edit);
			}

		}

		/* *************************************
		* ********** DDL Index Change **********
		* ************************************* */

		protected void ddlEquipmentTypeID_SelectedIndexChanged(object sender, EventArgs e)
		{
			DropDownList EquipmentTypeID_ddl = (DropDownList)FvEquipmentView.FindControl("ddlEquipmentTypeID");
			DropDownList EquipmentTypeDesc_ddl = (DropDownList)FvEquipmentView.FindControl("ddlEquipmentTypeDesc");

			EquipmentTypeDesc_ddl.SelectedIndex = EquipmentTypeID_ddl.SelectedIndex;
		}


		protected void ddlEquipmentTypeDesc_SelectedIndexChanged(object sender, EventArgs e)
		{
			DropDownList EquipmentTypeID_ddl = (DropDownList)FvEquipmentView.FindControl("ddlEquipmentTypeID");
			DropDownList EquipmentTypeDesc_ddl = (DropDownList)FvEquipmentView.FindControl("ddlEquipmentTypeDesc");

			EquipmentTypeID_ddl.SelectedIndex = EquipmentTypeDesc_ddl.SelectedIndex;
		}

		protected void ddlSite_SelectedIndexChanged(object sender, EventArgs e)
		{
			DropDownList Site_ddl = (DropDownList)FvEquipmentView.FindControl("ddlSite");
			string siteID = Site_ddl.SelectedValue;

			ddlBuildingRefresh(siteID);
		}

		protected void ddlBuilding_SelectedIndexChanged(object sender, EventArgs e)
		{
			DropDownList Building_ddl = (DropDownList)FvEquipmentView.FindControl("ddlBuilding");
			string buildID = Building_ddl.SelectedValue;

			ddlLocationRefresh(buildID);
		}

		/* *************************************
		* ****** DDL Refresh Subroutines *******
		* ************************************* */

		private void ddlEquipmentTypeRefresh(string TypeIDValue = null, int TypeIDIndex = 0)
		{
			EquipmentTypesTableAdapter typeAdapter = new EquipmentTypesTableAdapter();

			DropDownList EquipmentTypeID_ddl = (DropDownList)FvEquipmentView.FindControl("ddlEquipmentTypeID");
			EquipmentTypeID_ddl.DataSource = typeAdapter.Get();
			EquipmentTypeID_ddl.DataValueField = "EquipmentTypeID";
			EquipmentTypeID_ddl.DataTextField = "EquipmentTypeID";

			

			if (TypeIDValue == "" || TypeIDValue == null)
			{
				EquipmentTypeID_ddl.SelectedIndex = TypeIDIndex;
			}
			else
			{
				EquipmentTypeID_ddl.SelectedValue = TypeIDValue;
			}

			EquipmentTypeID_ddl.DataBind();

			DropDownList EquipmentTypeDesc_ddl = (DropDownList)FvEquipmentView.FindControl("ddlEquipmentTypeDesc");
			EquipmentTypeDesc_ddl.DataSource = EquipmentTypeID_ddl.DataSource;
			EquipmentTypeDesc_ddl.DataValueField = "EquipmentTypeID";
			EquipmentTypeDesc_ddl.DataTextField = "EquipmentTypeDesc";
			EquipmentTypeDesc_ddl.SelectedValue = EquipmentTypeID_ddl.SelectedValue;

			EquipmentTypeDesc_ddl.DataBind();
		}

		private void ddlSiteRefresh(string ddlSiteValue = "", int ddlSiteIndex = 0, string BuildID = "", string LocID = "")
		{
			SitesTableAdapter siteAdapter = new SitesTableAdapter();

			DropDownList Site_ddl = (DropDownList)FvEquipmentView.FindControl("ddlSite");
			Site_ddl.DataSource = siteAdapter.Get();
			Site_ddl.DataValueField = "SiteID";
			Site_ddl.DataTextField = "SiteName";

			if (ddlSiteValue == "")
			{
				Site_ddl.SelectedIndex = ddlSiteIndex;
			}
			else
			{
				Site_ddl.SelectedValue = ddlSiteValue;
			}

			Site_ddl.DataBind();
			string siteID = Site_ddl.SelectedValue;

			if (BuildID == "")
			{
				ddlBuildingRefresh(siteID);
			}
			else
			{
				ddlBuildingRefresh(siteID, BuildID, 0, LocID.ToString());
			}
		}

		private void ddlBuildingRefresh(string SiteID, string ddlBuildingValue = null, int ddlBuildingIndex = 0, string LocID = "")
		{
			BuildingsTableAdapter buildingAdapter = new BuildingsTableAdapter();

			DropDownList Building_ddl = (DropDownList)FvEquipmentView.FindControl("ddlBuilding");
			Building_ddl.DataSource = buildingAdapter.GetBySiteID(SiteID);
			Building_ddl.DataValueField = "BuildingID";
			Building_ddl.DataTextField = "BuildingName";

			if (ddlBuildingValue == "")
			{
				Building_ddl.SelectedIndex = ddlBuildingIndex;
			}
			else
			{
				Building_ddl.SelectedValue = ddlBuildingValue;
			}

			Building_ddl.DataBind();
			string buildID = Building_ddl.SelectedValue;

			if (LocID == "")
			{
				ddlLocationRefresh(buildID);
			}
			else
			{
				ddlLocationRefresh(buildID, LocID.ToString());
			}
		}

		private void ddlLocationRefresh(string BuildID, string ddlLocationValue = null, int ddlLocationIndex = 0)
		{
			LocationsTableAdapter locationAdapter = new LocationsTableAdapter();

			DropDownList Location_ddl = (DropDownList)FvEquipmentView.FindControl("ddlLocation");
			Location_ddl.DataSource = locationAdapter.GetByBuildingID(BuildID);
			Location_ddl.DataValueField = "LocationID";
			Location_ddl.DataTextField = "LocationEasyName";

			if (ddlLocationValue == "")
			{
				Location_ddl.SelectedIndex = ddlLocationIndex;
			}
			else
			{
				Location_ddl.SelectedValue = ddlLocationValue;
			}

			Location_ddl.DataBind();
		}

		/* *************************************
		* ****** END OF FORM VIEW *******
		* ************************************* */

		protected void LvRequirementList_ItemCommand(object sender, ListViewCommandEventArgs e)
		{
			switch (e.CommandName)
			{
				case "View":
					Response.Redirect("~/Restricted/RequirementView.aspx?id=" + e.CommandArgument.ToString());
					break;
				case "Service":
					TextBox EquipmentInstanceID_txt = (TextBox)FvEquipmentView.FindControl("txtEquipmentInstanceID");
					int equipmentInstanceID = Convert.ToInt32(EquipmentInstanceID_txt.Text);

					Response.Redirect("~/Restricted/ServiceView.aspx?eid=" + equipmentInstanceID + "&rid=" + e.CommandArgument.ToString());
					break;
			}
		}

		protected void LvServiceList_ItemCommand(object sender, ListViewCommandEventArgs e)
		{
			Response.Redirect("~/Restricted/ServiceView.aspx?id=" + e.CommandArgument.ToString());
		}

		//protected void btnAddNewRequirement_Click(object sender, EventArgs e)
		//{
		//	DropDownList EquipmentTypeID_ddl = (DropDownList)FvEquipmentView.FindControl("ddlEquipmentTypeID");
		//	int equipmentTypeID = Convert.ToInt32(EquipmentTypeID_ddl.SelectedValue);

		//	Response.Redirect("~/Restricted/RequirementView.aspx?tid=" + equipmentTypeID);
		//}

		//protected void btnAddNewService_Click(object sender, EventArgs e)
		//{
		//	TextBox EquipmentInstanceID_txt = (TextBox)FvEquipmentView.FindControl("txtEquipmentInstanceID");
		//	int equipmentInstanceID = Convert.ToInt32(EquipmentInstanceID_txt.Text);

		//	Response.Redirect("~/Restricted/ServiceView.aspx?eid=" + equipmentInstanceID);
		//}

	}
}