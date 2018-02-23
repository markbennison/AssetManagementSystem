using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AssetManagementSystem._DAL_AMSTableAdapters;

namespace AssetManagementSystem.Restricted
{
	public partial class EquipmentView : System.Web.UI.Page
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
			string queryID = Request.QueryString["id"].ToString();
			int eID = 0;
			bool idValid = Int32.TryParse(queryID, out eID);
			if (eID == 0)
			{
				FvEquipmentView.ChangeMode(FormViewMode.Insert);
			}


			/* *********** Configure DAL *********** */
			EquipmentInstanceTableAdapter equipmentAdapter = new EquipmentInstanceTableAdapter();
			FvEquipmentView.DataSource = equipmentAdapter.GetByID(eID);
			FvEquipmentView.DataBind();

			ServicesTableAdapter servicesAdapter = new ServicesTableAdapter();
			LvServiceList.DataSource = servicesAdapter.GetByEquipmentInstanceID(eID);
			LvServiceList.DataBind();

		}

		protected void FvEquipmentView_ItemCommand(object sender, FormViewCommandEventArgs e)
		{
			switch (e.CommandName)
			{
				case "New":
					Response.Redirect("~/Restricted/EquipmentView.aspx?id=0");
					break;
				case "Cancel":
					FvEquipmentView.ChangeMode(FormViewMode.ReadOnly);
					PageDataRefresh();
					break;
				case "ListView":
					Response.Redirect("~/Restricted/EquipmentList.aspx");
					break;
			}
		}

		protected void FvEquipmentView_ModeChanging(object sender, FormViewModeEventArgs e)
		{
			// Enable a FormView mode change (Read-Only, Edit/Update, New/Insert, Empty)
			FvEquipmentView.ChangeMode((FormViewMode)e.NewMode);
			PageDataRefresh();
		}

		protected void FvEquipmentView_ItemInserting(object sender, FormViewInsertEventArgs e)
		{
			FvEquipmentView_CallInsertOrUpdate("Insert");
		}

		protected void FvEquipmentView_ItemUpdating(object sender, FormViewUpdateEventArgs e)
		{
			FvEquipmentView_CallInsertOrUpdate("Update");
		}

		protected void FvEquipmentView_CallInsertOrUpdate(string CallCommand)
		{
			// Code versions of all controls
			TextBox EquipmentInstanceID_txt = (TextBox)FvEquipmentView.FindControl("txtEquipmentInstanceID");
			TextBox EquipmentTypeID_txt = (TextBox)FvEquipmentView.FindControl("txtEquipmentTypeID");
			TextBox Status_txt = (TextBox)FvEquipmentView.FindControl("txtStatus");
			TextBox SerialNumber_txt = (TextBox)FvEquipmentView.FindControl("txtSerialNumber");
			TextBox LocationID_txt = (TextBox)FvEquipmentView.FindControl("txtLocationID");
			TextBox InstallationDate_txt = (TextBox)FvEquipmentView.FindControl("txtInstallationDate");

			// Assign all text properties of controls to variables
			// Or skip this and assign straight into INSERT/UPDATE parameters
			int equipmentInstanceID = Convert.ToInt32(Request.QueryString["id"]);
			int equipmentTypeID = Convert.ToInt32(EquipmentTypeID_txt.Text);
			string status = Status_txt.Text;
			string serialNumber = SerialNumber_txt.Text;
			int locationID = Convert.ToInt32(LocationID_txt.Text);
			string installationDate = InstallationDate_txt.Text;

			EquipmentInstanceTableAdapter equipmentAdapter = new EquipmentInstanceTableAdapter();

			try
			{
				if (CallCommand == "Update")
				{
					// Conduct Update
					equipmentAdapter.UpdateRecord(equipmentTypeID, status, serialNumber, locationID, installationDate, equipmentInstanceID);
					Response.Write("<script LANGUAGE='JavaScript' >alert('Record Edited')</script>");

					// Return to Read Only mode
					FvEquipmentView.ChangeMode(FormViewMode.ReadOnly);
					PageDataRefresh();
				}
				else if (CallCommand == "Insert")
				{ 
					equipmentAdapter.InsertRecord(equipmentTypeID, status, serialNumber, locationID, installationDate);
					//string newID = siteAdapter.InsertAndReturnID(siteID, siteName, address1, address2, city, postCode, status).ToString();
					Response.Write("<script LANGUAGE='JavaScript' >alert('Record Added')</script>");
					// Redirect User
					Response.Redirect("~/Restricted/EquipmentView.aspx?id=" + equipmentInstanceID);
				}
			}
			catch (System.Exception ex)
			{
				Response.Write("<script LANGUAGE='JavaScript' >alert('An ERROR occurred connecting to the database. " + ex.Message + "')</script>");
			}
		}

		protected void FvEquipmentView_DataBound(object sender, EventArgs e)
		{
			if (FvEquipmentView.DataItemCount == 0)
			{
				FvEquipmentView.ChangeMode(FormViewMode.Insert);
			}
			else
			{
				FvEquipmentView.ChangeMode(FormViewMode.Edit);
			}

		}

		protected void LvServiceList_ItemCommand(object sender, ListViewCommandEventArgs e)
		{
			Response.Redirect("~/Restricted/ServiceView.aspx?id=" + e.CommandArgument.ToString());
		}
	}
}