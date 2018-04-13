<%@ Page Title="Service View" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ServiceView.aspx.cs" Inherits="AssetManagementSystem.Restricted.ServiceView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %>.</h2>

    <section class="container">
        
        <asp:FormView 
            ID="FvServiceView" 
            runat="server" 
            CssClass="col-md-12"
            AllowPaging="false" 
            DataKeyNames="ServiceID" 
            OnItemCommand="FvServiceView_ItemCommand"
            OnModeChanging="FvServiceView_ModeChanging"
            OnItemInserting="FvServiceView_ItemInserting"
            OnItemUpdating="FvServiceView_ItemUpdating"
            OnDataBound="FvServiceView_DataBound">
            
            <ItemTemplate>
                <section class="row">
                    <section class="col-xs-8">
                        <h3>Form View (Read-Only)</h3>
                    </section>
                    <section class="col-xs-4 text-right">
                        <h3><asp:linkbutton id="btnInsertView" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus btn"/>
							<asp:linkbutton id="btnEditView" CommandName="Edit" runat="server" CssClass="glyphicon glyphicon-pencil btn"/>
							<asp:linkbutton id="btnListView" CommandName="ListView" runat="server" CssClass="glyphicon glyphicon-th-list btn"/>
                        </h3>
                    </section>
                </section>
                <section class="row">
                    <section class="col-xs-12">
                        <table class="table table-borderless table-condensed">
                            <tr><td>Service ID:</td><td><asp:TextBox ID="txtServiceID" runat="server" Enabled="False" Text='<%#Eval("ServiceID") %>' TextMode="Number"></asp:TextBox></td></tr>
                            <tr><td>Requirement ID:</td><td><asp:DropDownList ID="ddlRequirementID" runat="server" Enabled="False" AutoPostBack="True" OnSelectedIndexChanged="ddlRequirementID_SelectedIndexChanged"></asp:DropDownList></td></tr>
							<tr><td>Requirement Desc.:</td><td><asp:DropDownList ID="ddlRequirementDesc" runat="server" Enabled="False" AutoPostBack="True" OnSelectedIndexChanged="ddlRequirementDesc_SelectedIndexChanged"></asp:DropDownList></td></tr>
                            <tr><td>Equipment ID:</td><td><asp:DropDownList ID="ddlEquipmentID" runat="server" Enabled="False" AutoPostBack="True"></asp:DropDownList></td></tr>
                            <tr><td>Contractor ID:</td><td><asp:TextBox ID="txtContractorID" runat="server" Enabled="False" Text='<%#Eval("ContractorID") %>' TextMode="Number"></asp:TextBox></td></tr>
							<tr><td>Actioned By:</td><td><asp:DropDownList ID="ddlActionedBy" runat="server" Enabled="False" AutoPostBack="true"/></td></tr>
							<tr><td>Actioned On:</td><td><asp:Button ID="btnActionedOn" runat="server" Enabled="False" Text='<%#Eval("ActionedDateTime", "{0:dd/MM/yyyy}") %>' BackColor="#F0F0F0" BorderStyle="Inset"/>
								<asp:Calendar ID="calActionedOn" runat="server" Visible="False"></asp:Calendar></td></tr>
							<tr><td>Status:</td><td><asp:DropDownList ID="ddlStatus" runat="server" Enabled="False" SelectedValue='<%# Bind("Status") %>'>
								<asp:ListItem Text="Raised" Value="Raised" />
								<asp:ListItem Text="Complete" Value="Complete" /></asp:DropDownList></td></tr>
							<tr><td>Charge:</td><td><asp:TextBox ID="txtCharge" runat="server" Enabled="False" Text='<%#Eval("Charge") %>' TextMode="Number"></asp:TextBox></td></tr>
                            <tr><td>Cost Code:</td><td><asp:TextBox ID="txtCostCode" runat="server" Enabled="False" Text='<%#Eval("CostCode") %>'></asp:TextBox></td></tr>
							<tr><td>Exp Code:</td><td><asp:TextBox ID="txtExpCode" runat="server" Enabled="False" Text='<%#Eval("ExpCode") %>'></asp:TextBox></td></tr>
							<tr><td>Notes:</td><td><asp:TextBox ID="txtNotes" runat="server" Enabled="False" Text='<%#Eval("Notes") %>'></asp:TextBox></td></tr>
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
                            <tr><td>Service ID:</td><td><asp:TextBox ID="txtServiceID" runat="server" Enabled="True" Text='<%#Eval("ServiceID") %>' TextMode="Number"></asp:TextBox></td></tr>
                            <tr><td>Requirement ID:</td><td><asp:DropDownList ID="ddlRequirementID" runat="server" Enabled="True" AutoPostBack="True" OnSelectedIndexChanged="ddlRequirementID_SelectedIndexChanged"></asp:DropDownList></td></tr>
							<tr><td>Requirement Desc.:</td><td><asp:DropDownList ID="ddlRequirementDesc" runat="server" Enabled="True" AutoPostBack="True" OnSelectedIndexChanged="ddlRequirementDesc_SelectedIndexChanged"></asp:DropDownList></td></tr>
                            <tr><td>Equipment ID:</td><td><asp:DropDownList ID="ddlEquipmentID" runat="server" Enabled="True" AutoPostBack="True" ></asp:DropDownList></td></tr>
                            <tr><td>Contractor ID:</td><td><asp:TextBox ID="txtContractorID" runat="server" Enabled="True" Text='<%#Eval("ContractorID") %>' TextMode="Number"></asp:TextBox></td></tr>
							<tr><td>Actioned By:</td><td><asp:DropDownList ID="ddlActionedBy" runat="server" Enabled="True" AutoPostBack="true"/></td></tr>
							<tr><td>Actioned On:</td><td><asp:Button ID="btnActionedOn" runat="server" Enabled="True" Text='<%#Eval("ActionedDateTime", "{0:dd/MM/yyyy}") %>' BackColor="White" BorderStyle="Inset" OnClick="btnActionedOn_Click"/>
								<asp:Calendar ID="calActionedOn" runat="server" OnSelectionChanged="calActionedOn_SelectionChanged" Visible="False"></asp:Calendar></td></tr>
							<tr><td>Status:</td><td><asp:DropDownList ID="ddlStatus" runat="server" Enabled="True" SelectedValue='<%# Bind("Status") %>'>
								<asp:ListItem Text="Raised" Value="Raised" />
								<asp:ListItem Text="Complete" Value="Complete" /></asp:DropDownList></td></tr>
							<tr><td>Charge:</td><td><asp:TextBox ID="txtCharge" runat="server" Enabled="True" Text='<%#Eval("Charge") %>' TextMode="Number"></asp:TextBox></td></tr>
                            <tr><td>Cost Code:</td><td><asp:TextBox ID="txtCostCode" runat="server" Enabled="True" Text='<%#Eval("CostCode") %>'></asp:TextBox></td></tr>
							<tr><td>Exp Code:</td><td><asp:TextBox ID="txtExpCode" runat="server" Enabled="True" Text='<%#Eval("ExpCode") %>'></asp:TextBox></td></tr>
							<tr><td>Notes:</td><td><asp:TextBox ID="txtNotes" runat="server" Enabled="True" Text='<%#Eval("Notes") %>'></asp:TextBox></td></tr>

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
                            <tr><td>Service ID:</td><td><asp:TextBox ID="txtServiceID" runat="server" Enabled="False" Text='<%#Eval("ServiceID") %>' TextMode="Number"></asp:TextBox></td></tr>
                            <tr><td>Requirement ID:</td><td><asp:DropDownList ID="ddlRequirementID" runat="server" Enabled="True" AutoPostBack="True" OnSelectedIndexChanged="ddlRequirementID_SelectedIndexChanged"></asp:DropDownList></td></tr>
							<tr><td>Requirement Desc.:</td><td><asp:DropDownList ID="ddlRequirementDesc" runat="server" Enabled="True" AutoPostBack="True" OnSelectedIndexChanged="ddlRequirementDesc_SelectedIndexChanged"></asp:DropDownList></td></tr>
                            <tr><td>Equipment ID:</td><td><asp:DropDownList ID="ddlEquipmentID" runat="server" Enabled="True" AutoPostBack="True"></asp:DropDownList></td></tr>
                            <tr><td>Contractor ID:</td><td><asp:TextBox ID="txtContractorID" runat="server" Enabled="True" Text='<%#Eval("ContractorID") %>' TextMode="Number"></asp:TextBox></td></tr>
							<tr><td>Actioned By:</td><td><asp:DropDownList ID="ddlActionedBy" runat="server" Enabled="True" AutoPostBack="true"/></td></tr>
							<tr><td>Actioned On:</td><td><asp:Button ID="btnActionedOn" runat="server" Enabled="True" Text='<%# DateTime.Today.ToString("dd/MM/yyyy") %>' BackColor="White" BorderStyle="Inset" OnClick="btnActionedOn_Click"/>
								<asp:Calendar ID="calActionedOn" runat="server" OnSelectionChanged="calActionedOn_SelectionChanged" Visible="False"></asp:Calendar></td></tr>

							<tr><td>Status:</td><td><asp:DropDownList ID="ddlStatus" runat="server" Enabled="True" SelectedValue='<%# Bind("Status") %>'>
								<asp:ListItem Text="Raised" Value="Raised" />
								<asp:ListItem Text="Complete" Value="Complete" /></asp:DropDownList></td></tr>
							<tr><td>Charge:</td><td><asp:TextBox ID="txtCharge" runat="server" Enabled="True" Text='<%#Eval("Charge") %>' TextMode="Number"></asp:TextBox></td></tr>
                            <tr><td>Cost Code:</td><td><asp:TextBox ID="txtCostCode" runat="server" Enabled="True" Text='<%#Eval("CostCode") %>'></asp:TextBox></td></tr>
							<tr><td>Exp Code:</td><td><asp:TextBox ID="txtExpCode" runat="server" Enabled="True" Text='<%#Eval("ExpCode") %>'></asp:TextBox></td></tr>
							<tr><td>Notes:</td><td><asp:TextBox ID="txtNotes" runat="server" Enabled="True" Text='<%#Eval("Notes") %>'></asp:TextBox></td></tr>

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

</asp:Content>
