using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AssetManagementSystem._DAL_AMSTableAdapters;

namespace AssetManagementSystem.Restricted
{
	public partial class RequirementList : System.Web.UI.Page
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
			/* *********** Configure DAL *********** */
			ActiveRequirementsTableAdapter activeRequirementAdapter = new ActiveRequirementsTableAdapter();
			//LvActiveRequirementList.DataSource = requirementAdapter.GetActiveRequirements();
			//LvActiveRequirementList.DataSource = requirementAdapter.GetByTest();
			LvActiveRequirementList.DataSource = activeRequirementAdapter.Get();
			LvActiveRequirementList.DataBind();

			RequirementsTableAdapter requirementAdapter = new RequirementsTableAdapter();
			LvRequirementList.DataSource = requirementAdapter.Get();
			LvRequirementList.DataBind();

		}

		protected void LvActiveRequirementList_ItemCommand(object sender, ListViewCommandEventArgs e)
		{
			Response.Redirect("~/Restricted/EquipmentView.aspx?id=" + e.CommandArgument.ToString());
		}

		protected void DataPager_LvActiveRequirementList_PreRender(object sender, EventArgs e)
		{
			ActiveRequirementsTableAdapter activeRequirementAdapter = new ActiveRequirementsTableAdapter();
			LvActiveRequirementList.DataSource = activeRequirementAdapter.Get();
			LvActiveRequirementList.DataBind();
		}

		protected void LvRequirementList_ItemCommand(object sender, ListViewCommandEventArgs e)
		{
			Response.Redirect("~/Restricted/RequirementView.aspx?id=" + e.CommandArgument.ToString());
		}
	}
}