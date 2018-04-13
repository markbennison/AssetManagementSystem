<%@ Page Title="Location View" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LocationView.aspx.cs" Inherits="AssetManagementSystem.Restricted.LocationView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

	<h2><%: Title %>.</h2>

    <section class="container">
		<asp:FormView 
			ID="FvLocationView" 
			runat="server" 
			CssClass="col-md-12" 
			AllowPaging="false" 
			DataKeyNames="LocationID" 
			OnItemCommand="FvLocationView_ItemCommand" 
			OnModeChanging="FvLocationView_ModeChanging"
			OnItemInserting="FvLocationView_ItemInserting"
			OnItemUpdating="FvLocationView_ItemUpdating"
			OnDataBound="FvLocationView_DataBound">

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
                            <tr><td>Location ID:</td><td><asp:TextBox ID="txtLocationID" runat="server" Enabled="False" Text='<%#Eval("LocationID") %>'></asp:TextBox></td></tr>
                            <tr><td>Location Easy Name:</td><td><asp:TextBox ID="txtLocationEasyName" runat="server" Enabled="False" Text='<%#Eval("LocationEasyName") %>'></asp:TextBox></td></tr>
							<tr><td>Location Type:</td><td><asp:DropDownList ID="ddlLocationType" runat="server" AutoPostBack="true" Enabled="False"/></td></tr>
							<tr><td>Building:</td><td><asp:DropDownList ID="ddlBuilding" runat="server" AutoPostBack="true" Enabled="False"/></td></tr>
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
                            <tr><td>Location ID:</td><td><asp:TextBox ID="txtLocationID" runat="server" Enabled="True" Text='<%#Bind("LocationID") %>'></asp:TextBox></td></tr>
                            <tr><td>Location Easy Name:</td><td><asp:TextBox ID="txtLocationEasyName" runat="server" Enabled="True" Text='<%#Bind("LocationEasyName") %>'></asp:TextBox></td></tr>
							<tr><td>Location Type:</td><td><asp:DropDownList ID="ddlLocationType" runat="server" AutoPostBack="true"/></td></tr>
							<tr><td>Building:</td><td><asp:DropDownList ID="ddlBuilding" runat="server" AutoPostBack="true"/></td></tr>

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
                            <tr><td>Location ID:</td><td><asp:TextBox ID="txtLocationID" runat="server" Enabled="True" Text='<%#Bind("LocationID") %>'></asp:TextBox></td></tr>
                            <tr><td>Location Easy Name:</td><td><asp:TextBox ID="txtLocationEasyName" runat="server" Enabled="True" Text='<%#Bind("LocationEasyName") %>'></asp:TextBox></td></tr>
							<tr><td>Location Type:</td><td><asp:DropDownList ID="ddlLocationType" runat="server" AutoPostBack="true"/></td></tr>
							<tr><td>Building:</td><td><asp:DropDownList ID="ddlBuilding" runat="server" AutoPostBack="true"/></td></tr>

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

	<section class="alert-timeout alert-hidden alert alert-success">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>Success!</strong> The record has been saved.
	</section>

	<script src="../Scripts/SCscripts.js"></script>

</asp:Content>
