<%@ Page Title="Manage User" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageUserView.aspx.cs" Inherits="AssetManagementSystem.Admin.ManageUserView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

	<h2><%: Title %>.</h2>

	<section class="container">
		
		<asp:FormView ID="FvUserView" runat="server"
			CssClass="col-md-12"
			AllowPaging="false"
			DataKeyNames="UserID"
			OnItemCommand="FvUserView_ItemCommand"
			OnModeChanging="FvUserView_ModeChanging"
			OnItemUpdating="FvUserView_ItemUpdating"
			OnDataBound="FvUserView_DataBound">

			<ItemTemplate>
                <section class="row">
                    <section class="col-xs-8">
                        <h3>Form View (Read-Only)</h3>
                    </section>
                    <section class="col-xs-4 text-right">
                        <h3>
                            <asp:linkbutton id="btnInsertView" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus btn"/>
                            <asp:linkbutton id="btnEditView" CommandName="Edit" runat="server" CssClass="glyphicon glyphicon-pencil btn"/>
                            <asp:linkbutton id="btnListView" CommandName="ListView" runat="server" CssClass="glyphicon glyphicon-th-list btn"/>
                        </h3>
                    </section>
                </section>
                <section class="row">
                    <section class="col-xs-12">
                        <table class="table table-borderless table-condensed">
                            <tr><td>User ID:</td><td><asp:TextBox ID="txtUserID" runat="server" Enabled="False" Text='<%#Eval("[UserID]") %>'></asp:TextBox></td></tr>
                            <tr><td>Email:</td><td><asp:TextBox ID="txtEmail" runat="server" Enabled="False" Text='<%#Eval("[Email]") %>'></asp:TextBox></td></tr>
							<tr><td>Phone Number:</td><td><asp:TextBox ID="txtPhoneNumber" runat="server" Enabled="False" Text='<%#Eval("[PhoneNumber]") %>'></asp:TextBox></td></tr>
                            <tr><td>Two-Factor Enabled:</td><td><asp:TextBox ID="txtTwoFactorEnabled" runat="server" Enabled="False" Text='<%#Eval("[TwoFactorEnabled]") %>'></asp:TextBox></td></tr>
                            <tr><td>Lockout End Date:</td><td><asp:TextBox ID="txtLockoutEndDateUtc" runat="server" Enabled="False" Text='<%#Eval("[LockoutEndDateUtc]") %>'></asp:TextBox></td></tr>
                            <tr><td>Lockout Enabled:</td><td><asp:TextBox ID="txtLockoutEnabled" runat="server" Enabled="False" Text='<%#Eval("[LockoutEnabled]") %>'></asp:TextBox></td></tr>
                            <tr><td>Access Failed Count:</td><td><asp:TextBox ID="txtAccessFailedCount" runat="server" Enabled="False" Text='<%#Eval("[AccessFailedCount]") %>'></asp:TextBox></td></tr>
                            <tr><td>Username:</td><td><asp:TextBox ID="txtUserName" runat="server" Enabled="False" Text='<%#Eval("[UserName]") %>'></asp:TextBox></td></tr>
							<tr><td>Roles</td><td><asp:CheckBoxList ID="CblRoles" runat="server" Enabled="False" RepeatLayout="Flow" RepeatDirection="Horizontal" CssClass="checkboxlist" /></td></tr>
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
                            <tr><td>User ID:</td><td><asp:TextBox ID="txtUserID" runat="server" Enabled="False" Text='<%#Eval("[UserID]") %>'></asp:TextBox></td></tr>
                            <tr><td>Email:</td><td><asp:TextBox ID="txtEmail" runat="server" Enabled="True" Text='<%#Bind("[Email]") %>'></asp:TextBox></td></tr>
							<tr><td>Phone Number:</td><td><asp:TextBox ID="txtPhoneNumber" runat="server" Enabled="True" Text='<%#Bind("[PhoneNumber]") %>'></asp:TextBox></td></tr>
                            <tr><td>Two-Factor Enabled:</td><td><asp:TextBox ID="txtTwoFactorEnabled" runat="server" Enabled="False" Text='<%#Eval("[TwoFactorEnabled]") %>'></asp:TextBox></td></tr>
                            <tr><td>Lockout End Date:</td><td><asp:TextBox ID="txtLockoutEndDateUtc" runat="server" Enabled="False" Text='<%#Eval("[LockoutEndDateUtc]") %>'></asp:TextBox></td></tr>
                            <tr><td>Lockout Enabled:</td><td><asp:TextBox ID="txtLockoutEnabled" runat="server" Enabled="False" Text='<%#Eval("[LockoutEnabled]") %>'></asp:TextBox></td></tr>
                            <tr><td>Access Failed Count:</td><td><asp:TextBox ID="txtAccessFailedCount" runat="server" Enabled="False" Text='<%#Eval("[AccessFailedCount]") %>'></asp:TextBox></td></tr>
                            <tr><td>Username:</td><td><asp:TextBox ID="txtUserName" runat="server" Enabled="True" Text='<%#Bind("[UserName]") %>'></asp:TextBox></td></tr>
							<tr><td>Roles</td><td><asp:CheckBoxList ID="CblRoles" runat="server" Enabled="True"  RepeatLayout="Flow" RepeatDirection="Horizontal" CssClass="checkboxlist" /></td></tr>

                            <tr><td></td><td><asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update" Text="Save" CssClass="btn btn-primary"/></td></tr>
                        </table>
                    </section>
                </section>
            </EditItemTemplate>
			
