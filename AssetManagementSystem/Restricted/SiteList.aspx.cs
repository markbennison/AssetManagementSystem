using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AssetManagementSystem._DAL_AMSTableAdapters;

namespace AssetManagementSystem
{
    public partial class SiteList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sID = txtSearchSiteID.Text.ToString();
            string sName = txtSearchSiteName.Text.ToString();
            string sStatus = txtSearchStatus.Text.ToString();
            string sAddress1 = txtSearchAddress1.Text.ToString();
            string sAddress2 = txtSearchAddress2.Text.ToString();
            string sCity = txtSearchCity.Text.ToString();
            string sPostCode = txtSearchPostCode.Text.ToString();

            SitesTableAdapter siteAdapter = new SitesTableAdapter();
            LvSiteList.DataSource = siteAdapter.GetByParameters(sID, sName, sStatus, sAddress1, sAddress2, sCity, sPostCode);
            LvSiteList.DataBind();
        }

        protected void LvSiteList_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            Response.Redirect("~/Restricted/SiteView.aspx?id=" + e.CommandArgument.ToString());
        }
    }
}