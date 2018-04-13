using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AssetManagementSystem._DAL_AMSTableAdapters;

namespace AssetManagementSystem.Restricted
{
	public partial class RequirementsView : System.Web.UI.Page
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
			int rID = 0;
			bool idValid = Int32.TryParse(queryID, out rID);
			if (rID == 0)
			{
				FvRequirementView.ChangeMode(FormViewMode.Insert);
			}

			/* *********** Configure DAL *********** */
			RequirementsTableAdapter requirementAdapter = new RequirementsTableAdapter();
			FvRequirementView.DataSource = requirementAdapter.GetByID(rID);
			FvRequirementView.DataBind();

			/* ****** Refresh Drop Down Lists ****** */

			if (FvRequirementView.CurrentMode == FormViewMode.Insert)
			{
				string tID = Request.QueryString["tid"];
				//ddlEquipmentTypeRefresh();
				ddlEquipmentTypeRefresh(tID);
			}
			else if (FvRequirementView.CurrentMode == FormViewMode.Edit || FvRequirementView.CurrentMode == FormViewMode.ReadOnly)
			{
				string typeID = DataBinder.Eval(FvRequirementView.DataItem, "EquipmentTypeID").ToString();
				ddlEquipmentTypeRefresh(typeID);
			}
		}

		protected void FvRequirementView_ItemCommand(object sender, FormViewCommandEventArgs e)
		{
			switch (e.CommandName)
			{
				case "New":
					Response.Redirect("~/Restricted/RequirementView.aspx?id=0");
					break;
				case "Cancel":
					FvRequirementView.ChangeMode(FormViewMode.ReadOnly);
					PageDataRefresh();
					break;
				case "ListView":
					Response.Redirect("~/Restricted/RequirementList.aspx");
					break;
			}
		}

		protected void FvRequirementView_ModeChanging(object sender, FormViewModeEventArgs e)
		{
			// Enable a FormView mode change (Read-Only, Edit/Update, New/Insert, Empty)
			FvRequirementView.ChangeMode((FormViewMode)e.NewMode);
			PageDataRefresh();
		}

		protected void FvRequirementView_ItemInserting(object sender, FormViewInsertEventArgs e)
		{
			FvRequirementView_CallInsertOrUpdate("Insert");
		}

		protected void FvRequirementView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
		{
			FvRequirementView_CallInsertOrUpdate("Update");
		}

		protected void FvRequirementView_CallInsertOrUpdate(string CallCommand)
		{
			// Code versions of all controls
			TextBox RequirementID_txt = (TextBox)FvRequirementView.FindControl("txtRequirementID");
			TextBox RequirementDesc_txt = (TextBox)FvRequirementView.FindControl("txtRequirementDesc");
			DropDownList EquipmentTypeID_ddl = (DropDownList)FvRequirementView.FindControl("ddlEquipmentTypeID");
			DropDownList Priority_ddl = (DropDownList)FvRequirementView.FindControl("ddlPriority");
			TextBox FirstImplementation_txt = (TextBox)FvRequirementView.FindControl("txtFirstImplementation");
			TextBox Frequency_txt = (TextBox)FvRequirementView.FindControl("txtFrequency");
			TextBox MaterialsNote_txt = (TextBox)FvRequirementView.FindControl("txtMaterialsNote");
			TextBox LegislationURL_txt = (TextBox)FvRequirementView.FindControl("txtLegislationURL");

			// Assign all text properties of controls to variables
			// Or skip this and assign straight into INSERT/UPDATE parameters
			string requirementDesc = RequirementDesc_txt.Text;
			int equipmentTypeID = Convert.ToInt32(EquipmentTypeID_ddl.Text);
			string priority = Priority_ddl.Text;
			int firstImplementation = Convert.ToInt32(FirstImplementation_txt.Text);
			int frequency = Convert.ToInt32(Frequency_txt.Text);
			string materialsNote = MaterialsNote_txt.Text;
			string legislationURL = LegislationURL_txt.Text;

			RequirementsTableAdapter requirementAdapter = new RequirementsTableAdapter();

			try
			{
				if (CallCommand == "Update")
				{
					int originalID = Convert.ToInt32(RequirementID_txt.Text);

					// Conduct Update
					requirementAdapter.UpdateRecord(requirementDesc, equipmentTypeID, priority, firstImplementation, frequency, materialsNote, legislationURL, originalID);

					ClientScript.RegisterStartupScript(GetType(), "text", "AlertTimeout();", true);

					// Return to Read Only mode
					FvRequirementView.ChangeMode(FormViewMode.ReadOnly);
					PageDataRefresh();
				}
				else if (CallCommand == "Insert")
				{
					
					string newID = requirementAdapter.InsertRecord(requirementDesc, equipmentTypeID, priority, firstImplementation, frequency, materialsNote, legislationURL).ToString();
					ClientScript.RegisterStartupScript(GetType(), "text", "AlertTimeout();", true);
					// Redirect User
					Response.Redirect("~/Restricted/RequirementView.aspx?id=" + newID);
				}
			}
			catch (System.Exception ex)
			{
				Response.Write("<script LANGUAGE='JavaScript' >alert('An ERROR (" + ex.Message + ") occurred connecting to the database.')</script>");
			}
		}

		protected void FvRequirementView_DataBound(object sender, EventArgs e)
		{
			// DataItemCount checks how many records are returned
			// If no records are returned, change to Insert View (new record)
			if (FvRequirementView.DataItemCount == 0)
			{
				FvRequirementView.ChangeMode(FormViewMode.Insert);
			}
			else
			{
				FvRequirementView.ChangeMode(FormViewMode.Edit);
			}
		}



		/* *************************************
		* ********** DDL Index Change **********
		* ************************************* */

		protected void ddlEquipmentTypeID_SelectedIndexChanged(object sender, EventArgs e)
		{
			DropDownList EquipmentTypeID_ddl = (DropDownList)FvRequirementView.FindControl("ddlEquipmentTypeID");
			DropDownList EquipmentTypeDesc_ddl = (DropDownList)FvRequirementView.FindControl("ddlEquipmentTypeDesc");

			EquipmentTypeDesc_ddl.SelectedIndex = EquipmentTypeID_ddl.SelectedIndex;
		}


		protected void ddlEquipmentTypeDesc_SelectedIndexChanged(object sender, EventArgs e)
		{
			DropDownList EquipmentTypeID_ddl = (DropDownList)FvRequirementView.FindControl("ddlEquipmentTypeID");
			DropDownList EquipmentTypeDesc_ddl = (DropDownList)FvRequirementView.FindControl("ddlEquipmentTypeDesc");

			EquipmentTypeID_ddl.SelectedIndex = EquipmentTypeDesc_ddl.SelectedIndex;
		}

		/* *************************************
		* ****** DDL Refresh Subroutines *******
		* ************************************* */

		private void ddlEquipmentTypeRefresh(string TypeIDValue = null, int TypeIDIndex = 0)
		{
			EquipmentTypesTableAdapter typeAdapter = new EquipmentTypesTableAdapter();

			DropDownList EquipmentTypeID_ddl = (DropDownList)FvRequirementView.FindControl("ddlEquipmentTypeID");
			EquipmentTypeID_ddl.DataSource = typeAdapter.Get();
			EquipmentTypeID_ddl.DataValueField = "EquipmentTypeID";
			EquipmentTypeID_ddl.DataTextField = "EquipmentTypeID";
			EquipmentTypeID_ddl.DataBind();

			if (TypeIDValue == "" || TypeIDValue == null || TypeIDValue == "0")
			{
				EquipmentTypeID_ddl.SelectedIndex = TypeIDIndex;
			}
			else if (EquipmentTypeID_ddl.Items.FindByValue(TypeIDValue) != null)
			{
				EquipmentTypeID_ddl.SelectedValue = TypeIDValue;
			}
			else
			{
				EquipmentTypeID_ddl.SelectedIndex = 0;
			}

			//EquipmentTypeID_ddl.DataBind();

			DropDownList EquipmentTypeDesc_ddl = (DropDownList)FvRequirementView.FindControl("ddlEquipmentTypeDesc");
			EquipmentTypeDesc_ddl.DataSource = EquipmentTypeID_ddl.DataSource;
			EquipmentTypeDesc_ddl.DataValueField = "EquipmentTypeID";
			EquipmentTypeDesc_ddl.DataTextField = "EquipmentTypeDesc";
			EquipmentTypeDesc_ddl.SelectedValue = EquipmentTypeID_ddl.SelectedValue;

			EquipmentTypeDesc_ddl.DataBind();
		}

	}
}