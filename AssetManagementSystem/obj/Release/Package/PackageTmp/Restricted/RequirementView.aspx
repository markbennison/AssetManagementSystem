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
                            <tr><td>Requirement ID:</td><td><asp:TextBox ID="txtRequirementID" runat="server" Enabled="False" Text='<%#Eval("RequirementID") %>'></asp:TextBox></td></tr>
                            <tr><td>Description:</td><td><asp:TextBox ID="txtRequirementDesc" runat="server" Enabled="False" Text='<%#Eval("RequirementDesc") %>'></asp:TextBox></td></tr>
                            <tr><td>Type ID:</td><td><asp:DropDownList ID="ddlEquipmentTypeID" runat="server" Enabled="False" AutoPostBack="True" OnSelectedIndexChanged="ddlEquipmentTypeID_SelectedIndexChanged"></asp:DropDownList></td></tr>
							<tr><td>Type Desc:</td><td><asp:DropDownList ID="ddlEquipmentTypeDesc" runat="server" Enabled="False" AutoPostBack="True" OnSelectedIndexChanged="ddlEquipmentTypeDesc_SelectedIndexChanged"></asp:DropDownList></td></tr>
                            <tr><td>Priority:</td><td><asp:DropDownList ID="ddlPriority" runat="server" Enabled="False" SelectedValue='<%# Eval("Priority") %>'>
								<asp:ListItem Text="Legal" Value="Legal" />
								<asp:ListItem Text="Recommended" Value="Recommended" />
								<asp:ListItem Text="Non-Essential" Value="Non-Essential" /></asp:DropDownList></td></tr>
                            <tr><td>First Implementation (months):</td><td><asp:TextBox ID="txtFirstImplementation" runat="server" Enabled="False" Text='<%#Eval("FirstImplementation") %>'></asp:TextBox></td></tr>
							<tr><td>Frequency (months):</td><td><asp:TextBox ID="txtFrequency" runat="server" Enabled="False" Text='<%#Eval("Frequency") %>'></asp:TextBox></td></tr>
							<tr><td>Materials Note:</td><td><asp:TextBox ID="txtMaterialsNote" runat="server" Enabled="False" Text='<%#Eval("MaterialsNote") %>'></asp:TextBox></td></tr>
							<tr><td>Legislation URL:</td><td><asp:TextBox ID="txtLegislationURL" runat="server" Enabled="False" Text='<%#Eval("LegislationURL") %>'></asp:TextBox></td></tr>
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
                            <tr><td>Requirement ID:</td><td><asp:TextBox ID="txtRequirementID" runat="server" Enabled="True" Text='<%#Bind("RequirementID") %>'></asp:TextBox></td></tr>
                            <tr><td>Description:</td><td><asp:TextBox ID="txtRequirementDesc" runat="server" Enabled="True" Text='<%#Bind("RequirementDesc") %>'></asp:TextBox></td></tr>
                            <tr><td>Type ID:</td><td><asp:DropDownList ID="ddlEquipmentTypeID" runat="server" Enabled="True" AutoPostBack="True" OnSelectedIndexChanged="ddlEquipmentTypeID_SelectedIndexChanged"></asp:DropDownList></td></tr>
							<tr><td>Type Desc:</td><td><asp:DropDownList ID="ddlEquipmentTypeDesc" runat="server" Enabled="True" AutoPostBack="True" OnSelectedIndexChanged="ddlEquipmentTypeDesc_SelectedIndexChanged"></asp:DropDownList></td></tr>
                            <tr><td>Priority:</td><td><asp:DropDownList ID="ddlPriority" runat="server" Enabled="True" SelectedValue='<%# Bind("Priority") %>'>
								<asp:ListItem Text="Legal" Value="Legal" />
								<asp:ListItem Text="Recommended" Value="Recommended" />
								<asp:ListItem Text="Non-Essential" Value="Non-Essential" /></asp:DropDownList></td></tr>
                            <tr><td>First Implementation (months):</td><td><asp:TextBox ID="txtFirstImplementation" runat="server" Enabled="True" Text='<%#Eval("FirstImplementation") %>'></asp:TextBox></td></tr>
							<tr><td>Frequency (months):</td><td><asp:TextBox ID="txtFrequency" runat="server" Enabled="True" Text='<%#Bind("Frequency") %>'></asp:TextBox></td></tr>
							<tr><td>Materials Note:</td><td><asp:TextBox ID="txtMaterialsNote" runat="server" Enabled="True" Text='<%#Bind("MaterialsNote") %>'></asp:TextBox></td></tr>
							<tr><td>Legislation URL:</td><td><asp:TextBox ID="txtLegislationURL" runat="server" Enabled="True" Text='<%#Bind("LegislationURL") %>'></asp:TextBox></td></tr>

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
                            <tr><td>Requirement ID:</td><td><asp:TextBox ID="txtRequirementID" runat="server" Enabled="False" Text='<%#Bind("RequirementID") %>'></asp:TextBox></td></tr>
							<tr><td>Description:</td><td><asp:TextBox ID="txtRequirementDesc" runat="server" Enabled="True" Text='<%#Bind("RequirementDesc") %>'></asp:TextBox></td></tr>
                            <tr><td>Type ID:</td><td><asp:DropDownList ID="ddlEquipmentTypeID" runat="server" Enabled="True" AutoPostBack="True" OnSelectedIndexChanged="ddlEquipmentTypeID_SelectedIndexChanged"></asp:DropDownList></td></tr>
							<tr><td>Type Desc:</td><td><asp:DropDownList ID="ddlEquipmentTypeDesc" runat="server" Enabled="True" AutoPostBack="True" OnSelectedIndexChanged="ddlEquipmentTypeDesc_SelectedIndexChanged"></asp:DropDownList></td></tr>
                            <tr><td>Priority:</td><td><asp:DropDownList ID="ddlPriority" runat="server" Enabled="True" SelectedValue='<%# Bind("Priority") %>'>
								<asp:ListItem Text="Legal" Value="Legal" />
								<asp:ListItem Text="Recommended" Value="Recommended" />
								<asp:ListItem Text="Non-Essential" Value="Non-Essential" /></asp:DropDownList></td></tr>
                            <tr><td>First Implementation (months):</td><td><asp:TextBox ID="txtFirstImplementation" runat="server" Enabled="True" Text='<%#Eval("FirstImplementation") %>'></asp:TextBox></td></tr>
							<tr><td>Frequency (months):</td><td><asp:TextBox ID="txtFrequency" runat="server" Enabled="True" Text='<%#Bind("Frequency") %>'></asp:TextBox></td></tr>
							<tr><td>Materials Note:</td><td><asp:TextBox ID="txtMaterialsNote" runat="server" Enabled="True" Text='<%#Bind("MaterialsNote") %>'></asp:TextBox></td></tr>
							<tr><td>Legislation URL:</td><td><asp:TextBox ID="txtLegislationURL" runat="server" Enabled="True" Text='<%#Bind("LegislationURL") %>'></asp:TextBox></td></tr>
                            
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
