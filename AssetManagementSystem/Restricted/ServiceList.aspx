<%@ Page Title="Service List" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ServiceList.aspx.cs" Inherits="AssetManagementSystem.Restricted.ServiceList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

	<h2><%: Title %>.</h2>

    <section class="container">
		<!-- Title & Search Row -->
		<section class="row">
			<section class="col-md-12">
				<!-- Title Controls -->
				<section class="row ">
					<section class="col-xs-8">
						<h3>List View</h3>
					</section>
					<section class="col-xs-4 text-right">
						<h3>
							<a data-toggle="collapse" href="#searchBar" aria-expanded="false" aria-controls="searchBar"><asp:Label ID="lblSearch" runat="server" CssClass="glyphicon glyphicon-search btn" /></a>
							<asp:linkbutton id="btnAddNew" PostBackUrl="~/Restricted/EquipmentView.aspx" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus btn"/>
						</h3>
					</section>
				</section>

				<!-- Search Boxes -->
				<section class="row collapse" id="searchBar">
					<section class="col-md-12">
						<p><asp:TextBox ID="txtSearchServiceID" runat="server" placeholder="Service ID" TextMode="Number"></asp:TextBox></p>
						<p><asp:TextBox ID="txtSearchRequirementID" runat="server" placeholder="Requirement ID" TextMode="Number"></asp:TextBox></p>
						<p><asp:TextBox ID="txtSearchRequirementDesc" runat="server" placeholder="Req Description"></asp:TextBox></p>
						<p><asp:TextBox ID="txtSearchEquipmentID" runat="server" placeholder="Equipment ID"></asp:TextBox></p>
						<p><asp:TextBox ID="txtSearchContractorID" runat="server" placeholder="Contractor ID"></asp:TextBox></p>
						<p><asp:TextBox ID="txtSearchActionedBy" runat="server" placeholder="Actioned By"></asp:TextBox></p>
						<p><asp:TextBox ID="txtSearchActionedFrom" runat="server" placeholder="Actioned After"></asp:TextBox></p>
						<p><asp:TextBox ID="txtSearchActionedTo" runat="server" placeholder="Actioned Before"></asp:TextBox></p>
						<p><asp:TextBox ID="txtSearchStatus" runat="server" placeholder="Status"></asp:TextBox></p>
						<p><asp:TextBox ID="txtSearchCharge" runat="server" placeholder="Charge"></asp:TextBox></p>
						<p><asp:TextBox ID="txtSearchCostCode" runat="server" placeholder="Cost Code"></asp:TextBox></p>
						<p><asp:TextBox ID="txtSearchExpCode" runat="server" placeholder="Exp Code"></asp:TextBox></p>

						<p><asp:Button ID="btnSearchServices" runat="server" Text="Search" CssClass="btn btn-primary"/></p>
					</section>
				</section>
			</section>
		</section>

		<%------------------------------------------------------------
			Service List
		  ------------------------------------------------------------%>
        <section class="row">
            <section class="col-md-12">
                <asp:ListView ID="LvServiceList"  runat="server" OnItemCommand="LvServiceList_ItemCommand">
                    <LayoutTemplate>
						<asp:DataPager ID="DataPager_LvServiceList" PageSize="10" PagedControlID="LvServiceList" runat="server" OnPreRender="DataPager_LvServiceList_PreRender">
							<Fields>
								<asp:NumericPagerField ButtonCount="10" CurrentPageLabelCssClass="btn btn-primary btn-sm" NumericButtonCssClass="btn btn-default btn-sm" ButtonType="Button" />
							</Fields>
						</asp:DataPager>
                        <table runat="server" id="tblEquipment" class="table table-hover">
							<tr runat="server" >
                                <th>Service ID</th>
                                <th>Requirement ID</th>
								<th>Req Description</th>
                                <th>Equipment ID</th>
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
							<td><asp:Label ID="lblServiceID" runat="server" Text='<%#Eval("ServiceID") %>' /></td>
							<td><asp:Label ID="lblRequirementID" runat="server" Text='<%#Eval("RequirementID") %>' /></td>
							<td><asp:Label ID="lblRequirementDesc" runat="server"  Text='<%#Eval("RequirementDesc") %>' /></td>
							<td><asp:Label ID="lblEquipmentID" runat="server"  Text='<%#Eval("EquipmentInstanceID") %>' /></td>
							<td><asp:Label ID="lblContractorID" runat="server"  Text='<%#Eval("ContractorID") %>' /></td>
							<td><asp:Label ID="lblActionedBy" runat="server"  Text='<%#Eval("ActionedBy") %>' /></td>
							<td><asp:Label ID="lblActionedOn" runat="server" Text='<%#Eval("ActionedDateTime", "{0:dd/MM/yyyy}") %>' /></td>
							<td><asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>' /></td>
							<td><asp:Label ID="lblCharge" runat="server" Text='<%#Eval("Charge") %>' /></td>
							<td><asp:Label ID="lblCostCode" runat="server" Text='<%#Eval("CostCode") %>' /></td>
							<td><asp:Label ID="lblExpCode" runat="server" Text='<%#Eval("ExpCode") %>' /></td>

							<td><asp:LinkButton ID="btnView" runat="server" CssClass="glyphicon glyphicon-eye-open btn" CommandName="View" CommandArgument='<%#Eval("ServiceID") %>'/></td>
						</tr>
                    </ItemTemplate>

                </asp:ListView>
            </section>
        </section>
	</section>
</asp:Content>
