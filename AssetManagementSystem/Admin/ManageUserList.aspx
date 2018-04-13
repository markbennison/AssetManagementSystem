<%@ Page Title="Manage Users" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageUserList.aspx.cs" Inherits="AssetManagementSystem.Restricted.ManageUserList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

	<h2><%: Title %>.</h2>

    <section class="container">
		<!-- Title & Search Row -->
		<section class="row">
			<section class="col-md-12">
				<!-- Title Controls -->
				<section class="row ">
					<section class="col-xs-8">
						<h3>User List</h3>
					</section>
					<section class="col-xs-4 text-right">
						<h3>
							<a data-toggle="collapse" href="#searchBar" aria-expanded="false" aria-controls="searchBar"><asp:Label ID="lblSearch" runat="server" CssClass="glyphicon glyphicon-search btn" /></a>
<%--							<asp:linkbutton id="btnResetPassword" PostBackUrl="~/Admin/RegisterUser.aspx" CommandName="New" runat="server" CssClass="glyphicon glyphicon-cog btn"/>--%>
							<asp:LinkButton id="btnAddNew" PostBackUrl="~/Admin/RegisterUser.aspx" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus btn" />
						</h3>
					</section>
				</section>

				<!-- Search Boxes -->
				<section class="row collapse" id="searchBar">
					<section class="col-md-12">
						<p><asp:TextBox ID="txtEmail" runat="server" placeholder="Email" /></p>
						<p><asp:TextBox ID="txtPhoneNumber" runat="server" placeholder="Phone Number" /></p>
						<p><asp:TextBox ID="txtUserName" runat="server" placeholder="Username" /></p>
						<p><asp:TextBox ID="txtRoleID" runat="server" placeholder="Role ID" TextMode="Number" /></p>
						<p><asp:TextBox ID="txtName" runat="server" placeholder="Role Name" /></p>
						<p><asp:Button ID="btnSearchSite" runat="server" Text="Search" CssClass="btn btn-primary"/></p>
					</section>
				</section>
			</section>
		</section>

		<%------------------------------------------------------------
			User List
		  ------------------------------------------------------------%>

        <section class="row">
            <section class="col-md-12">
                        
				<asp:ListView ID="LvUserList" runat="server" OnItemCommand="LvUserList_ItemCommand">
							
                    <LayoutTemplate>
						<asp:DataPager ID="DataPager_LvUserList" PageSize="10" PagedControlID="LvUserList" runat="server" OnPreRender="DataPager_LvUserList_PreRender">
							<Fields>
								<asp:NumericPagerField ButtonCount="10" CurrentPageLabelCssClass="btn btn-primary btn-sm" NumericButtonCssClass="btn btn-default btn-sm" ButtonType="Button" />
							</Fields>
						</asp:DataPager>
                        <table runat="server" id="tblUserList" class="table table-hover">
                            <tr runat="server" >
                                <th>User ID</th>
                                <th>Email</th>
                                <th>Phone Number</th>
                                <th>Two-Factor Enabled</th>
                                <th>Lockout End Date</th>
                                <%--<th>Lockout Enabled</th>--%>
                                <th>Access Failed Count</th>
                                <th>Username</th>
                                <%--<th>Role ID</th>
                                <th>Role Name</th>--%>
								<th>Roles</th>

								<th>View</th>
                            </tr>
							<tr runat="server" id="itemPlaceholder" ></tr>
                        </table>
                    </LayoutTemplate>

					<ItemTemplate>
                        <tr runat="server">
                            <td><asp:Label ID="lblUserID" runat="server" Text='<%#Eval("[UserID]") %>' /></td>
                            <td><asp:Label ID="lblEmail" runat="server" Text='<%#Eval("[Email]") %>' /></td>
                            <td><asp:Label ID="lblPhoneNumber" runat="server" Text='<%#Eval("[PhoneNumber]") %>' /></td>
                            <td><asp:Label ID="lblTwoFactorEnabled" runat="server" Text='<%#Eval("[TwoFactorEnabled]") %>' /></td>
                            <td><asp:Label ID="lblLockoutEndDateUtc" runat="server" Text='<%#Eval("[LockoutEndDateUtc]") %>' /></td>
                            <%--<td><asp:Label ID="lblLockoutEnabled" runat="server" Text='<%#Eval("[LockoutEnabled]") %>' /></td>--%>
                            <td><asp:Label ID="lblAccessFailedCount" runat="server" Text='<%#Eval("[AccessFailedCount]") %>' /></td>
                            <td><asp:Label ID="lblUserName" runat="server" Text='<%#Eval("[UserName]") %>' /></td>
							<%--<td><asp:Label ID="lblRoleID" runat="server" Text='<%#Eval("[RoleID]") %>' /></td>
							<td><asp:Label ID="lblRoleName" runat="server" Text='<%#Eval("[Name]") %>' /></td>--%>
							<td><asp:Label ID="lblRoles" runat="server" Text='<%#Eval("[Roles]") %>' /></td>

                            <td><asp:LinkButton ID="btnView" runat="server" CssClass="glyphicon glyphicon-eye-open btn" CommandName="View" CommandArgument='<%#Eval("UserID") %>'/></td>
                        </tr>
                    </ItemTemplate>

					<EmptyDataTemplate>
                        <table runat="server" id="tblUserList" class="table table-hover">
                            <tr>
                                <th>User ID</th>
                                <th>Email</th>
                                <th>Phone Number</th>
                                <th>Two-Factor Enabled</th>
                                <th>Lockout End Date</th>
                                <%--<th>Lockout Enabled</th>--%>
                                <th>Access Failed Count</th>
                                <th>Username</th>
								<th>Roles</th>

								<th>View</th>
                            </tr>
                        <tr><td colspan="9" class="text-center">No records found.</td></tr>
                        </table>
					</EmptyDataTemplate>

                </asp:ListView>
            </section>
        </section>
	</section>
</asp:Content>