<%--            <InsertItemTemplate>
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
                            <tr><td>User ID:</td><td><asp:TextBox ID="txtUserID" runat="server" Enabled="False" Text='<%#Eval("[UserID]") %>'></asp:TextBox></td></tr>
                            <tr><td>Email:</td><td><asp:TextBox ID="txtEmail" runat="server" Enabled="True" Text='<%#Bind("[Email]") %>'></asp:TextBox></td></tr>
							<tr><td>Phone Number:</td><td><asp:TextBox ID="txtPhoneNumber" runat="server" Enabled="True" Text='<%#Bind("[PhoneNumber]") %>'></asp:TextBox></td></tr>
                            <tr><td>Two-Factor Enabled:</td><td><asp:TextBox ID="txtTwoFactorEnabled" runat="server" Enabled="False" Text='<%#Eval("[TwoFactorEnabled]") %>'></asp:TextBox></td></tr>
                            <tr><td>Lockout End Date:</td><td><asp:TextBox ID="txtLockoutEndDateUtc" runat="server" Enabled="False" Text='<%#Eval("[LockoutEndDateUtc]") %>'></asp:TextBox></td></tr>
                            <tr><td>Lockout Enabled:</td><td><asp:TextBox ID="txtLockoutEnabled" runat="server" Enabled="False" Text='<%#Eval("[LockoutEnabled]") %>'></asp:TextBox></td></tr>
                            <tr><td>Access Failed Count:</td><td><asp:TextBox ID="txtAccessFailedCount" runat="server" Enabled="False" Text='<%#Eval("[AccessFailedCount]") %>'></asp:TextBox></td></tr>
                            <tr><td>Username:</td><td><asp:TextBox ID="txtUserName" runat="server" Enabled="True" Text='<%#Bind("[UserName]") %>'></asp:TextBox></td></tr>

                            <tr><td></td><td><asp:LinkButton ID="btnInsert" runat="server" CommandName="Insert" Text="Submit" CssClass="btn btn-primary"/></td></tr>
                        </table>
                    </section>
                </section>
            </InsertItemTemplate>--%>

            <EmptyDataTemplate>
                <section class="row">
                    <section class="col-xs-12">
                        <h3>(No record found.)</h3>
                    </section>
                </section>
            </EmptyDataTemplate>

		</asp:FormView>

	</section>

	<section class="alert-timeout alert-hidden alert alert-success">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>Success!</strong> The record has been saved.
	</section>

	<script src="../Scripts/SCscripts.js"></script>

</asp:Content>
