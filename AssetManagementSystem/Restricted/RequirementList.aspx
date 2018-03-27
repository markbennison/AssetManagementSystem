<%@ Page Title="Requirements" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RequirementList.aspx.cs" Inherits="AssetManagementSystem.Restricted.RequirementList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

	<h2><%: Title %>.</h2>
	<section class="container">


		<%------------------------------------------------------------
			Active Requirements (List)			
		  ------------------------------------------------------------%>

		<section class="row">
			<!-- LIST VIEW column -->
			<section class="col-xs-8">
				<h3>Pending Service Requirements</h3>
			</section>
		</section>

		<section class="row">
			<section class="col-md-12">
				<asp:ListView ID="LvActiveRequirementList" runat="server" OnItemCommand="LvActiveRequirementList_ItemCommand">
					<LayoutTemplate>
						<asp:DataPager ID="DataPager_LvActiveRequirementList" PageSize="10" PagedControlID="LvActiveRequirementList" runat="server" OnPreRender="DataPager_LvActiveRequirementList_PreRender">
							<Fields>
								<asp:NumericPagerField ButtonCount="10" CurrentPageLabelCssClass="btn btn-primary btn-sm" NumericButtonCssClass="btn btn-default btn-sm" ButtonType="Button" />
							</Fields>
						</asp:DataPager>
						<table runat="server" id="tblServices" class="table table-hover">
							<tr runat="server" >
								<th>Equipment ID</th>
								<th>Requirement ID</th>
								<th>Description</th>
								<th>Priority</th>
								<th>First required (months)</th>
								<th>Frequency (months)</th>
								<th>Last Actioned</th>
								<th>Next Due</th>

								<th>View</th>
							</tr>
							<tr runat="server" id="itemPlaceholder"></tr>
						</table>
					</LayoutTemplate>

					<ItemTemplate>
						<tr runat="server"  class='<%# Convert.ToDateTime(Eval("[NextDue]", "{0:dd/MM/yyyy}")) < DateTime.Today ? "danger" : Convert.ToDateTime(Eval("[NextDue]", "{0:dd/MM/yyyy}")) < DateTime.Today.AddMonths(1) ? "warning" : "success" %>' >
							<td><asp:Label ID="lblEquipmentInstanceIDL" runat="server" Text='<%#Eval("[EquipmentInstanceID]") %>' /></td>
							<td><asp:Label ID="lblReqID" runat="server" Text='<%#Eval("[RequirementID]") %>' /></td>
							<td><asp:Label ID="lblReqDesc" runat="server" Text='<%#Eval("[RequirementDesc]") %>' /></td>
							<td><asp:Label ID="lblPriority" runat="server" Text='<%#Eval("[Priority]") %>' /></td>
							<td><asp:Label ID="lblFirstImplementation" runat="server" Text='<%#Eval("[FirstImplementation]") %>' /></td>
							<td><asp:Label ID="lblFrequency" runat="server" Text='<%#Eval("[Frequency]") %>' /></td>
							<td><asp:Label ID="lblLastActioned" runat="server" Text='<%#Eval("[LastActioned]", "{0:dd/MM/yyyy}") %>' /></td>
							<td><asp:Label ID="lblNextDue" runat="server" Text='<%#Eval("[NextDue]", "{0:dd/MM/yyyy}") %>' /></td>
							
							<td><asp:LinkButton ID="btnView" runat="server" Text="View" CommandName="View" CommandArgument='<%#Eval("RequirementID") %>'/></td>
						</tr>
					</ItemTemplate>

					<EmptyDataTemplate>
						<table runat="server" id="tblBuildings" class="table">
							<tr runat="server" >
								<th>Equipment ID</th>
								<th>Requirement ID</th>
								<th>Description</th>
								<th>Priority</th>
								<th>First required (months)</th>
								<th>Frequency (months)</th>
								<th>Last Actioned</th>
								<th>Next Due</th>

								<th>View</th>
							</tr>
							<tr>
								<td colspan="11" class="text-center">No service requirements due.</td>
							</tr>
						</table>
					</EmptyDataTemplate>

				</asp:ListView>
			</section>
		</section>


		<%------------------------------------------------------------
			General Requirements (List)			
		  ------------------------------------------------------------%>


		<section class="row">
			<!-- LIST VIEW column -->
			<section class="col-xs-8">
				<h3>All Requirements</h3>
			</section>
			<section class="col-xs-4 text-right">
				<h3><asp:linkbutton id="btnAddNewRequirement" PostBackUrl="~/Restricted/RequirementView.aspx" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus btn"/></h3>
			</section>
		</section>

		<section class="row">
			<section class="col-md-12">
				<asp:ListView ID="LvRequirementList" runat="server" OnItemCommand="LvRequirementList_ItemCommand">

					<LayoutTemplate>
						<table runat="server" id="tblRequirements" class="table table-hover">
							<tr runat="server" >
								<th>Requirement ID</th>
								<th>Description</th>
								<th>Equipment Type ID</th>
								<th>Priority</th>
								<th>First Implementation</th>
								<th>Frequency</th>
								<th>LegislationURL</th>

								<th>View</th>
							</tr>
							<tr runat="server" id="itemPlaceholder" ></tr>
						</table>
					</LayoutTemplate>

					<ItemTemplate>
						<tr runat="server">
							<td><asp:Label ID="lblRequirementID" runat="server" Text='<%#Eval("[RequirementID]") %>' /></td>
							<td><asp:Label ID="lblRequirementDesc" runat="server" Text='<%#Eval("[RequirementDesc]") %>' /></td>
							<td><asp:Label ID="lblEquipmentTypeID" runat="server" Text='<%#Eval("[EquipmentTypeID]") %>' /></td>
							<td><asp:Label ID="lblPriority" runat="server" Text='<%#Eval("[Priority]") %>' /></td>
							<td><asp:Label ID="lblFirstImplementation" runat="server" Text='<%#Eval("[FirstImplementation]") %>' /></td>
							<td><asp:Label ID="lblFrequency" runat="server" Text='<%#Eval("[Frequency]") %>' /></td>
							<td><asp:Label ID="lblLegislationURL" runat="server" Text='<%#Eval("[LegislationURL]") %>' /></td>

							<td><asp:LinkButton ID="btnView" runat="server" Text="View" CommandName="View" CommandArgument='<%#Eval("RequirementID") %>'/></td>
						</tr>
					</ItemTemplate>

					<EmptyDataTemplate>
						<table runat="server" id="tblRequirements" class="table">
							<tr runat="server" >
								<th>Requirement ID</th>
								<th>Description</th>
								<th>Equipment Type ID</th>
								<th>Priority</th>
								<th>First Implementation</th>
								<th>Frequency</th>
								<th>LegislationURL</th>

								<th>View</th>
							</tr>
							<tr>
								<td colspan="9" class="text-center">No requirements listed for this equipment type</td>
							</tr>
						</table>
					</EmptyDataTemplate>
				</asp:ListView>
			</section>
		</section>
	</section>

</asp:Content>
