using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AssetManagementSystem._DAL_AMSTableAdapters;

namespace AssetManagementSystem.Admin
{
	public partial class ManageUserView : System.Web.UI.Page
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
			string uID = Request.QueryString["id"];
			if (uID == null || uID == "0")
			{
				Response.Redirect("~/Admin/RegisterUser.aspx");
			}

			/* *********** Configure DAL *********** */
			UsersAndRolesTableAdapter userAdapter = new UsersAndRolesTableAdapter();
			FvUserView.DataSource = userAdapter.GetUserByID(uID);
			FvUserView.DataBind();
		}

		protected void FvUserView_ItemCommand(object sender, FormViewCommandEventArgs e)
		{
			switch (e.CommandName)
			{
				case "New":
					Response.Redirect("~/Admin/RegisterUser.aspx");
					break;
				case "Cancel":
					FvUserView.ChangeMode(FormViewMode.ReadOnly);
					PageDataRefresh();
					break;
				case "ListView":
					Response.Redirect("~/Admin/ManageUserList.aspx");
					break;
			}
		}

		protected void FvUserView_ModeChanging(object sender, FormViewModeEventArgs e)
		{
			// Enable a FormView mode change (Read-Only, Edit/Update, New/Insert, Empty)
			FvUserView.ChangeMode((FormViewMode)e.NewMode);
			PageDataRefresh();
		}

		protected void FvUserView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
		{
			// Code versions of all controls
			TextBox Email_txt = (TextBox)FvUserView.FindControl("txtEmail");
			TextBox PhoneNumber_txt = (TextBox)FvUserView.FindControl("txtPhoneNumber");
			TextBox UserName_txt = (TextBox)FvUserView.FindControl("txtUserName");

			string email = Email_txt.Text;
			string phoneNumber = PhoneNumber_txt.Text;
			string userName = UserName_txt.Text;

			UsersAndRolesTableAdapter userAdapter = new UsersAndRolesTableAdapter();

			try
			{
				string originalID = Request.QueryString["id"].ToString();

				// Conduct Update
				userAdapter.UpdateRecord(email, phoneNumber, userName, originalID);

				Response.Write("<script LANGUAGE='JavaScript' >alert('Record Edited')</script>");

				// Return to Read Only mode
				FvUserView.ChangeMode(FormViewMode.ReadOnly);
				PageDataRefresh();
			}
			catch (System.Exception ex)
			{
				Response.Write("<script LANGUAGE='JavaScript' >alert('An ERROR (" + ex.Message + ") occurred connecting to the database.')</script>");
			}


		}

		protected void FvUserView_DataBound(object sender, EventArgs e)
		{
			// DataItemCount checks how many records are returned
			// If no records are returned, redirect to the User List
			if (FvUserView.DataItemCount == 0)
			{
				Response.Redirect("~/Admin/ManageUserList.aspx");
			}
			else
			{
				FvUserView.ChangeMode(FormViewMode.Edit);
			}
		}
	}
}