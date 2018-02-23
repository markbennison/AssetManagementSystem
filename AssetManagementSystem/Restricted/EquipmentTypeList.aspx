<%@ Page Title="Equipment Types List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EquipmentTypeList.aspx.cs" Inherits="AssetManagementSystem.Restricted.EquipmentTypeList" %>
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
                        <h3><asp:linkbutton id="btnAddNew" PostBackUrl="~/Restricted/EquipmentTypeView.aspx" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus"/></h3>
                    </section>
                </section>

                <section class="row">
                    <section class="col-md-12">

                        <asp:ListView ID="LvEquipmentTypeList"  runat="server" OnItemCommand="LvEquipmentTypeList_ItemCommand">

                            <LayoutTemplate>
                                <table runat="server" id="tblEquipmentType" class="table table-hover">
							        <tr runat="server" >
                                        <th>Equipment Type ID</th>
                                        <th>Equipment Type Description</th>
                                        <th>Equipment Model Number</th>
                                        <th>Supplier ID</th>
                                        <th>View</th>
							        </tr>
                                    <tr runat="server" id="itemPlaceholder" ></tr>
                                </table>
                            </LayoutTemplate>

                            <ItemTemplate>
                                <tr runat="server">
							        <td><asp:Label ID="lblEquipmentTypeID" runat="server" Text='<%#Eval("[EquipmentTypeID]") %>' /></td>
							        <td><asp:Label ID="lblEquipmentTypeDesc" runat="server" Text='<%#Eval("[EquipmentTypeDesc]") %>' /></td>
                                    <td><asp:Label ID="lblEquipmentModelNo" runat="server" Text='<%#Eval("[EquipmentModelNo]") %>' /></td>
							        <td><asp:Label ID="lblSupplierID" runat="server" Text='<%#Eval("[SupplierID]") %>' /></td>

							        <td><asp:LinkButton ID="btnView" runat="server" Text="View" CommandName="View" CommandArgument='<%#Eval("EquipmentTypeID") %>'/></td>
						        </tr>
                            </ItemTemplate>

                        </asp:ListView>
                    </section>
                </section>
			</section>

            <!-- SEARCH container -->
<%--			<section class="col-md-4">
			    <h3>Search</h3>
				<p><asp:TextBox ID="txtSearchEquipmentTypeID" runat="server" placeholder="Equipment Type ID"></asp:TextBox></p>
				<p><asp:TextBox ID="txtSearchEquipmentTypeDesc" runat="server" placeholder="Equipment Type Description"></asp:TextBox></p>
				<p><asp:TextBox ID="txtSearchEquipmentModelNo" runat="server" placeholder="Equipment Model Number"></asp:TextBox></p>
				<p><asp:TextBox ID="txtSearchSupplierID" runat="server" placeholder="Supplier ID"></asp:TextBox></p>
				<p><asp:Button ID="btnSearchEquipmentType" runat="server" Text="Search" CssClass="btn btn-primary"/></p>
			</section>--%>

		</section>
	</section>
</asp:Content>
