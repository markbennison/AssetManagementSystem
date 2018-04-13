using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AssetManagementSystem._DAL_AMSTableAdapters;

namespace AssetManagementSystem.Restricted
{
	public partial class EquipmentList : System.Web.UI.Page
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
			int eID = 0;
			int eTypeID = 0;
			int eLocID = 0;

			DateTime eInstStartDate;
			DateTime eInstEndDate;

			// Validity checks
			bool valid_eID = Int32.TryParse(txtSearchEquipmentInstanceID.Text.Trim(), out eID);
			bool valid_eTypeID = Int32.TryParse(txtSearchEquipmentTypeID.Text.Trim(), out eTypeID);
			bool valid_eLocID = Int32.TryParse(txtSearchLocationID.Text.Trim(), out eLocID);

			bool valid_eInstStartDate = DateTime.TryParse(txtSearchInstallationStartDate.Text.Trim(), out eInstStartDate);
			bool valid_eInstEndDate = DateTime.TryParse(txtSearchInstallationEndDate.Text.Trim(), out eInstEndDate);

			string eStatus = txtSearchStatus.Text.Trim();
			string eSerialNo = txtSearchSerialNumber.Text.Trim();

			if (eStatus == "")
			{
				eStatus = null;
			}
			if (eSerialNo == "")
			{
				eSerialNo = null;
			}

			EquipmentInstanceTableAdapter equipmentAdapter = new EquipmentInstanceTableAdapter();

			if (valid_eInstStartDate && valid_eInstEndDate)
			{
				LvEquipmentList.DataSource = equipmentAdapter.GetByParameters(eID, eTypeID, eStatus, eSerialNo, eLocID, eInstStartDate, eInstEndDate);
			}
			else if (valid_eInstStartDate)
			{
				LvEquipmentList.DataSource = equipmentAdapter.GetByParameters(eID, eTypeID, eStatus, eSerialNo, eLocID, eInstStartDate, null);
			}
			else if (valid_eInstEndDate)
			{
				LvEquipmentList.DataSource = equipmentAdapter.GetByParameters(eID, eTypeID, eStatus, eSerialNo, eLocID, null, eInstEndDate);
			}
			else
			{
				LvEquipmentList.DataSource = equipmentAdapter.GetByParameters(eID, eTypeID, eStatus, eSerialNo, eLocID, null, null);
			}

			LvEquipmentList.DataBind();
		}

		protected void LvEquipmentList_ItemCommand(object sender, ListViewCommandEventArgs e)
		{
			Response.Redirect("~/Restricted/EquipmentView.aspx?id=" + e.CommandArgument.ToString());
		}

		protected void DataPager_LvEquipmentList_PreRender(object sender, EventArgs e)
		{
			PageDataRefresh();
		}
	}
}