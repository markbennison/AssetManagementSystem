using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AssetManagementSystem._DAL_AMSTableAdapters;

namespace AssetManagementSystem.Restricted
{
	public partial class BuildingView : System.Web.UI.Page
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
			string bID = Request.QueryString["id"];
			if (bID == null || bID == "0")
			{
				bID = "0";
				FvBuildingView.ChangeMode(FormViewMode.Insert);
			}

			/* *********** Configure DataSources *********** */
			BuildingsTableAdapter buildingsAdapter = new BuildingsTableAdapter();
			FvBuildingView.DataSource = buildingsAdapter.GetByID(bID);
			FvBuildingView.DataBind();

			LocationsTableAdapter locationsAdapter = new LocationsTableAdapter();
			LvLocationList.DataSource = locationsAdapter.GetByBuildingID(bID);
			LvLocationList.DataBind();

			/* ****** Refresh Drop Down Lists ****** */
			ddlSiteRefresh();

			if (FvBuildingView.CurrentMode == FormViewMode.ReadOnly || FvBuildingView.CurrentMode == FormViewMode.Edit)
			{
				/* ****** Show 'Add New' buttons on sub-lists ****** */
				btnAddNew.Visible = true;
			}
			else if (FvBuildingView.CurrentMode == FormViewMode.Insert)
			{
				/* ****** Hide 'Add New' buttons on sub-lists ****** */
				btnAddNew.Visible = false;
			}
		}

		protected void FvBuildingView_ItemCommand(object sender, FormViewCommandEventArgs e)
		{
			switch (e.CommandName)
			{
				case "New":
					Response.Redirect("~/Restricted/BuildingView.aspx?id=0");
					break;
				case "Cancel":
					FvBuildingView.ChangeMode(FormViewMode.ReadOnly);
					PageDataRefresh();
					break;
				case "ListView":
					Response.Redirect("~/Restricted/SiteList.aspx");
					break;
			}

		}

		protected void FvBuildingView_ModeChanging(object sender, FormViewModeEventArgs e)
		{
			// Enable a FormView mode change (Read-Only, Edit/Update, New/Insert, Empty)
			FvBuildingView.ChangeMode((FormViewMode)e.NewMode);
			PageDataRefresh();

		}

		protected void FvBuildingView_ItemInserting(object sender, FormViewInsertEventArgs e)
		{
			FvBuildingView_CallInsertOrUpdate("Insert");
		}

		protected void FvBuildingView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
		{
			FvBuildingView_CallInsertOrUpdate("Update");
		}

		protected void FvBuildingView_DataBound(object sender, EventArgs e)
		{
			if (FvBuildingView.DataItemCount == 0)
			{
				FvBuildingView.ChangeMode(FormViewMode.Insert);
			}
			else
			{
				FvBuildingView.ChangeMode(FormViewMode.Edit);
			}
		}

		protected void FvBuildingView_CallInsertOrUpdate(string CallCommand)
		{
			// Code versions of all controls
			TextBox buildingID_txt = (TextBox)FvBuildingView.FindControl("txtBuildingID");
			TextBox buildingName_txt = (TextBox)FvBuildingView.FindControl("txtBuildingName");
			DropDownList site_ddl = (DropDownList)FvBuildingView.FindControl("ddlSite");

			// Assign all text properties of controls to variables
			// Or skip this and assign straight into INSERT/UPDATE parameters
			string buildingID = buildingID_txt.Text;
			string buildingName = buildingName_txt.Text;
			string siteID = site_ddl.SelectedValue;

			BuildingsTableAdapter buildingsAdapter = new BuildingsTableAdapter();

			try
			{
				if (CallCommand == "Update")
				{
					string originalID = Request.QueryString["id"].ToString();

					// Conduct Update
					buildingsAdapter.UpdateRecord(buildingID, buildingName, siteID, originalID);

					ClientScript.RegisterStartupScript(GetType(), "text", "AlertTimeout();", true);

					// Return to Read Only mode
					FvBuildingView.ChangeMode(FormViewMode.ReadOnly);
					PageDataRefresh();
				}
				else if (CallCommand == "Insert")
				{
					buildingsAdapter.InsertRecord(buildingID, buildingName, siteID);
					//string newID = siteAdapter.InsertAndReturnID(siteID, siteName, address1, address2, city, postCode, status).ToString();
					ClientScript.RegisterStartupScript(GetType(), "text", "AlertTimeout();", true);
					// Redirect User
					Response.Redirect("~/Restricted/BuildingView.aspx?id=" + buildingID);
				}
			}
			catch (System.Exception ex)
			{
				Response.Write("<script LANGUAGE='JavaScript' >alert('An ERROR (" + ex.Message + ") occurred connecting to the database.')</script>");
			}
		}

		/* *************************************
		* ****** DDL Refresh Subroutines *******
		* ************************************* */
		//private void ddlSiteRefresh(string ddlSiteValue = "", int ddlSiteIndex = 0)
		private void ddlSiteRefresh()
		{
			SitesTableAdapter siteAdapter = new SitesTableAdapter();

			DropDownList site_ddl = (DropDownList)FvBuildingView.FindControl("ddlSite");
			site_ddl.DataSource = siteAdapter.Get();
			site_ddl.DataValueField = "SiteID";
			site_ddl.DataTextField = "SiteName";

			if (FvBuildingView.CurrentMode == FormViewMode.Edit || FvBuildingView.CurrentMode == FormViewMode.ReadOnly)
			{
				string siteID = DataBinder.Eval(FvBuildingView.DataItem, "SiteID").ToString();
				site_ddl.SelectedValue = siteID;
			}
			else
			{
				site_ddl.SelectedIndex = 0;
			}

			site_ddl.DataBind();
		}

		protected void LvLocationList_ItemCommand(object sender, ListViewCommandEventArgs e)
		{
			Response.Redirect("~/Restricted/LocationView.aspx?id=" + e.CommandArgument.ToString());
		}
	}
}