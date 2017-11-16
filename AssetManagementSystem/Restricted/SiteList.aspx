<%@ Page Title="Site List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SiteList.aspx.cs" Inherits="AssetManagementSystem.SiteList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %>.</h2>

    <section class="container">
		<section class="row">
            <!-- LIST VIEW column -->
			<section class="col-md-8">

                <section class="row">
                    <section class="col-xs-8">
                        <h3>List View</h3>
                    </section>
                    <section class="col-xs-4 text-right">
                        <h3><asp:linkbutton id="btnAddNew" PostBackUrl="~/Restricted/SiteView.aspx" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus"/></h3>
                    </section>
                </section>

                <section class="row">
                    <section class="col-md-12">

                        <asp:ListView ID="LvSiteList"  runat="server" OnItemCommand="LvSiteList_ItemCommand">

                            <LayoutTemplate>
                                <table runat="server" id="tblEquipment" class="table table-hover">
							        <tr runat="server" >
                                        <th>Site ID</th>
                                        <th>Site Name</th>
                                        <th>Status</th>
                                        <th>Address Line 1</th>
                                        <th>Address Line 2</th>
                                        <th>City</th>
                                        <th>Post Code</th>
                                        <th>View</th>
							        </tr>
                                    <tr runat="server" id="itemPlaceholder" ></tr>
                                </table>
                            </LayoutTemplate>

                            <ItemTemplate>
                                <tr runat="server">
							        <td><asp:Label ID="lblSiteID" runat="server" Text='<%#Eval("[SiteID]") %>' /></td>
							        <td><asp:Label ID="lblSiteName" runat="server" Text='<%#Eval("[SiteName]") %>' /></td>
                                    <td><asp:Label ID="lblStatus" runat="server" Text='<%#Eval("[Status]") %>' /></td>
							        <td><asp:Label ID="lblAddress1" runat="server" Text='<%#Eval("[Address 1]") %>' /></td>
							        <td><asp:Label ID="lblAddress2" runat="server" Text='<%#Eval("[Address 2]") %>' /></td>
							        <td><asp:Label ID="lblCity" runat="server" Text='<%#Eval("[City]") %>' /></td>
							        <td><asp:Label ID="lblPostCode" runat="server" Text='<%#Eval("[PostCode]") %>' /></td>
							        <td><asp:LinkButton ID="btnView" runat="server" Text="View" CommandName="View" CommandArgument='<%#Eval("SiteID") %>'/></td>
						        </tr>
                            </ItemTemplate>

                        </asp:ListView>
                    </section>
                </section>
			</section>

            <!-- SEARCH container -->
			<section class="col-md-4">
			    <h3>Search</h3>
				<p><asp:TextBox ID="txtSearchSiteID" runat="server" placeholder="Site ID"></asp:TextBox></p>
				<p><asp:TextBox ID="txtSearchSiteName" runat="server" placeholder="Site Name"></asp:TextBox></p>
				<p><asp:TextBox ID="txtSearchStatus" runat="server" placeholder="Status"></asp:TextBox></p>
				<p><asp:TextBox ID="txtSearchAddress1" runat="server" placeholder="Address Line 1"></asp:TextBox></p>
				<p><asp:TextBox ID="txtSearchAddress2" runat="server" placeholder="Address Line 2"></asp:TextBox></p>
				<p><asp:TextBox ID="txtSearchCity" runat="server" placeholder="City"></asp:TextBox></p>
                <p><asp:TextBox ID="txtSearchPostCode" runat="server" placeholder="Post Code"></asp:TextBox></p>
				<p><asp:Button ID="btnSearchSite" runat="server" Text="Search" CssClass="btn btn-primary"/></p>
			</section>

		</section>
	</section>
</asp:Content>
