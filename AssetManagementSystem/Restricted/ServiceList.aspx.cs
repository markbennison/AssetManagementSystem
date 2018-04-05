using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AssetManagementSystem._DAL_AMSTableAdapters;

namespace AssetManagementSystem.Restricted
{
	public partial class ServiceList : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			int sID = 0;
			int rID = 0;
			int eID = 0;
			int cID = 0;
			int charge = 0;

			DateTime actionedStartDate;
			DateTime actionedEndDate;

			// Validity checks
			bool valid_sID = Int32.TryParse(txtSearchServiceID.Text.Trim(), out sID);
			bool valid_rID = Int32.TryParse(txtSearchRequirementID.Text.Trim(), out rID);
			bool valid_eID = Int32.TryParse(txtSearchEquipmentID.Text.Trim(), out eID);
			bool valid_cID = Int32.TryParse(txtSearchContractorID.Text.Trim(), out cID);
			bool valid_charge = Int32.TryParse(txtSearchCharge.Text.Trim(), out charge);

			bool valid_actionedStartDate = DateTime.TryParse(txtSearchActionedFrom.Text.Trim(), out actionedStartDate);
			bool valid_actionedEndDate = DateTime.TryParse(txtSearchActionedTo.Text.Trim(), out actionedEndDate);

			string requirementDesc = txtSearchRequirementDesc.Text.Trim();
			string actionedBy = txtSearchActionedBy.Text.Trim();
			string status = txtSearchStatus.Text.Trim();
			string costCode = txtSearchCostCode.Text.Trim();
			string expCode = txtSearchExpCode.Text.Trim();

			//if (requirementDesc == "")
			//{
			//	requirementDesc = null;
			//}
			//if (actionedBy == "")
			//{
			//	actionedBy = null;
			//}

			ServicesTableAdapter serviceAdapter = new ServicesTableAdapter();

			if (valid_actionedStartDate && valid_actionedEndDate)
			{
				LvServiceList.DataSource = serviceAdapter.GetByParameters(sID, rID, eID, cID, requirementDesc, actionedBy, status, charge, costCode, expCode, actionedStartDate, actionedEndDate);
			}
			else if (valid_actionedStartDate)
			{
				LvServiceList.DataSource = serviceAdapter.GetByParameters(sID, rID, eID, cID, requirementDesc, actionedBy, status, charge, costCode, expCode, actionedStartDate, null);
			}
			else if (valid_actionedEndDate)
			{
				LvServiceList.DataSource = serviceAdapter.GetByParameters(sID, rID, eID, cID, requirementDesc, actionedBy, status, charge, costCode, expCode, null, actionedEndDate);
			}
			else
			{
				LvServiceList.DataSource = serviceAdapter.GetByParameters(sID, rID, eID, cID, requirementDesc, actionedBy, status, charge, costCode, expCode, null, null);
			}

			LvServiceList.DataBind();
		}

		protected void LvServiceList_ItemCommand(object sender, ListViewCommandEventArgs e)
		{
			Response.Redirect("~/Restricted/ServiceView.aspx?id=" + e.CommandArgument.ToString());
		}
	}
}