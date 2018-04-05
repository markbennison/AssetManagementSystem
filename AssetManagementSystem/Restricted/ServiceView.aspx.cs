using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using AssetManagementSystem._DAL_AMSTableAdapters;

namespace AssetManagementSystem.Restricted
{
	public partial class ServiceView : System.Web.UI.Page
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
			string queryID = Request.QueryString["id"];
			int sID = 0;
			bool idValid = Int32.TryParse(queryID, out sID);
			if (sID == 0)
			{
				FvServiceView.ChangeMode(FormViewMode.Insert);
			}

			/* *********** Configure DAL *********** */
			ServicesTableAdapter servicesAdapter = new ServicesTableAdapter();
			FvServiceView.DataSource = servicesAdapter.GetByID(sID);
			FvServiceView.DataBind();

			/* ****** Refresh Drop Down Lists ****** */
			/* ****** ... AND set date if new ****** */
			string uid, rid, eID;

			if (FvServiceView.CurrentMode == FormViewMode.Insert)
			{
				uid = User.Identity.GetUserId();
				rid = Request.QueryString["rid"];
				eID = Request.QueryString["eid"];

				ddlActionedByRefresh(uid);
				ddlRequirementRefresh(rid);
				ddlEquipmentRefresh(eID);
			}
			else if (FvServiceView.CurrentMode == FormViewMode.Edit || FvServiceView.CurrentMode == FormViewMode.ReadOnly)
			{
				uid = DataBinder.Eval(FvServiceView.DataItem, "ActionedBy").ToString();
				rid = DataBinder.Eval(FvServiceView.DataItem, "RequirementID").ToString();
				eID = DataBinder.Eval(FvServiceView.DataItem, "EquipmentInstanceID").ToString();

				ddlActionedByRefresh(uid);
				ddlRequirementRefresh(rid);
				ddlEquipmentRefresh(eID);
			}

		}

		protected void FvServiceView_ItemCommand(object sender, FormViewCommandEventArgs e)
		{
			switch (e.CommandName)
			{
				case "New":
					Response.Redirect("~/Restricted/ServiceView.aspx?id=0");
					break;
				case "Cancel":
					FvServiceView.ChangeMode(FormViewMode.ReadOnly);
					PageDataRefresh();
					break;
				case "ListView":
					Response.Redirect("~/Restricted/ServiceList.aspx");
					break;
			}
		}

		protected void FvServiceView_ModeChanging(object sender, FormViewModeEventArgs e)
		{
			// Enable a FormView mode change (Read-Only, Edit/Update, New/Insert, Empty)
			FvServiceView.ChangeMode((FormViewMode)e.NewMode);
			PageDataRefresh();
		}

		protected void FvServiceView_ItemInserting(object sender, FormViewInsertEventArgs e)
		{
			FvServiceView_CallInsertOrUpdate("Insert");
		}

		protected void FvServiceView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
		{
			FvServiceView_CallInsertOrUpdate("Update");
		}

		protected void FvServiceView_CallInsertOrUpdate(string CallCommand)
		{
			// Code versions of all controls
			TextBox ServiceID_txt = (TextBox)FvServiceView.FindControl("txtServiceID");
			DropDownList RequirementID_ddl = (DropDownList)FvServiceView.FindControl("ddlRequirementID");
			DropDownList EquipmentID_ddl = (DropDownList)FvServiceView.FindControl("ddlEquipmentID");
			TextBox ContractorID_txt = (TextBox)FvServiceView.FindControl("txtContractorID");
			DropDownList ActionedBy_ddl = (DropDownList)FvServiceView.FindControl("ddlActionedBy");
			Button ActionedOn_btn = (Button)FvServiceView.FindControl("btnActionedOn");
			DropDownList Status_ddl = (DropDownList)FvServiceView.FindControl("ddlStatus");
			TextBox Charge_txt = (TextBox)FvServiceView.FindControl("txtCharge");
			TextBox CostCode_txt = (TextBox)FvServiceView.FindControl("txtCostCode");
			TextBox ExpCode_txt = (TextBox)FvServiceView.FindControl("txtExpCode");
			TextBox Notes_txt = (TextBox)FvServiceView.FindControl("txtNotes");

			// Assign all text properties of controls to variables
			// Or skip this and assign straight into INSERT/UPDATE parameters
			bool validParse = false;
			int requirementID = 0;
			int equipmentID = 0;
			int contractorID = 0;
			DateTime actionedOn = DateTime.Today;
			decimal charge = 0;

			validParse = Int32.TryParse(RequirementID_ddl.SelectedValue, out requirementID);
			validParse = Int32.TryParse(EquipmentID_ddl.SelectedValue, out equipmentID);
			validParse = Int32.TryParse(ContractorID_txt.Text, out contractorID);
			validParse = DateTime.TryParse(ActionedOn_btn.Text, out actionedOn);
			validParse = Decimal.TryParse(Charge_txt.Text, out charge);

			string actionedBy = ActionedBy_ddl.Text;
			string status = Status_ddl.Text;
			string costCode = CostCode_txt.Text;
			string expCode = ExpCode_txt.Text;
			string notes = Notes_txt.Text;

			ServicesTableAdapter serviceAdapter = new ServicesTableAdapter();

			try
			{
				if (CallCommand == "Update")
				{
					int originalID = Convert.ToInt32(ServiceID_txt.Text);

					// Conduct Update
					serviceAdapter.UpdateRecord(requirementID, equipmentID, contractorID, actionedBy, actionedOn, status, charge, costCode, expCode, notes, originalID);

					Response.Write("<script LANGUAGE='JavaScript' >alert('Record Edited')</script>");

					// Return to Read Only mode
					FvServiceView.ChangeMode(FormViewMode.ReadOnly);
					PageDataRefresh();
				}
				else if (CallCommand == "Insert")
				{

					string newID = serviceAdapter.InsertAndReturnID(requirementID, equipmentID, contractorID, actionedBy, actionedOn, status, charge, costCode, expCode, notes).ToString();
					Response.Write("<script LANGUAGE='JavaScript' >alert('Record Added')</script>");
					// Redirect User
					Response.Redirect("~/Restricted/RequirementView.aspx?id=" + newID);
				}
			}
			catch (System.Exception ex)
			{
				Response.Write("<script LANGUAGE='JavaScript' >alert('An ERROR (" + ex.Message + ") occurred connecting to the database.')</script>");
			}
		}

		protected void FvServiceView_DataBound(object sender, EventArgs e)
		{
			// DataItemCount checks how many records are returned
			// If no records are returned, change to Insert View (new record)
			if (FvServiceView.DataItemCount == 0)
			{
				FvServiceView.ChangeMode(FormViewMode.Insert);
			}
			else
			{
				FvServiceView.ChangeMode(FormViewMode.Edit);
			}
		}

		/* *************************************
		* ********** DDL Index Change **********
		* ************************************* */

		protected void ddlRequirementID_SelectedIndexChanged(object sender, EventArgs e)
		{
			DropDownList RequirementID_ddl = (DropDownList)FvServiceView.FindControl("ddlRequirementID");
			DropDownList RequirementDesc_ddl = (DropDownList)FvServiceView.FindControl("ddlRequirementDesc");

			RequirementDesc_ddl.SelectedIndex = RequirementID_ddl.SelectedIndex;
		}

		protected void ddlRequirementDesc_SelectedIndexChanged(object sender, EventArgs e)
		{
			DropDownList RequirementID_ddl = (DropDownList)FvServiceView.FindControl("ddlRequirementID");
			DropDownList RequirementDesc_ddl = (DropDownList)FvServiceView.FindControl("ddlRequirementDesc");

			RequirementID_ddl.SelectedIndex = RequirementDesc_ddl.SelectedIndex;
		}

		/* *************************************
		* ****** DDL Refresh Subroutines *******
		* ************************************* */

		private void ddlActionedByRefresh(string UserIDValue = null, int UserIDIndex = 0)
		{
			UsersAndRolesTableAdapter userAdapter = new UsersAndRolesTableAdapter();

			DropDownList ActionedBy_ddl = (DropDownList)FvServiceView.FindControl("ddlActionedBy");
			ActionedBy_ddl.DataSource = userAdapter.GetUsers();
			ActionedBy_ddl.DataValueField = "UserID";
			ActionedBy_ddl.DataTextField = "UserName";
			ActionedBy_ddl.DataBind();

			if (UserIDValue == "" || UserIDValue == null || UserIDValue == "0")
			{
				ActionedBy_ddl.SelectedIndex = UserIDIndex;
			}
			else if (ActionedBy_ddl.Items.FindByValue(UserIDValue) != null)
			{
				ActionedBy_ddl.SelectedValue = UserIDValue;
			}
			else
			{
				ActionedBy_ddl.SelectedIndex = 0;
			}

		}

		private void ddlRequirementRefresh(string ReqIDValue = null, int ReqIDIndex = 0)
		{
			RequirementsTableAdapter requirementAdapter = new RequirementsTableAdapter();

			DropDownList RequirementID_ddl = (DropDownList)FvServiceView.FindControl("ddlRequirementID");
			RequirementID_ddl.DataSource = requirementAdapter.Get();
			RequirementID_ddl.DataValueField = "RequirementID";
			RequirementID_ddl.DataTextField = "RequirementID";
			RequirementID_ddl.DataBind();

			if (ReqIDValue == "" || ReqIDValue == null || ReqIDValue == "0")
			{
				RequirementID_ddl.SelectedIndex = ReqIDIndex;
			}
			else if (RequirementID_ddl.Items.FindByValue(ReqIDValue) != null)
			{
				RequirementID_ddl.SelectedValue = ReqIDValue;
			}
			else
			{
				RequirementID_ddl.SelectedIndex = 0;
			}

			DropDownList RequirementDesc_ddl = (DropDownList)FvServiceView.FindControl("ddlRequirementDesc");
			RequirementDesc_ddl.DataSource = RequirementID_ddl.DataSource;
			RequirementDesc_ddl.DataValueField = "RequirementID";
			RequirementDesc_ddl.DataTextField = "RequirementDesc";
			RequirementDesc_ddl.SelectedValue = RequirementID_ddl.SelectedValue;

			RequirementDesc_ddl.DataBind();
		}

		private void ddlEquipmentRefresh(string IDValue = null, int IDIndex = 0)
		{
			EquipmentInstanceTableAdapter equipmentAdapter = new EquipmentInstanceTableAdapter();

			DropDownList EquipmentID_ddl = (DropDownList)FvServiceView.FindControl("ddlEquipmentID");
			EquipmentID_ddl.DataSource = equipmentAdapter.Get();
			EquipmentID_ddl.DataValueField = "EquipmentInstanceID";
			EquipmentID_ddl.DataTextField = "EquipmentInstanceID";
			EquipmentID_ddl.DataBind();

			if (IDValue == "" || IDValue == null || IDValue == "0")
			{
				EquipmentID_ddl.SelectedIndex = IDIndex;
			}
			else if (EquipmentID_ddl.Items.FindByValue(IDValue) != null)
			{
				EquipmentID_ddl.SelectedValue = IDValue;
			}
			else
			{
				EquipmentID_ddl.SelectedIndex = 0;
			}
		}

		protected void btnActionedOn_Click(object sender, EventArgs e)
		{
			
			Calendar ActionedOn_cal = (Calendar)FvServiceView.FindControl("calActionedOn");
			Button ActionedOn_btn = (Button)FvServiceView.FindControl("btnActionedOn");

			if (ActionedOn_cal.Visible == false)
			{
				ActionedOn_cal.Visible = true;
				ActionedOn_cal.SelectedDate = Convert.ToDateTime(ActionedOn_btn.Text);
				ActionedOn_cal.VisibleDate = ActionedOn_cal.SelectedDate;
				ActionedOn_cal.Focus();
			}
			else
			{
				ActionedOn_cal.Visible = false;
			}

		}

		protected void calActionedOn_SelectionChanged(object sender, EventArgs e)
		{
			Calendar ActionedOn_cal = (Calendar)FvServiceView.FindControl("calActionedOn");
			Button ActionedOn_btn = (Button)FvServiceView.FindControl("btnActionedOn");

			ActionedOn_cal.Visible = false;
			ActionedOn_btn.Text = ActionedOn_cal.SelectedDate.ToString("dd/MM/yyyy");
		}
	}
}