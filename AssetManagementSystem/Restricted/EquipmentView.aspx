<%@ Page Title="Equipment View" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EquipmentView.aspx.cs" Inherits="AssetManagementSystem.Restricted.EquipmentView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %>.</h2>

    <section class="container">
        
        <asp:FormView 
            ID="FvEquipmentView" 
            runat="server" 
            CssClass="col-md-12"
            AllowPaging="false" 
            DataKeyNames="EquipmentInstanceID" 
            OnItemCommand="FvEquipmentView_ItemCommand"
            OnModeChanging="FvEquipmentView_ModeChanging"
            OnItemInserting="FvEquipmentView_ItemInserting"
            OnItemUpdating="FvEquipmentView_ItemUpdating"
            OnDataBound="FvEquipmentView_DataBound">
            
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
                        <table>
                            <tr><td>Equipment Instance ID:</td><td><asp:TextBox ID="txtEquipmentInstanceID" runat="server" Enabled="False" Text='<%#Eval("EquipmentInstanceID") %>'></asp:TextBox></td></tr>
                            <tr><td>Equipment Type ID:</td><td><asp:TextBox ID="txtEquipmentTypeID" runat="server" Enabled="False" Text='<%#Eval("EquipmentTypeID") %>'></asp:TextBox></td></tr>
                            <tr><td>Status:</td><td><asp:TextBox ID="txtStatus" runat="server" Enabled="False" Text='<%#Eval("Status") %>'></asp:TextBox></td></tr>
                            <tr><td>Serial Number:</td><td><asp:TextBox ID="txtSerialNumber" runat="server" Enabled="False" Text='<%#Eval("SerialNumber") %>'></asp:TextBox></td></tr>
                            <tr><td>Location ID:</td><td><asp:TextBox ID="txtLocationID" runat="server" Enabled="False" Text='<%#Eval("LocationID") %>'></asp:TextBox></td></tr>
                            <tr><td>Installation Date:</td><td><asp:TextBox ID="txtInstallationDate" runat="server" Enabled="False" Text='<%#Eval("InstallationDate") %>'></asp:TextBox></td></tr>
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
                        <table>
                            <tr><td>Equipment Instance ID:</td><td><asp:TextBox ID="txtEquipmentInstanceID" runat="server" Enabled="True" Text='<%#Bind("EquipmentInstanceID") %>'></asp:TextBox></td></tr>
                            <tr><td>Equipment Type ID:</td><td><asp:TextBox ID="txtEquipmentTypeID" runat="server" Enabled="True" Text='<%#Bind("EquipmentTypeID") %>'></asp:TextBox></td></tr>
                            <tr><td>Status:</td><td><asp:TextBox ID="txtStatus" runat="server" Enabled="True" Text='<%#Bind("Status") %>'></asp:TextBox></td></tr>
                            <tr><td>Serial Number:</td><td><asp:TextBox ID="txtSerialNumber" runat="server" Enabled="True" Text='<%#Bind("SerialNumber") %>'></asp:TextBox></td></tr>
                            <tr><td>Location ID:</td><td><asp:TextBox ID="txtLocationID" runat="server" Enabled="True" Text='<%#Bind("LocationID") %>'></asp:TextBox></td></tr>
                            <tr><td>Installation Date:</td><td><asp:TextBox ID="txtInstallationDate" runat="server" Enabled="True" Text='<%#Bind("InstallationDate") %>'></asp:TextBox></td></tr>

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
                        <table>
                            <tr><td>Equipment Instance ID:</td><td><asp:TextBox ID="txtEquipmentInstanceID" runat="server" Enabled="True" Text='<%#Bind("EquipmentInstanceID") %>'></asp:TextBox></td></tr>
                            <tr><td>Equipment Type ID:</td><td><asp:TextBox ID="txtEquipmentTypeID" runat="server" Enabled="True" Text='<%#Bind("EquipmentTypeID") %>'></asp:TextBox></td></tr>
                            <tr><td>Status:</td><td><asp:TextBox ID="txtStatus" runat="server" Enabled="True" Text='<%#Bind("Status") %>'></asp:TextBox></td></tr>
                            <tr><td>Serial Number:</td><td><asp:TextBox ID="txtSerialNumber" runat="server" Enabled="True" Text='<%#Bind("SerialNumber") %>'></asp:TextBox></td></tr>
                            <tr><td>Location ID:</td><td><asp:TextBox ID="txtLocationID" runat="server" Enabled="True" Text='<%#Bind("LocationID") %>'></asp:TextBox></td></tr>
                            <tr><td>Installation Date:</td><td><asp:TextBox ID="txtInstallationDate" runat="server" Enabled="True" Text='<%#Bind("InstallationDate") %>'></asp:TextBox></td></tr>

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
			Service List			
		  ------------------------------------------------------------%>

		<section class="row">
			<!-- LIST VIEW column -->
			<section class="col-xs-8">
				<h3>Service List</h3>
			</section>
			<section class="col-xs-4 text-right">
				<h3><asp:linkbutton id="btnAddNew" PostBackUrl="~/Restricted/ServiceView.aspx" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus btn"/></h3>
			</section>
		</section>

		<section class="row">
			<section class="col-md-12">
				<asp:ListView ID="LvServiceList" runat="server" OnItemCommand="LvServiceList_ItemCommand">

					<LayoutTemplate>
						<table runat="server" id="tblServices" class="table table-hover">
							<tr runat="server" >
								<th>ServiceID</th>
								<th>RequirementID</th>
								<th>EquipmentInstanceID</th>
								<th>ContractorID</th>
								<th>ActionedBy</th>
								<th>ActionedDateTime</th>
								<th>Charge</th>
								<th>CostCode</th>
								<th>ExpCode</th>
								<th>Notes</th>

								<th>View</th>
							</tr>
							<tr runat="server" id="itemPlaceholder" ></tr>
						</table>
					</LayoutTemplate>

					<ItemTemplate>
						<tr runat="server">
							<td><asp:Label ID="lblServiceID" runat="server" Text='<%#Eval("[ServiceID]") %>' /></td>
							<td><asp:Label ID="lblRequirementID" runat="server" Text='<%#Eval("[RequirementID]") %>' /></td>
							<td><asp:Label ID="lblEquipmentInstanceID" runat="server" Text='<%#Eval("[EquipmentInstanceID]") %>' /></td>
							<td><asp:Label ID="lblContractorID" runat="server" Text='<%#Eval("[ContractorID]") %>' /></td>
							<td><asp:Label ID="lblActionedBy" runat="server" Text='<%#Eval("[ActionedBy]") %>' /></td>
							<td><asp:Label ID="lblActionedDateTime" runat="server" Text='<%#Eval("[ActionedDateTime]") %>' /></td>
							<td><asp:Label ID="lblStatus" runat="server" Text='<%#Eval("[Status]") %>' /></td>
							<td><asp:Label ID="lblCharge" runat="server" Text='<%#Eval("[Charge]") %>' /></td>
							<td><asp:Label ID="lblCostCode" runat="server" Text='<%#Eval("[CostCode]") %>' /></td>
							<td><asp:Label ID="lblExpCode" runat="server" Text='<%#Eval("[ExpCode]") %>' /></td>
							<td><asp:Label ID="lblNotes" runat="server" Text='<%#Eval("[Notes]") %>' /></td>

							<td><asp:LinkButton ID="btnView" runat="server" Text="View" CommandName="View" CommandArgument='<%#Eval("ServiceID") %>'/></td>
						</tr>
					</ItemTemplate>

					<EmptyDataTemplate>
						<table runat="server" id="tblBuildings" class="table">
							<tr runat="server" >
								<th>ServiceID</th>
								<th>RequirementID</th>
								<th>EquipmentInstanceID</th>
								<th>ContractorID</th>
								<th>ActionedBy</th>
								<th>ActionedDateTime</th>
								<th>Charge</th>
								<th>CostCode</th>
								<th>ExpCode</th>
								<th>Notes</th>

								<th>View</th>
							</tr>
							<tr>
								<td colspan="11" class="text-center">No services listed for this item of equipment</td>
							</tr>
						</table>
					</EmptyDataTemplate>

				</asp:ListView>
			</section>
		</section>
    </section>

</asp:Content>
