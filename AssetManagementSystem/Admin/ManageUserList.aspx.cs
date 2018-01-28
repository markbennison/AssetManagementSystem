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
			string uEmail = txtEmail.Text.ToString();
			string uPhone = txtPhoneNumber.Text.ToString();
			string uUsername = txtUserName.Text.ToString();
			string rRoleID = txtRoleID.Text.ToString();
			string rName = txtName.Text.ToString();

			UsersAndRolesTableAdapter userRolesAdapter = new UsersAndRolesTableAdapter();
			//LvUserList.DataSource = userRolesAdapter.GetUsersByParameters(uEmail, uPhone, uUsername, rRoleID, rName);
			LvUserList.DataSource = userRolesAdapter.GetUsersRolesByParameters(uEmail, uPhone, uUsername, rRoleID, rName);
			//LvUserList.DataSource = userRolesAdapter.GetUsersByParameters_MergeRoles(uEmail, uPhone, uUsername);
			//LvUserList.DataSource = userRolesAdapter.GetUsersRoles();
			//LvUserList.DataSource = userRolesAdapter.GetUsersRoleNames();
			LvUserList.DataBind();
		}

		protected void LvUserList_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            Response.Redirect("~/Admin/ManageUserView.aspx?id=" + e.CommandArgument.ToString());
        }
	}
}