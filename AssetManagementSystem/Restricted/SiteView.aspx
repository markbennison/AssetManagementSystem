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
            OnItemUpdating="FvSiteView_ItemUpdating">

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

            </InsertItemTemplate>

            <EmptyDataTemplate>
                <h3>(No record found.)</h3>
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