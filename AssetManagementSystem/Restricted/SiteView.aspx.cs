using System;
using System.Collections.Generic;
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
            SiteTableAdapter siteAdapter = new SiteTableAdapter();
            FvSiteView.DataSource = siteAdapter.GetByID(sID);
            FvSiteView.DataBind();

        }

		/* *************************************
		* ******** FormView Subroutines ********
		* ************************************* */

		protected void FvSiteView_DataBound(object sender, EventArgs e)
		{
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

        }

        protected void FvSiteView_ModeChanging(object sender, FormViewModeEventArgs e)
        {

        }

        protected void FvSiteView_ItemInserting(object sender, FormViewInsertEventArgs e)
        {

        }

        protected void FvSiteView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {

        }
    }
}