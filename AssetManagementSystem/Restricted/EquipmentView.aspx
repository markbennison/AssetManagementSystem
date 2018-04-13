<%@ Page Title="Equipment View" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EquipmentView.aspx.cs" Inherits="AssetManagementSystem.Restricted.EquipmentView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %>.</h2>

    <section class="container">
        
        <asp:FormView 
            ID="FvEquipmentView" 
            runat="server" 
            CssClass="col-md-12"
            AllowPaging="false" 
            DataKeyNames="EquipmentInstanceID" 
            OnItemCommand="FvEquipmentView_ItemCommand"
            OnModeChanging="FvEquipmentView_ModeChanging"
            OnItemInserting="FvEquipmentView_ItemInserting"
            OnItemUpdating="FvEquipmentView_ItemUpdating"
            OnDataBound="FvEquipmentView_DataBound">
            
            <ItemTemplate>
                <section class="row">
                    <section class="col-xs-8">
                        <h3>Form View (Read-Only)</h3>
                    </section>
                    <section class="col-xs-4 text-right">
                        <h3><asp:linkbutton id="btnInsertView" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus btn"/>
							<asp:linkbutton id="btnEditView" CommandName="Edit" runat="server" CssClass="glyphicon glyphicon-pencil btn"/>
							<asp:linkbutton id="btnListView" CommandName="ListView" runat="server" CssClass="glyphicon glyphicon-th-list btn"/>
                        </h3>
                    </section>
                </section>
                <section class="row">
                    <section class="col-xs-12">
                        <table class="table table-borderless table-condensed">
                            <tr><td>Equipment Instance ID:</td><td><asp:TextBox ID="txtEquipmentInstanceID" runat="server" Enabled="False" Text='<%#Eval("EquipmentInstanceID") %>'></asp:TextBox></td></tr>
                            <tr><td>Type ID:</td><td><asp:DropDownList ID="ddlEquipmentTypeID" runat="server" Enabled="False" AutoPostBack="True" OnSelectedIndexChanged="ddlEquipmentTypeID_SelectedIndexChanged"></asp:DropDownList>
								<asp:linkbutton id="btnConfigType" CommandName="ConfigType" runat="server" CssClass="glyphicon glyphicon-cog btn"/></td></tr>
							<tr><td>Type Desc:</td><td><asp:DropDownList ID="ddlEquipmentTypeDesc" runat="server" Enabled="False" AutoPostBack="True" OnSelectedIndexChanged="ddlEquipmentTypeDesc_SelectedIndexChanged"></asp:DropDownList></td></tr>
                            <tr><td>Status:</td><td><asp:DropDownList ID="ddlStatus" runat="server" Enabled="False" SelectedValue='<%# Bind("Status") %>'>
								<asp:ListItem Text="Active" Value="Active" />
								<asp:ListItem Text="Pending" Value="Pending" />
								<asp:ListItem Text="Decommissioned" Value="Decommissioned" /></asp:DropDownList></td></tr>
                            <tr><td>Serial Number:</td><td><asp:TextBox ID="txtSerialNumber" runat="server" Enabled="False" Text='<%#Eval("SerialNumber") %>'></asp:TextBox></td></tr>
							<tr><td>Site:</td><td><asp:DropDownList ID="ddlSite" runat="server" OnSelectedIndexChanged="ddlSite_SelectedIndexChanged" AutoPostBack="true" Enabled="false"/></td></tr>
							<tr><td>Building:</td><td><asp:DropDownList ID="ddlBuilding" runat="server" OnSelectedIndexChanged="ddlBuilding_SelectedIndexChanged" AutoPostBack="true" Enabled="false"/></td></tr>
							<tr><td>Location:</td><td><asp:DropDownList ID="ddlLocation" runat="server" AutoPostBack="true" Enabled="false"/></td></tr>
                            <tr><td>Installation Date:</td><td><asp:TextBox ID="txtInstallationDate" runat="server" Enabled="False" Text='<%#Eval("InstallationDate", "{0:dd/MM/yyyy}") %>'></asp:TextBox></td></tr>
                        </table>
                    </section>
                </section>
            </ItemTemplate>

            <EditItemTemplate>
                <section class="row">
                    <section class="col-xs-8">
                        <h3>Form View (Edit)</h3>
                    </section>
                    <section class="col-xs-4 text-right">
                        <h3>
                            <asp:linkbutton id="btnInsertView" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus btn"/>
                            <asp:linkbutton id="btnEditView" CommandName="Edit" runat="server" CssClass="glyphicon glyphicon-pencil btn disabled"/>
                            <asp:linkbutton id="btnListView" CommandName="ListView" runat="server" CssClass="glyphicon glyphicon-th-list btn"/>
                        </h3>
                    </section>
                </section>
                <section class="row">
                    <section class="col-xs-12">
                        <table class="table table-borderless table-condensed">
                            <tr><td>Equipment ID:</td><td><asp:TextBox ID="txtEquipmentInstanceID" runat="server" Enabled="False" Text='<%#Bind("EquipmentInstanceID") %>'></asp:TextBox></td></tr>
                            <tr><td>Type ID:</td><td><asp:DropDownList ID="ddlEquipmentTypeID" runat="server" Enabled="True" AutoPostBack="True" OnSelectedIndexChanged="ddlEquipmentTypeID_SelectedIndexChanged"></asp:DropDownList>
								<asp:linkbutton id="btnConfigType" CommandName="ConfigType" runat="server" CssClass="glyphicon glyphicon-cog btn"/></td></tr>
							<tr><td>Type Desc:</td><td><asp:DropDownList ID="ddlEquipmentTypeDesc" runat="server" Enabled="True" AutoPostBack="True" OnSelectedIndexChanged="ddlEquipmentTypeDesc_SelectedIndexChanged"></asp:DropDownList></td></tr>
                            <tr><td>Status:</td><td><asp:DropDownList ID="ddlStatus" runat="server" SelectedValue='<%# Bind("Status") %>'>
								<asp:ListItem Text="Active" Value="Active" />
								<asp:ListItem Text="Pending" Value="Pending" />
								<asp:ListItem Text="Decommissioned" Value="Decommissioned" /></asp:DropDownList></td></tr>
                            <tr><td>Serial Number:</td><td><asp:TextBox ID="txtSerialNumber" runat="server" Enabled="True" Text='<%#Bind("SerialNumber") %>'></asp:TextBox></td></tr>
							<tr><td>Site:</td><td><asp:DropDownList ID="ddlSite" runat="server" OnSelectedIndexChanged="ddlSite_SelectedIndexChanged" AutoPostBack="true"/></td></tr>
							<tr><td>Building:</td><td><asp:DropDownList ID="ddlBuilding" runat="server" OnSelectedIndexChanged="ddlBuilding_SelectedIndexChanged" AutoPostBack="true"/></td></tr>
							<tr><td>Location:</td><td><asp:DropDownList ID="ddlLocation" runat="server" AutoPostBack="true"/></td></tr>
                            <tr><td>Installation Date:</td><td><asp:TextBox ID="txtInstallationDate" runat="server" Enabled="True" Text='<%#Bind("InstallationDate", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox></td></tr>

                            <tr><td></td><td><asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update" Text="Save" CssClass="btn btn-primary"/></td></tr>
                        </table>
                    </section>
                </section>
            </EditItemTemplate>

            <InsertItemTemplate>
                <section class="row">
                    <section class="col-xs-8">
                    <h3>Form View (Insert)</h3>
                </section>
                    <section class="col-xs-4 text-right">
						<h3>
							<asp:linkbutton id="btnInsertView" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus btn disabled"/>
							<asp:linkbutton id="btnEditView" CommandName="Edit" runat="server" CssClass="glyphicon glyphicon-pencil btn disabled"/>
							<asp:linkbutton id="btnListView" CommandName="ListView" runat="server" CssClass="glyphicon glyphicon-th-list btn"/>
						</h3>
					</section>
                </section>
                <section class="row">
                    <section class="col-xs-12">
                        <table class="table table-borderless table-condensed">
                            <tr><td>Equipment Instance ID:</td><td><asp:TextBox ID="txtEquipmentInstanceID" runat="server" Enabled="False" Text='<%#Bind("EquipmentInstanceID") %>'></asp:TextBox></td></tr>
                            <tr><td>Type ID:</td><td><asp:DropDownList ID="ddlEquipmentTypeID" runat="server" Enabled="True" AutoPostBack="True" OnSelectedIndexChanged="ddlEquipmentTypeID_SelectedIndexChanged"></asp:DropDownList>
								<asp:linkbutton id="btnConfigType" CommandName="ConfigType" runat="server" CssClass="glyphicon glyphicon-cog btn"/></td></tr>
							<tr><td>Type Desc:</td><td><asp:DropDownList ID="ddlEquipmentTypeDesc" runat="server" Enabled="True" AutoPostBack="True" OnSelectedIndexChanged="ddlEquipmentTypeDesc_SelectedIndexChanged"></asp:DropDownList></td></tr>
                            <tr><td>Status:</td><td><asp:DropDownList ID="ddlStatus" runat="server" SelectedValue='<%# Bind("Status") %>'>
								<asp:ListItem Text="Active" Value="Active" />
								<asp:ListItem Text="Pending" Value="Pending" />
								<asp:ListItem Text="Decommissioned" Value="Decommissioned" /></asp:DropDownList></td></tr>
                            <tr><td>Serial Number:</td><td><asp:TextBox ID="txtSerialNumber" runat="server" Enabled="True" Text='<%#Bind("SerialNumber") %>'></asp:TextBox></td></tr>
                            <tr><td>Site:</td><td><asp:DropDownList ID="ddlSite" runat="server" OnSelectedIndexChanged="ddlSite_SelectedIndexChanged" AutoPostBack="true"/></td></tr>
							<tr><td>Building:</td><td><asp:DropDownList ID="ddlBuilding" runat="server" OnSelectedIndexChanged="ddlBuilding_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList></td></tr>
							<tr><td>Location:</td><td><asp:DropDownList ID="ddlLocation" runat="server" AutoPostBack="true"/></td></tr>
							<tr><td>Installation Date:</td><td><asp:TextBox ID="txtInstallationDate" runat="server" Enabled="True" Text='<%#Bind("InstallationDate", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox></td></tr>

                            <tr><td></td><td><asp:LinkButton ID="btnInsert" runat="server" CommandName="Insert" Text="Submit" CssClass="btn btn-primary"/></td></tr>
                        </table>
                    </section>
                </section>
            </InsertItemTemplate>

            <EmptyDataTemplate>
                <section class="row">
                    <section class="col-xs-12">
                        <h3>(No record found.)</h3>
                    </section>
                </section>
            </EmptyDataTemplate>

        </asp:FormView>


		<%------------------------------------------------------------
			Service Requirements (List)			
		  ------------------------------------------------------------%>

		<section class="row">
			<!-- LIST VIEW column -->
			<section class="col-xs-8">
				<h3>Service Requirements</h3>
			</section>
			<section class="col-xs-4 text-right">
				<%--<h3><asp:linkbutton id="btnAddNewRequirement" OnClick="btnAddNewRequirement_Click" CommandName="NewRequirement" runat="server" CssClass="glyphicon glyphicon-plus btn"/></h3>--%>
				<%--<h3><asp:linkbutton id="btnAddNewRequirement" PostBackUrl="~/Restricted/RequirementView.aspx" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus btn"/></h3>--%>
			</section>
		</section>

		<section class="row">
			<section class="col-md-12">
				<asp:ListView ID="LvRequirementList" runat="server" OnItemCommand="LvRequirementList_ItemCommand">
					<LayoutTemplate>
						<table runat="server" id="tblServices" class="table table-hover">
							<tr runat="server" >
								<th>Requirement ID</th>
								<th>Description</th>
								<th>Priority</th>
								<th>First required (months)</th>
								<th>Frequency (months)</th>
								<th>Legislation URL</th>
								<th>Last Actioned</th>
								<th>Next Due</th>

								<th>View</th>
								<th>Service</th>
							</tr>
							<tr runat="server" id="itemPlaceholder"></tr>
						</table>
					</LayoutTemplate>

					<ItemTemplate>
						<tr runat="server"  class='<%# Convert.ToDateTime(Eval("[NextDue]", "{0:dd/MM/yyyy}")) < DateTime.Today ? "danger" : Convert.ToDateTime(Eval("[NextDue]", "{0:dd/MM/yyyy}")) < DateTime.Today.AddMonths(1) ? "warning" : "success" %>' >
							<td><asp:Label ID="lblReqID" runat="server" Text='<%#Eval("[RequirementID]") %>' /></td>
							<td><asp:Label ID="lblReqDesc" runat="server" Text='<%#Eval("[RequirementDesc]") %>' /></td>
							<td><asp:Label ID="lblPriority" runat="server" Text='<%#Eval("[Priority]") %>' /></td>
							<td><asp:Label ID="lblFirstImplementation" runat="server" Text='<%#Eval("[FirstImplementation]") %>' /></td>
							<td><asp:Label ID="lblFrequency" runat="server" Text='<%#Eval("[Frequency]") %>' /></td>
							<td><asp:Label ID="lblLegislationURL" runat="server" Text='<%#Eval("[LegislationURL]") %>' /></td>
							<td><asp:Label ID="lblLastActioned" runat="server" Text='<%#Eval("[LastActioned]", "{0:dd/MM/yyyy}") %>' /></td>
							<td><asp:Label ID="lblNextDue" runat="server" Text='<%#Eval("[NextDue]", "{0:dd/MM/yyyy}") %>' /></td>
							
							<td><asp:LinkButton ID="btnView" runat="server" CssClass="glyphicon glyphicon-eye-open btn" CommandName="View" CommandArgument='<%#Eval("RequirementID") %>'/></td>
							<td><asp:LinkButton ID="btnService" runat="server" CssClass="glyphicon glyphicon-check btn" CommandName="Service" CommandArgument='<%#Eval("RequirementID") %>'/></td>
						</tr>
					</ItemTemplate>

					<EmptyDataTemplate>
						<table runat="server" id="tblBuildings" class="table">
							<tr runat="server" >
								<th>Requirement ID</th>
								<th>Description</th>
								<th>Priority</th>
								<th>First required (months)</th>
								<th>Frequency (months)</th>
								<th>Legislation URL</th>
								<th>Last Actioned</th>
								<th>Next Due</th>

								<th>View</th>
								<th>Service</th>
							</tr>
							<tr>
								<td colspan="11" class="text-center">No service requirements listed for this item of equipment</td>
							</tr>
						</table>
					</EmptyDataTemplate>

				</asp:ListView>
			</section>
		</section>


		<%------------------------------------------------------------
			Service History (List)			
		  ------------------------------------------------------------%>

		<section class="row">
			<!-- LIST VIEW column -->
			<section class="col-xs-8">
				<h3>Service History</h3>
			</section>
			<section class="col-xs-4 text-right">
				<%--<h3><asp:linkbutton id="btnAddNewService" OnClick="btnAddNewService_Click" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus btn"/></h3>--%>
				<%--<h3><asp:linkbutton id="btnAddNewService" PostBackUrl="~/Restricted/ServiceView.aspx" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus btn"/></h3>--%>
			</section>
		</section>

		<section class="row">
			<section class="col-md-12">
				<asp:ListView ID="LvServiceList" runat="server" OnItemCommand="LvServiceList_ItemCommand">

					<LayoutTemplate>
						<table runat="server" id="tblServices" class="table table-hover">
							<tr runat="server" >
								<th>Service ID</th>
								<th>Requirement ID</th>
								<th>Contractor ID</th>
								<th>Actioned By</th>
								<th>Actioned On</th>
								<th>Status</th>
								<th>Charge</th>
								<th>Cost Code</th>
								<th>Exp Code</th>

								<th>View</th>
							</tr>
							<tr runat="server" id="itemPlaceholder" ></tr>
						</table>
					</LayoutTemplate>

					<ItemTemplate>
						<tr runat="server">
							<td><asp:Label ID="lblServiceID" runat="server" Text='<%#Eval("[ServiceID]") %>' /></td>
							<td><asp:Label ID="lblRequirementID" runat="server" Text='<%#Eval("[RequirementID]") %>' /></td>
							<td><asp:Label ID="lblContractorID" runat="server" Text='<%#Eval("[ContractorID]") %>' /></td>
							<td><asp:Label ID="lblActionedBy" runat="server" Text='<%#Eval("[UserName]") %>' /></td>
							<td><asp:Label ID="lblActionedDateTime" runat="server" Text='<%#Eval("[ActionedDateTime]", "{0:dd/MM/yyyy}") %>' /></td>
							<td><asp:Label ID="lblStatus" runat="server" Text='<%#Eval("[Status]") %>' /></td>
							<td><asp:Label ID="lblCharge" runat="server" Text='<%#Eval("[Charge]") %>' /></td>
							<td><asp:Label ID="lblCostCode" runat="server" Text='<%#Eval("[CostCode]") %>' /></td>
							<td><asp:Label ID="lblExpCode" runat="server" Text='<%#Eval("[ExpCode]") %>' /></td>

							<td><asp:LinkButton ID="btnView" runat="server" CssClass="glyphicon glyphicon-eye-open btn" CommandName="View" CommandArgument='<%#Eval("ServiceID") %>' /></td>
						</tr>
					</ItemTemplate>

					<EmptyDataTemplate>
						<table runat="server" id="tblBuildings" class="table">
							<tr runat="server" >
								<th>Service ID</th>
								<th>Requirement ID</th>
								<th>Contractor ID</th>
								<th>Actioned By</th>
								<th>Actioned On</th>
								<th>Status</th>
								<th>Charge</th>
								<th>Cost Code</th>
								<th>Exp Code</th>

								<th>View</th>
							</tr>
							<tr>
								<td colspan="11" class="text-center">No services listed for this item of equipment</td>
							</tr>
						</table>
					</EmptyDataTemplate>

				</asp:ListView>
			</section>
		</section>
    </section>

	<section class="alert-timeout alert-hidden alert alert-success">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>Success!</strong> The record has been saved.
	</section>

	<script src="../Scripts/SCscripts.js"></script>

</asp:Content>
