using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AssetManagementSystem._DAL_AMSTableAdapters;

namespace AssetManagementSystem.Restricted
{
	public partial class EquipmentTypeView : System.Web.UI.Page
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
			int etID = 0;
			bool idValid = Int32.TryParse(queryID, out etID);
			if (etID == 0)
			{
				FvEquipmentTypeView.ChangeMode(FormViewMode.Insert);
			}

			/* *********** Configure DAL *********** */
			EquipmentTypesTableAdapter equipmentTypeAdapter = new EquipmentTypesTableAdapter();
			FvEquipmentTypeView.DataSource = equipmentTypeAdapter.GetByID(etID);
			FvEquipmentTypeView.DataBind();

			RequirementsTableAdapter requirementAdapter = new RequirementsTableAdapter();
			LvRequirementList.DataSource = requirementAdapter.GetByEquipmentTypeID(etID);
			LvRequirementList.DataBind();

			int etTypeID = Convert.ToInt32(Request.QueryString["id"]);
			EquipmentInstanceTableAdapter equipmentAdapter = new EquipmentInstanceTableAdapter();
			LvEquipmentList.DataSource = equipmentAdapter.GetByEquipmentType(etTypeID);
			LvEquipmentList.DataBind();

		}

		protected void FvEquipmentTypeView_ItemCommand(object sender, FormViewCommandEventArgs e)
		{
			switch (e.CommandName)
			{
				case "New":
					Response.Redirect("~/Restricted/EquipmentTypeView.aspx?id=0");
					break;
				case "Cancel":
					FvEquipmentTypeView.ChangeMode(FormViewMode.ReadOnly);
					PageDataRefresh();
					break;
				case "ListView":
					Response.Redirect("~/Restricted/EquipmentTypeList.aspx");
					break;
			}
		}

		protected void FvEquipmentTypeView_ModeChanging(object sender, FormViewModeEventArgs e)
		{
			// Enable a FormView mode change (Read-Only, Edit/Update, New/Insert, Empty)
			FvEquipmentTypeView.ChangeMode((FormViewMode)e.NewMode);
			PageDataRefresh();
		}

		protected void FvEquipmentTypeView_ItemInserting(object sender, FormViewInsertEventArgs e)
		{
			FvEquipmentTypeView_CallInsertOrUpdate("Insert");
		}

		protected void FvEquipmentTypeView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
		{
			FvEquipmentTypeView_CallInsertOrUpdate("Update");
		}

		protected void FvEquipmentTypeView_CallInsertOrUpdate(string CallCommand)
		{
			// Code versions of all controls
			TextBox EquipmentTypeID_txt = (TextBox)FvEquipmentTypeView.FindControl("txtEquipmentTypeID");
			TextBox EquipmentTypeDesc_txt = (TextBox)FvEquipmentTypeView.FindControl("txtEquipmentTypeDesc");
			TextBox EquipmentModelNo_txt = (TextBox)FvEquipmentTypeView.FindControl("txtEquipmentModelNo");
			TextBox SupplierID_txt = (TextBox)FvEquipmentTypeView.FindControl("txtSupplierID");

			// Assign all text properties of controls to variables
			// Or skip this and assign straight into INSERT/UPDATE parameters
			int equipmentTypeID = Convert.ToInt32(Request.QueryString["id"]);
			string equipmentTypeDesc = EquipmentTypeDesc_txt.Text;
			string equipmentModelNo = EquipmentModelNo_txt.Text;
			int supplierID =Convert.ToInt32(SupplierID_txt.Text);

			EquipmentTypesTableAdapter equipmentTypeAdapter = new EquipmentTypesTableAdapter();

			try
			{
				if (CallCommand == "Update")
				{
					// Conduct Update
					equipmentTypeAdapter.UpdateRecord(equipmentTypeDesc, equipmentModelNo, supplierID, equipmentTypeID);

					Response.Write("<script LANGUAGE='JavaScript' >alert('Record Edited')</script>");

					// Return to Read Only mode
					FvEquipmentTypeView.ChangeMode(FormViewMode.ReadOnly);
					PageDataRefresh();
				}
				else if (CallCommand == "Insert")
				{
					equipmentTypeAdapter.InsertRecord(equipmentTypeDesc, equipmentModelNo, supplierID);
					//string newID = siteAdapter.InsertAndReturnID(siteID, siteName, address1, address2, city, postCode, status).ToString();
					Response.Write("<script LANGUAGE='JavaScript' >alert('Record Added')</script>");
					// Redirect User
					Response.Redirect("~/Restricted/EquipmentTypeView.aspx?id=" + equipmentTypeID);
				}
			}
			catch (System.Exception ex)
			{
				Response.Write("<script LANGUAGE='JavaScript' >alert('An ERROR occurred connecting to the database. " + ex.Message + "')</script>");
			}
		}

		protected void FvEquipmentTypeView_DataBound(object sender, EventArgs e)
		{
			if (FvEquipmentTypeView.DataItemCount == 0)
			{
				FvEquipmentTypeView.ChangeMode(FormViewMode.Insert);
			}
			else
			{
				FvEquipmentTypeView.ChangeMode(FormViewMode.Edit);
			}

		}

		protected void LvRequirementList_ItemCommand(object sender, ListViewCommandEventArgs e)
		{
			Response.Redirect("~/Restricted/RequirementView.aspx?id=" + e.CommandArgument.ToString());
		}

		protected void LvEquipmentList_ItemCommand(object sender, ListViewCommandEventArgs e)
		{
			Response.Redirect("~/Restricted/EquipmentView.aspx?id=" + e.CommandArgument.ToString());
		}
	}
}