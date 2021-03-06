﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AssetManagementSystem._DAL_AMSTableAdapters;

namespace AssetManagementSystem.Restricted
{
    public partial class SiteView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PageDataRefresh();
            }
        }

        /* *************************************
		* ************ Page Refresh ************
		* ************************************* */

		private void PageDataRefresh()
		{
			string sID = Request.QueryString["id"];
			if (sID == null || sID == "0")
			{
                sID = "0";
				FvSiteView.ChangeMode(FormViewMode.Insert);
			}

            // If sID needs to be integer...
			// int siteID = Convert.ToInt32(sID.ToString());

            /* *********** Configure DAL *********** */
            SitesTableAdapter siteAdapter = new SitesTableAdapter();
            FvSiteView.DataSource = siteAdapter.GetByID(sID);
            FvSiteView.DataBind();

			BuildingsTableAdapter buildingsAdapter = new BuildingsTableAdapter();
			LvBuildingList.DataSource = buildingsAdapter.GetBySiteID(sID);
			LvBuildingList.DataBind();

			if (FvSiteView.CurrentMode == FormViewMode.ReadOnly || FvSiteView.CurrentMode == FormViewMode.Edit)
			{
				/* ****** Show 'Add New' buttons on sub-lists ****** */
				btnAddNew.Visible = true;
			}
			else if (FvSiteView.CurrentMode == FormViewMode.Insert)
			{
				/* ****** Hide 'Add New' buttons on sub-lists ****** */
				btnAddNew.Visible = false;
			}
		}

		/* *************************************
		* ******** FormView Subroutines ********
		* ************************************* */
		protected void FvSiteView_DataBound(object sender, EventArgs e)
		{
			// DataItemCount checks how many records are returned
			// If no records are returned, change to Insert View (new record)
			if (FvSiteView.DataItemCount == 0)
			{
				FvSiteView.ChangeMode(FormViewMode.Insert);
			}
			else
			{
				FvSiteView.ChangeMode(FormViewMode.Edit);
			}
		}

        protected void FvSiteView_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "New":
                    Response.Redirect("~/Restricted/SiteView.aspx?id=0");
                    break;
                case "Cancel":
                    FvSiteView.ChangeMode(FormViewMode.ReadOnly);
                    PageDataRefresh();
                    break;
                case "ListView":
                    Response.Redirect("~/Restricted/SiteList.aspx");
                    break;
            }
        }

        protected void FvSiteView_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            // Enable a FormView mode change (Read-Only, Edit/Update, New/Insert, Empty)
            FvSiteView.ChangeMode((FormViewMode)e.NewMode);
            PageDataRefresh();
        }

        protected void FvSiteView_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            FvSiteView_CallInsertOrUpdate("Insert");
        }

        protected void FvSiteView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            FvSiteView_CallInsertOrUpdate("Update");
        }

        protected void FvSiteView_CallInsertOrUpdate(string CallCommand)
        {
            // Code versions of all controls
            TextBox siteID_txt = (TextBox)FvSiteView.FindControl("txtSiteID");
            TextBox siteName_txt = (TextBox)FvSiteView.FindControl("txtSiteName");
            TextBox address1_txt = (TextBox)FvSiteView.FindControl("txtAddress1");
            TextBox address2_txt = (TextBox)FvSiteView.FindControl("txtAddress2");
            TextBox city_txt = (TextBox)FvSiteView.FindControl("txtCity");
            TextBox postCode_txt = (TextBox)FvSiteView.FindControl("txtPostCode");
            TextBox status_txt = (TextBox)FvSiteView.FindControl("txtStatus");

            // Assign all text properties of controls to variables
            // Or skip this and assign straight into INSERT/UPDATE parameters
            string siteID = siteID_txt.Text;
            string siteName = siteName_txt.Text;
            string address1 = address1_txt.Text;
            string address2 = address2_txt.Text;
            string city = city_txt.Text;
            string postCode = postCode_txt.Text;
            string status = status_txt.Text;

            SitesTableAdapter siteAdapter = new SitesTableAdapter();

            try
            {
                if (CallCommand == "Update")
                {
                    string originalID = Request.QueryString["id"].ToString();

                    // Conduct Update
                    //this.Validate();
                    siteAdapter.UpdateRecord(siteID, siteName, status, address1, address2, city, postCode, originalID);

					ClientScript.RegisterStartupScript(GetType(), "text", "AlertTimeout();", true);

					// Return to Read Only mode
					FvSiteView.ChangeMode(FormViewMode.ReadOnly);
                    PageDataRefresh();
                }
                else if (CallCommand == "Insert")
                {
                    siteAdapter.InsertRecord(siteID, siteName, status, address1, address2, city, postCode);
					//string newID = siteAdapter.InsertAndReturnID(siteID, siteName, address1, address2, city, postCode, status).ToString();
					ClientScript.RegisterStartupScript(GetType(), "text", "AlertTimeout();", true);
					// Redirect User
					Response.Redirect("~/Restricted/SiteView.aspx?id=" + siteID);
                }
            }
            catch (System.Exception ex)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('An ERROR (" + ex.Message + ") occurred connecting to the database.')</script>");
            }
        }

		protected void LvBuildingList_ItemCommand(object sender, ListViewCommandEventArgs e)
		{
			Response.Redirect("~/Restricted/BuildingView.aspx?id=" + e.CommandArgument.ToString());
		}
	}
}
 