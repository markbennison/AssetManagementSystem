using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AssetManagementSystem._DAL_AMSTableAdapters;

namespace AssetManagementSystem.Restricted
{
	public partial class LocationView : System.Web.UI.Page
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
			int locID = Convert.ToInt32(Request.QueryString["id"]);
			if (locID == 0)
			{
				locID = 0;
				FvLocationView.ChangeMode(FormViewMode.Insert);
			}

			/* *********** Configure DataSources *********** */
			LocationsTableAdapter locationsAdapter = new LocationsTableAdapter();
			FvLocationView.DataSource = locationsAdapter.GetByID(locID);
			FvLocationView.DataBind();

			/* ****** Refresh Drop Down Lists ****** */
			ddlBuildingsRefresh();
			ddlEquipmentTypeIDRefresh();

		}

		protected void FvLocationView_ItemCommand(object sender, FormViewCommandEventArgs e)
		{
			switch (e.CommandName)
			{
				case "New":
					Response.Redirect("~/Restricted/LocationView.aspx?id=0");
					break;
				case "Cancel":
					FvLocationView.ChangeMode(FormViewMode.ReadOnly);
					PageDataRefresh();
					break;
				case "ListView":
					Response.Redirect("~/Restricted/SiteList.aspx");
					break;
			}
		}

		protected void FvLocationView_ModeChanging(object sender, FormViewModeEventArgs e)
		{
			FvLocationView.ChangeMode((FormViewMode)e.NewMode);
			PageDataRefresh();
		}

		protected void FvLocationView_ItemInserting(object sender, FormViewInsertEventArgs e)
		{
			FvLocationView_CallInsertOrUpdate("Insert");
		}

		protected void FvLocationView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
		{
			FvLocationView_CallInsertOrUpdate("Update");
		}

		protected void FvLocationView_DataBound(object sender, EventArgs e)
		{
			if (FvLocationView.DataItemCount == 0)
			{
				FvLocationView.ChangeMode(FormViewMode.Insert);
			}
			else
			{
				FvLocationView.ChangeMode(FormViewMode.Edit);
			}
		}

		protected void FvLocationView_CallInsertOrUpdate(string CallCommand)
		{
			// Code versions of all controls
			TextBox locationID_txt = (TextBox)FvLocationView.FindControl("txtLocationID");
			TextBox locationEasyName_txt = (TextBox)FvLocationView.FindControl("txtLocationEasyName");
			DropDownList Building_ddl = (DropDownList)FvLocationView.FindControl("ddlBuilding");
			DropDownList LocationType_ddl = (DropDownList)FvLocationView.FindControl("ddlLocationType");

			// Assign all text properties of controls to variables
			// Or skip this and assign straight into INSERT/UPDATE parameters
			int locationID = Convert.ToInt32(locationID_txt.Text);
			string locationEasyName = locationEasyName_txt.Text;
			string buildingID = Building_ddl.SelectedValue;
			string locationTypeID = LocationType_ddl.SelectedValue;

			LocationsTableAdapter locationsAdapter = new LocationsTableAdapter();

			try
			{
				if (CallCommand == "Update")
				{
					int originalID = Convert.ToInt32(Request.QueryString["id"]);

					// Conduct Update
					locationsAdapter.UpdateRecord(locationEasyName, locationTypeID, buildingID, originalID);
					
					Response.Write("<script LANGUAGE='JavaScript' >alert('Record Edited')</script>");

					// Return to Read Only mode
					FvLocationView.ChangeMode(FormViewMode.ReadOnly);
					PageDataRefresh();
				}
				else if (CallCommand == "Insert")
				{
					string newID = locationsAdapter.InsertAndReturnID(locationEasyName, locationTypeID, buildingID).ToString();
					Response.Write("<script LANGUAGE='JavaScript' >alert('Record Added')</script>");
					// Redirect User
					Response.Redirect("~/Restricted/BuildingView.aspx?id=" + newID);
				}
			}
			catch (System.Exception ex)
			{
				Response.Write("<script LANGUAGE='JavaScript' >alert('An ERROR occurred connecting to the database.')</script>");
			}
		}

		/* *************************************
		* ****** DDL Refresh Subroutines *******
		* ************************************* */
		//private void ddlSiteRefresh(string ddlSiteValue = "", int ddlSiteIndex = 0)
		private void ddlBuildingsRefresh()
		{
			BuildingsTableAdapter buildingAdapter = new BuildingsTableAdapter();

			DropDownList building_ddl = (DropDownList)FvLocationView.FindControl("ddlBuilding");
			building_ddl.DataSource = buildingAdapter.Get();
			building_ddl.DataValueField = "BuildingID";
			building_ddl.DataTextField = "BuildingName";

			if (FvLocationView.CurrentMode == FormViewMode.Edit || FvLocationView.CurrentMode == FormViewMode.ReadOnly)
			{
				string buildingID = DataBinder.Eval(FvLocationView.DataItem, "BuildingID").ToString();
				building_ddl.SelectedValue = buildingID;
			}
			else
			{
				building_ddl.SelectedIndex = 0;
			}

			building_ddl.DataBind();
		}

		private void ddlEquipmentTypeIDRefresh()
		{
			LocationTypesTableAdapter locationTypeAdapter = new LocationTypesTableAdapter();

			DropDownList locationType_ddl = (DropDownList)FvLocationView.FindControl("ddlLocationType");
			locationType_ddl.DataSource = locationTypeAdapter.Get();
			locationType_ddl.DataValueField = "LocationTypeID";
			locationType_ddl.DataTextField = "LocationTypeCaption";

			if (FvLocationView.CurrentMode == FormViewMode.Edit || FvLocationView.CurrentMode == FormViewMode.ReadOnly)
			{
				string locationTypeID = DataBinder.Eval(FvLocationView.DataItem, "LocationTypeID").ToString();
				locationType_ddl.SelectedValue = locationTypeID;
			}
			else
			{
				locationType_ddl.SelectedIndex = 0;
			}

			locationType_ddl.DataBind();
		}
	}
}