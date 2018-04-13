<%@ Page Title="Manage Users" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageUserList.aspx.cs" Inherits="AssetManagementSystem.Restricted.ManageUserList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

	<h2><%: Title %>.</h2>

    <section class="container">
		<section class="row">
            <!-- LIST VIEW column -->
			<section class="col-md-10">

                <section class="row">
                    <section class="col-xs-8">
                        <h3>User List</h3>
                    </section>
                    <section class="col-xs-4 text-right">
						<h3>
							<asp:linkbutton id="btnResetPassword" PostBackUrl="~/Admin/RegisterUser.aspx" CommandName="New" runat="server" CssClass="glyphicon glyphicon-wrench btn"/>
							<asp:linkbutton id="btnAddNew" PostBackUrl="~/Admin/RegisterUser.aspx" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus btn"/>
						</h3>
                    </section>
                </section>

                <section class="row">
                    <section class="col-md-12">
                        
						<asp:ListView ID="LvUserList" runat="server" OnItemCommand="LvUserList_ItemCommand">
							
                            <LayoutTemplate>
                                <table runat="server" id="tblUserList" class="table table-hover">
                                    <tr runat="server" >
                                        <th>User ID</th>
                                        <th>Email</th>
                                        <th>Phone Number</th>
                                        <th>Two-Factor Enabled</th>
                                        <th>Lockout End Date</th>
                                        <th>Lockout Enabled</th>
                                        <th>Access Failed Count</th>
                                        <th>Username</th>
                                        <%--<th>Role ID</th>
                                        <th>Role Name</th>--%>
										<th>Roles</th>
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
                                    <td><asp:Label ID="lblLockoutEnabled" runat="server" Text='<%#Eval("[LockoutEnabled]") %>' /></td>
                                    <td><asp:Label ID="lblAccessFailedCount" runat="server" Text='<%#Eval("[AccessFailedCount]") %>' /></td>
                                    <td><asp:Label ID="lblUserName" runat="server" Text='<%#Eval("[UserName]") %>' /></td>

									<%--<td><asp:Label ID="lblRoleID" runat="server" Text='<%#Eval("[RoleID]") %>' /></td>
									<td><asp:Label ID="lblRoleName" runat="server" Text='<%#Eval("[Name]") %>' /></td>--%>

									<td><asp:Label ID="lblRoles" runat="server" Text='<%#Eval("[Roles]") %>' /></td>

                                    <td><asp:LinkButton ID="btnView" runat="server" Text="View" CommandName="View" CommandArgument='<%#Eval("UserID") %>'/></td>
                                </tr>
                            </ItemTemplate>

                        </asp:ListView>

                    </section>
                </section>

			</section>

			<!-- SEARCH column -->
            <section class="col-md-2">
                <h3>Search</h3>
                <p><asp:TextBox ID="txtEmail" runat="server" placeholder="Email"></asp:TextBox></p>
                <p><asp:TextBox ID="txtPhoneNumber" runat="server" placeholder="Phone Number"></asp:TextBox></p>
                <p><asp:TextBox ID="txtUserName" runat="server" placeholder="Username"></asp:TextBox></p>
                <p><asp:TextBox ID="txtRoleID" runat="server" placeholder="Role ID"></asp:TextBox></p>
                <p><asp:TextBox ID="txtName" runat="server" placeholder="Role Name"></asp:TextBox></p>

                <p><asp:Button ID="btnSearchSite" runat="server" Text="Search" CssClass="btn btn-primary"/></p>
            </section>
        </section>
    </section>

</asp:Content>
