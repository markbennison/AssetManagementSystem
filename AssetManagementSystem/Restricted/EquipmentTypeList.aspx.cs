using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AssetManagementSystem._DAL_AMSTableAdapters;

namespace AssetManagementSystem.Restricted
{
	public partial class EquipmentTypeList : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			int etID = 0;
			int etSupplerID = 0;

			bool valid_eID = Int32.TryParse(txtSearchEquipmentTypeID.Text.Trim(), out etID);
			bool valid_eTypeID = Int32.TryParse(txtSearchSupplierID.Text.Trim(), out etSupplerID);

			string etDesc = txtSearchEquipmentTypeDesc.Text.Trim();
			string etModelNo = txtSearchEquipmentModelNo.Text.Trim();
			

			EquipmentTypesTableAdapter eTypeAdapter = new EquipmentTypesTableAdapter();
			LvEquipmentTypeList.DataSource = eTypeAdapter.GetByParameters(etID, etDesc, etModelNo, etSupplerID);
			LvEquipmentTypeList.DataBind();
		}

		protected void LvEquipmentTypeList_ItemCommand(object sender, ListViewCommandEventArgs e)
		{
			Response.Redirect("~/Restricted/EquipmentTypeView.aspx?id=" + e.CommandArgument.ToString());
		}
	}
}