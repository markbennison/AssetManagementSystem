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
			//string etID = txtSearchEquipmentTypeID.Text.ToString();
			//string erDesc = txtSearchEquipmentTypeDesc.Text.ToString();
			//string etModelNo = txtSearchEquipmentModelNo.Text.ToString();
			//string etSupplerID = txtSearchSupplierID.Text.ToString();

			EquipmentTypesTableAdapter eTypeAdapter = new EquipmentTypesTableAdapter();
			LvEquipmentTypeList.DataSource = eTypeAdapter.Get();
			LvEquipmentTypeList.DataBind();
		}

		protected void LvEquipmentTypeList_ItemCommand(object sender, ListViewCommandEventArgs e)
		{
			Response.Redirect("~/Restricted/EquipmentTypeView.aspx?id=" + e.CommandArgument.ToString());
		}
	}
}