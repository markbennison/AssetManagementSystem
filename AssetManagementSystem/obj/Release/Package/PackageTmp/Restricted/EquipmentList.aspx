<%@ Page Title="Equipment List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EquipmentList.aspx.cs" Inherits="AssetManagementSystem.Restricted.EquipmentList" %>
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
                        <h3><asp:linkbutton id="btnAddNew" PostBackUrl="~/Restricted/EquipmentView.aspx" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus"/></h3>
                    </section>
                </section>

                <section class="row">
                    <section class="col-md-12">

                        <asp:ListView ID="LvEquipmentList"  runat="server" OnItemCommand="LvEquipmentList_ItemCommand">

                            <LayoutTemplate>
                                <table runat="server" id="tblEquipment" class="table table-hover">
							        <tr runat="server" >
                                        <th>Equipment ID</th>
                                        <th>Equipment Type ID</th>
                                        <th>Status</th>
                                        <th>Serial Number</th>
                                        <th>Location ID</th>
                                        <th>Installation Date</th>
                                        <th>View</th>
							        </tr>
                                    <tr runat="server" id="itemPlaceholder" ></tr>
                                </table>
                            </LayoutTemplate>

                            <ItemTemplate>
                                <tr runat="server">
							        <td><asp:Label ID="lblEquipmentInstanceID" runat="server" Text='<%#Eval("[EquipmentInstanceID]") %>' /></td>
							        <td><asp:Label ID="lblEquipmentTypeID" runat="server" Text='<%#Eval("[EquipmentTypeID]") %>' /></td>
                                    <td><asp:Label ID="lblStatus" runat="server" Text='<%#Eval("[Status]") %>' /></td>
							        <td><asp:Label ID="lblSerialNumber" runat="server" Text='<%#Eval("[SerialNumber]") %>' /></td>
							        <td><asp:Label ID="lblLocationID" runat="server" Text='<%#Eval("[LocationID]") %>' /></td>
							        <td><asp:Label ID="lblInstallationDate" runat="server" Text='<%#Eval("[InstallationDate]", "{0:dd/MM/yyyy}") %>' /></td>

							        <td><asp:LinkButton ID="btnView" runat="server" Text="View" CommandName="View" CommandArgument='<%#Eval("EquipmentInstanceID") %>'/></td>
						        </tr>
                            </ItemTemplate>

                        </asp:ListView>
                    </section>
                </section>
			</section>

            <!-- SEARCH container -->
			<section class="col-md-4">
			    <h3>Search</h3>
				<p><asp:TextBox ID="txtSearchEquipmentInstanceID" runat="server" placeholder="Equipment ID" TextMode="Number"></asp:TextBox></p>
				<p><asp:TextBox ID="txtSearchEquipmentTypeID" runat="server" placeholder="Equipment Type ID" TextMode="Number"></asp:TextBox></p>
				<p><asp:TextBox ID="txtSearchStatus" runat="server" placeholder="Status"></asp:TextBox></p>
				<p><asp:TextBox ID="txtSearchSerialNumber" runat="server" placeholder="Serial Number"></asp:TextBox></p>
				<p><asp:TextBox ID="txtSearchLocationID" runat="server" placeholder="Location ID" TextMode="Number"></asp:TextBox></p>
				<p><asp:TextBox ID="txtSearchInstallationStartDate" runat="server" placeholder="Installation Date: From" TextMode="Date"></asp:TextBox></p>
				<p><asp:TextBox ID="txtSearchInstallationEndDate" runat="server" placeholder="Installation Date: To" TextMode="Date"></asp:TextBox></p>
				<p><asp:Button ID="btnSearchSite" runat="server" Text="Search" CssClass="btn btn-primary"/></p>
			</section>

		</section>
	</section>

</asp:Content>
