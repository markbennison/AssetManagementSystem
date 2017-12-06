<%@ Page Title="Site View" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SiteView.aspx.cs" Inherits="AssetManagementSystem.Restricted.SiteView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Title %>.</h2>

    <section class="container">
        
        <asp:FormView 
            ID="FvSiteView" 
            runat="server" 
            CssClass="col-md-12"
            AllowPaging="false" 
            DataKeyNames="SiteID" 
            OnItemCommand="FvSiteView_ItemCommand" 
            OnModeChanging="FvSiteView_ModeChanging"
            OnItemInserting="FvSiteView_ItemInserting"
            OnItemUpdating="FvSiteView_ItemUpdating"
            OnDataBound="FvSiteView_DataBound">
            
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
                        <table>
                            <tr><td>Site ID:</td><td><asp:TextBox ID="txtSiteID" runat="server" Enabled="False" Text='<%#Eval("SiteID") %>'></asp:TextBox></td></tr>
                            <tr><td>Site Name:</td><td><asp:TextBox ID="txtSiteName" runat="server" Enabled="False" Text='<%#Eval("SiteName") %>'></asp:TextBox></td></tr>
                            <tr><td>Address Line 1:</td><td><asp:TextBox ID="txtAddress1" runat="server" Enabled="False" Text='<%#Eval("[Address 1]") %>'></asp:TextBox></td></tr>
                            <tr><td>Address Line 2:</td><td><asp:TextBox ID="txtAddress2" runat="server" Enabled="False" Text='<%#Eval("[Address 2]") %>'></asp:TextBox></td></tr>
                            <tr><td>City:</td><td><asp:TextBox ID="txtCity" runat="server" Enabled="False" Text='<%#Eval("City") %>'></asp:TextBox></td></tr>
                            <tr><td>Post Code:</td><td><asp:TextBox ID="txtPostCode" runat="server" Enabled="False" Text='<%#Eval("PostCode") %>'></asp:TextBox></td></tr>
                            <tr><td>Status:</td><td><asp:TextBox ID="txtStatus" runat="server" Enabled="False" Text='<%#Eval("Status") %>'></asp:TextBox></td></tr>
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
                            <tr><td>Site ID:</td><td><asp:TextBox ID="txtSiteID" runat="server" Enabled="True" Text='<%#Bind("SiteID") %>'></asp:TextBox></td></tr>
                            <tr><td>Site Name:</td><td><asp:TextBox ID="txtSiteName" runat="server" Enabled="True" Text='<%#Bind("SiteName") %>'></asp:TextBox></td></tr>
                            <tr><td>Address Line 1:</td><td><asp:TextBox ID="txtAddress1" runat="server" Enabled="True" Text='<%#Bind("[Address 1]") %>'></asp:TextBox></td></tr>
                            <tr><td>Address Line 2:</td><td><asp:TextBox ID="txtAddress2" runat="server" Enabled="True" Text='<%#Bind("[Address 2]") %>'></asp:TextBox></td></tr>
                            <tr><td>City:</td><td><asp:TextBox ID="txtCity" runat="server" Enabled="True" Text='<%#Bind("City") %>'></asp:TextBox></td></tr>
                            <tr><td>Post Code:</td><td><asp:TextBox ID="txtPostCode" runat="server" Enabled="True" Text='<%#Bind("PostCode") %>'></asp:TextBox></td></tr>
                            <tr><td>Status:</td><td><asp:TextBox ID="txtStatus" runat="server" Enabled="True" Text='<%#Bind("Status") %>'></asp:TextBox></td></tr>

                            <tr><td></td><td><asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update" Text="Save" CssClass="btn btn-primary"/></td></tr>
                        </table>
                    </section>
                </section>

            </EditItemTemplate>

            <InsertItemTemplate>
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

                <section class="row">
                    <section class="col-xs-12">
                        <table>
                            <tr><td>Site ID:</td><td><asp:TextBox ID="txtSiteID" runat="server" Enabled="True" Text='<%#Bind("SiteID") %>'></asp:TextBox></td></tr>
                            <tr><td>Site Name:</td><td><asp:TextBox ID="txtSiteName" runat="server" Enabled="True" Text='<%#Bind("SiteName") %>'></asp:TextBox></td></tr>
                            <tr><td>Address Line 1:</td><td><asp:TextBox ID="txtAddress1" runat="server" Enabled="True" Text='<%#Bind("[Address 1]") %>'></asp:TextBox></td></tr>
                            <tr><td>Address Line 2:</td><td><asp:TextBox ID="txtAddress2" runat="server" Enabled="True" Text='<%#Bind("[Address 2]") %>'></asp:TextBox></td></tr>
                            <tr><td>City:</td><td><asp:TextBox ID="txtCity" runat="server" Enabled="True" Text='<%#Bind("City") %>'></asp:TextBox></td></tr>
                            <tr><td>Post Code:</td><td><asp:TextBox ID="txtPostCode" runat="server" Enabled="True" Text='<%#Bind("PostCode") %>'></asp:TextBox></td></tr>
                            <tr><td>Status:</td><td><asp:TextBox ID="txtStatus" runat="server" Enabled="True" Text='<%#Bind("Status") %>'></asp:TextBox></td></tr>

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

    <!-- LIST VIEW      glyphicon glyphicon-th-list
         FORM VIEW      glyphicon glyphicon-modal-window
         DELETE         glyphicon glyphicon-trash 
         ADD NEW        glyphicon glyphicon-plus
         EDIT           glyphicon glyphicon-pencil
         SAVE           glyphicon glyphicon-ok-circle
         CANCEL         glyphicon glyphicon-remove-circle
        -->

</asp:Content>