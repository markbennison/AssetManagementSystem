<%@ Page Title="Equipment Types View" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EquipmentTypeView.aspx.cs" Inherits="AssetManagementSystem.Restricted.EquipmentTypeView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %>.</h2>

    <section class="container">
        
        <asp:FormView 
            ID="FvEquipmentTypeView" 
            runat="server" 
            CssClass="col-md-12"
            AllowPaging="false" 
            DataKeyNames="EquipmentTypeID" 
            OnItemCommand="FvEquipmentTypeView_ItemCommand"
            OnModeChanging="FvEquipmentTypeView_ModeChanging"
            OnItemInserting="FvEquipmentTypeView_ItemInserting"
            OnItemUpdating="FvEquipmentTypeView_ItemUpdating"
            OnDataBound="FvEquipmentTypeView_DataBound">
            
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
                            <tr><td>Equipment Type ID:</td><td><asp:TextBox ID="txtEquipmentTypeID" runat="server" Enabled="False" Text='<%#Eval("EquipmentTypeID") %>'></asp:TextBox></td></tr>
                            <tr><td>Equipment Type Description:</td><td><asp:TextBox ID="txtEquipmentTypeDesc" runat="server" Enabled="False" Text='<%#Eval("EquipmentTypeDesc") %>'></asp:TextBox></td></tr>
                            <tr><td>Equipment Model No:</td><td><asp:TextBox ID="txtEquipmentModelNo" runat="server" Enabled="False" Text='<%#Eval("EquipmentModelNo") %>'></asp:TextBox></td></tr>
                            <tr><td>SupplierID:</td><td><asp:TextBox ID="txtSupplierID" runat="server" Enabled="False" Text='<%#Eval("SupplierID") %>'></asp:TextBox></td></tr>
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
                            <tr><td>Equipment Type ID:</td><td><asp:TextBox ID="txtEquipmentTypeID" runat="server" Enabled="True" Text='<%#Bind("EquipmentTypeID") %>'></asp:TextBox></td></tr>
                            <tr><td>Equipment Type Description:</td><td><asp:TextBox ID="txtEquipmentTypeDesc" runat="server" Enabled="True" Text='<%#Bind("EquipmentTypeDesc") %>'></asp:TextBox></td></tr>
                            <tr><td>Equipment Model No:</td><td><asp:TextBox ID="txtEquipmentModelNo" runat="server" Enabled="True" Text='<%#Bind("EquipmentModelNo") %>'></asp:TextBox></td></tr>
                            <tr><td>SupplierID:</td><td><asp:TextBox ID="txtSupplierID" runat="server" Enabled="True" Text='<%#Bind("SupplierID") %>'></asp:TextBox></td></tr>

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
                            <tr><td>Equipment Type ID:</td><td><asp:TextBox ID="txtEquipmentTypeID" runat="server" Enabled="True" Text='<%#Bind("EquipmentTypeID") %>'></asp:TextBox></td></tr>
                            <tr><td>Equipment Type Description:</td><td><asp:TextBox ID="txtEquipmentTypeDesc" runat="server" Enabled="True" Text='<%#Bind("EquipmentTypeDesc") %>'></asp:TextBox></td></tr>
                            <tr><td>Equipment Model No:</td><td><asp:TextBox ID="txtEquipmentModelNo" runat="server" Enabled="True" Text='<%#Bind("EquipmentModelNo") %>'></asp:TextBox></td></tr>
                            <tr><td>SupplierID:</td><td><asp:TextBox ID="txtSupplierID" runat="server" Enabled="True" Text='<%#Bind("SupplierID") %>'></asp:TextBox></td></tr>

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
			Requirement List			
		  ------------------------------------------------------------%>

		<section class="row">
			<!-- LIST VIEW column -->
			<section class="col-xs-8">
				<h3>Requirement List</h3>
			</section>
			<section class="col-xs-4 text-right">
				<h3><asp:linkbutton id="btnAddNewRequirement" OnClick="btnAddNewRequirement_Click" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus btn"/></h3>
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
								<th>MaterialsNote</th>
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
							<td><asp:Label ID="lblMaterialsNote" runat="server" Text='<%#Eval("[MaterialsNote]") %>' /></td>
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
								<th>MaterialsNote</th>
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

		<%------------------------------------------------------------
			Equipment Instance List	By Type ID
		  ------------------------------------------------------------%>

		<section class="row">
			<!-- LIST VIEW column -->
			<section class="col-xs-8">
				<h3>Equipment List</h3>
			</section>
			<section class="col-xs-4 text-right">
				<h3><asp:linkbutton id="btnAddNewEquipment" PostBackUrl="~/Restricted/EquipmentView.aspx" CommandName="New" runat="server" CssClass="glyphicon glyphicon-plus btn"/></h3>
			</section>
		</section>

		<section class="row">
			<section class="col-md-12">
				<asp:ListView ID="LvEquipmentList" runat="server" OnItemCommand="LvEquipmentList_ItemCommand">

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

					<EmptyDataTemplate>
						<table runat="server" id="tblEquipment" class="table">
							<tr runat="server" >
								<th>Equipment ID</th>
                                <th>Equipment Type ID</th>
                                <th>Status</th>
                                <th>Serial Number</th>
                                <th>Location ID</th>
                                <th>Installation Date</th>

								<th>View</th>
							</tr>
							<tr>
								<td colspan="9" class="text-center">No equipment exists of this type</td>
							</tr>
						</table>
					</EmptyDataTemplate>
				</asp:ListView>
			</section>
		</section>




    </section>

</asp:Content>
