using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AssetManagementSystem._DAL_AMSTableAdapters;

namespace AssetManagementSystem.Restricted
{
	public partial class ManageUserList : System.Web.UI.Page
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
			string uEmail = txtEmail.Text.ToString();
			string uPhone = txtPhoneNumber.Text.ToString();
			string uUsername = txtUserName.Text.ToString();
			string rRoleID = txtRoleID.Text.ToString();
			string rName = txtName.Text.ToString();

			UsersAndRolesTableAdapter userRolesAdapter = new UsersAndRolesTableAdapter();
			LvUserList.DataSource = userRolesAdapter.GetUsersRolesByParameters(uEmail, uPhone, uUsername, rRoleID, rName);
			LvUserList.DataBind();
		}

		protected void LvUserList_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            Response.Redirect("~/Admin/ManageUserView.aspx?id=" + e.CommandArgument.ToString());
        }

		protected void DataPager_LvUserList_PreRender(object sender, EventArgs e)
		{
			PageDataRefresh();
		}
	}
}