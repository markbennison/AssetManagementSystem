<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AssetManagementSystem._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Locatum</h1>
        <p class="lead">Manage your estate's assets, store details of contractors and suppliers, and track equipment service-history.</p>
        <p><a href="http://www.markbennison.com" class="btn btn-primary btn-large">Learn more &raquo;</a></p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Equipment</h2>
            <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi efficitur laoreet ligula, eget facilisis mauris. Ut consectetur at nibh ut dapibus. Sed id orci et est dapibus pharetra. Curabitur ac enim vestibulum, dignissim erat sed, bibendum leo. Suspendisse dictum massa mauris, a commodo neque scelerisque vitae.
            </p>
            <p>
                <a class="btn btn-default" href="Restricted/EquipmentList">View Equipment &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Contractors</h2>
            <p>
                Suspendisse id fermentum nunc. Donec tincidunt malesuada odio, id bibendum ipsum bibendum at. Proin fermentum mi blandit felis bibendum fermentum at ut libero. Proin eleifend, orci et tempus consequat, mauris dui porta nisi, nec condimentum nunc tortor at lorem.
            </p>
            <p>
                <a class="btn btn-default" href="Restricted/ContractorsList"">View Contractors &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Reports</h2>
            <p>
                Vivamus ornare nisl ac est finibus faucibus. Morbi tempor ultricies lacus eu placerat. Fusce vel nisl suscipit, sollicitudin urna sit amet, tempus ante. Phasellus ac tristique nisl, in blandit odio. Aliquam vel felis a eros tristique ornare.
            </p>
            <p>
                <a class="btn btn-default" href="Admin/ManageUserList"">View Reports &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>