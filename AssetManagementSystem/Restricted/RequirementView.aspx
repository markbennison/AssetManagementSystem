<%@ Page Title="Requirement View" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RequirementView.aspx.cs" Inherits="AssetManagementSystem.Restricted.RequirementsView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %>.</h2>

    <section class="container">
        
        <asp:FormView 
            ID="FvRequirementView" 
            runat="server" 
            CssClass="col-md-12"
            AllowPaging="false" 
            DataKeyNames="RequirementID" 
            OnItemCommand="FvRequirementView_ItemCommand"
            OnModeChanging="FvRequirementView_ModeChanging"
            OnItemInserting="FvRequirementView_ItemInserting"
            OnItemUpdating="FvRequirementView_ItemUpdating"
            OnDataBound="FvRequirementView_DataBound">
            
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
                            <tr><td>Type ID:</td><td><asp:DropDownList ID="ddlEquipmentTypeID" runat="server" Enabled="False" AutoPostBack="True" OnSelectedIndexChanged="ddlEquipmentTypeID_SelectedIndexChanged"></asp:DropDownList></td></tr>
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

							<tr><td>Requirement ID</td><td> </td></tr>
							<tr><td>Equipment Type ID</td><td> </td></tr>
							<tr><td>Description</td><td> </td></tr>
							<tr><td>Priority</td><td> </td></tr>
							<tr><td>First required (months)</td><td> </td></tr>
							<tr><td>Frequency (months)</td><td> </td></tr>
							<tr><td>Legislation URL</td><td> </td></tr>
							<tr><td>Materials Note</td><td> </td></tr>

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
                            <tr><td>Type ID:</td><td><asp:DropDownList ID="ddlEquipmentTypeID" runat="server" Enabled="True" AutoPostBack="True" OnSelectedIndexChanged="ddlEquipmentTypeID_SelectedIndexChanged"></asp:DropDownList></td></tr>
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
                            <tr><td>Type ID:</td><td><asp:DropDownList ID="ddlEquipmentTypeID" runat="server" Enabled="True" AutoPostBack="True" OnSelectedIndexChanged="ddlEquipmentTypeID_SelectedIndexChanged"></asp:DropDownList></td></tr>
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

	</section>

</asp:Content>
