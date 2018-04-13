<%@ Page Title="Building View" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BuildingView.aspx.cs" Inherits="AssetManagementSystem.Restricted.BuildingView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

	<h2><%: Title %>.</h2>

    <section class="container">
		<asp:FormView 
			ID="FvBuildingView" 
			runat="server" 
			CssClass="col-md-12" 
			AllowPaging="false" 
			DataKeyNames="BuildingID" 
			OnItemCommand="FvBuildingView_ItemCommand" 
			OnModeChanging="FvBuildingView_ModeChanging" 
			OnItemInserting="FvBuildingView_ItemInserting" 
			OnItemUpdating="FvBuildingView_ItemUpdating" 
			OnDataBound="FvBuildingView_DataBound">

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
                            <tr><td>Building ID:</td><td><asp:TextBox ID="txtBuildingID" runat="server" Enabled="False" Text='<%#Eval("BuildingID") %>'></asp:TextBox></td></tr>
                            <tr><td>Building Name:</td><td><asp:TextBox ID="txtBuildingName" runat="server" Enabled="False" Text='<%#Eval("BuildingName") %>'></asp:TextBox></td></tr>
							<tr><td>Site:</td><td><asp:DropDownList ID="ddlSite" runat="server" AutoPostBack="true" Enabled="False"/></td></tr>
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
                            <tr><td>Building ID:</td><td><asp:TextBox ID="txtBuildingID" runat="server" Enabled="True" Text='<%#Bind("BuildingID") %>'></asp:TextBox></td></tr>
                            <tr><td>Building Name:</td><td><asp:TextBox ID="txtBuildingName" runat="server" Enabled="True" Text='<%#Bind("BuildingName") %>'></asp:TextBox></td></tr>
							<tr><td>Site:</td><td><asp:DropDownList ID="ddlSite" runat="server" AutoPostBack="true"/></td></tr>

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
                            <tr><td>Building ID:</td><td><asp:TextBox ID="txtBuildingeID" runat="server" Enabled="True" Text='<%#Bind("BuildingID") %>'></asp:TextBox></td></tr>
                            <tr><td>Building Name:</td><td><asp:TextBox ID="txtBuildingName" runat="server" Enabled="True" Text='<%#Bind("BuildingName") %>'></asp:TextBox></td></tr>
							<tr><td>Site:</td><td><asp:DropDownList ID="ddlSite" runat="server" AutoPostBack="true"/></td></tr>

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

		<%------------------------------------------------------------
			Location List			
		  ------------------------------------------------------------%>

		<section class="row">
			<!-- LIST VIEW column -->
			<section class="col-xs-8">
				<h3>Location List</h3>
			</section>
			<section class="col-xs-4 text-right">
				<h3><asp:linkbutton id="btnAddNew" PostBackUrl="~/Restricted/LocationView.aspx" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus btn"/></h3>
			</section>
		</section>

		<section class="row">
			<section class="col-md-12">
				<asp:ListView ID="LvLocationList" runat="server" OnItemCommand="LvLocationList_ItemCommand">

					<LayoutTemplate>
						<table runat="server" id="tblLocations" class="table table-hover">
							<tr runat="server" >
								<th>Location ID</th>
								<th>Location Easy Name</th>
								<th>Location Type ID</th>
								<th>Location Type</th>
								<th>View</th>
							</tr>
							<tr runat="server" id="itemPlaceholder" ></tr>
						</table>
					</LayoutTemplate>

					<ItemTemplate>
						<tr runat="server">
							<td><asp:Label ID="lblLocationID" runat="server" Text='<%#Eval("[LocationID]") %>' /></td>
							<td><asp:Label ID="lblLocationEasyName" runat="server" Text='<%#Eval("[LocationEasyName]") %>' /></td>
							<td><asp:Label ID="lblLocationTypeID" runat="server" Text='<%#Eval("[LocationTypeID]") %>' /></td>
							<td><asp:Label ID="lblLocationTypeCaption" runat="server" Text='<%#Eval("[LocationTypeCaption]") %>' /></td>
							<td><asp:LinkButton ID="btnView" runat="server" CssClass="glyphicon glyphicon-eye-open btn" CommandName="View" CommandArgument='<%#Eval("LocationID") %>'/></td>
						</tr>
					</ItemTemplate>

					<EmptyDataTemplate>
						<table runat="server" id="tblLocations" class="table">
							<tr runat="server" >
								<th>Location ID</th>
								<th>Location Easy Name</th>
								<th>Location Type ID</th>
								<th>Location Type</th>
								<th>View</th>
							</tr>
							<tr>
								<td colspan="4" class="text-center">No locations listed for this building</td>
							</tr>
						</table>
					</EmptyDataTemplate>

				</asp:ListView>
			</section>
		</section>
	</section>

	<section class="alert-timeout alert-hidden alert alert-success">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>Success!</strong> The record has been saved.
	</section>

	<script src="../Scripts/SCscripts.js"></script>

</asp:Content>
