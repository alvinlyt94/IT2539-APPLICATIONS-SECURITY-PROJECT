<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReceiveMessage.aspx.cs" Inherits="MWN.ReceiveMessage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>MWN - My Well-being Network</title>
</head>
<body>
    <!--#include file="Header.html" -->
    <form id="form2" runat="server">
                <!-- Start Navigation -->
        <asp:LoginView ID="LoginView1" runat="server">
            <LoggedInTemplate>
                <div class="main-container">
                    <div id="nav-container">
                        <nav>
                            <ul class="nav">
                                <li><a href="HomePage.aspx">Homepage</a></li>
                                <li><a href="ManageProfile.aspx">Manage Profile</a></li>
                                <li><a href="#">Tools</a>
                                    <ul>
                                        <li><a href="BMICalc.aspx">BMI Calculator</a></li>
                                        <li><a href="NewsPage.aspx">Health Reader</a></li>
                                        <li><a href="SendMessage.aspx">Compose Message</a></li>
                                        <li><a href="ReceiveMessage.aspx">Inbox</a></li>
                                        <li><a href="Conversation.aspx">Conversation</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Information</a>
                                    <ul>
                                        <li><a href="#">Information 1</a>
                                            <ul>
                                                <li><a href="#">Information 1.1</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Information 2</a></li>
                                    </ul>
                                </li>
                                <li><a href="HealthTopics.aspx">Health Topics</a></li>
                                <li><a href="#">Contact</a></li>
                                <li class="last"><asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" LogoutText="Log off" LogoutPageUrl="HomePage.aspx" /></li> 
                            </ul>
                        </nav>
                        <div class="clear"></div>
                    </div>
                </div>
            </LoggedInTemplate>
            <AnonymousTemplate>
                <div class="main-container">
                    <div id="nav-container">
                        <nav>
                            <ul class="nav">
                                <li><a href="HomePage.aspx">Homepage</a></li>
                                <li><a href="Login.aspx">Log In</a></li>
                                <li><a href="Register.aspx">Register</a></li>
                                <li><a href="#">Tools</a>
                                    <ul>
                                        <li><a href="BMICalc.aspx">BMI Calculator</a></li>
                                        <li><a href="NewsPage.aspx">Health Reader</a></li>
                                    </ul>
                                </li>
                                <li><a href="#">Information</a>
                                    <ul>
                                        <li><a href="#">Information 1</a>
                                            <ul>
                                                <li><a href="#">Information 1.1</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Information 2</a></li>
                                    </ul>
                                </li>
                                <li><a href="HealthTopics.aspx">Health Topics</a></li>
                                <li class="last"><a href="#">Contact</a></li>
                            </ul>
                        </nav>
                        <div class="clear"></div>
                    </div>
                </div>
            </AnonymousTemplate>
        </asp:LoginView>
        <!-- End Navigation -->

        <div class="main-container">
            <div class="container1">
                <div id="breadcrumb">
                    <ul>
                        <li class="first">You Are Here</li>
                        <li>&#187;</li>
                        <li><a href="HomePage.aspx">Homepage</a></li>
                        <li>&#187;</li>
                        <li class="current"><a href="ReceiveMessage.aspx">Inbox</a></li>
                    </ul>
                </div>
                <br />
                <br />
                
                <!-- Advertisement Start -->
                <center>
                    <a id="A1" runat="server" onclick="return confirm('MWN will open ad website in a new tab, is that ok?')" onserverclick="ImageAdvertisement_Click">
                        <asp:Image ID="AdvertisementImage1" runat="server" style="border-style:ridge; border-width:10px; width:800px;"></asp:Image>
                    </a>
                </center>
                <br />
                <!-- Advertisement End -->

                <div class="box">
                    <h3>Inbox.</h3>
                    <asp:Label ID="NoMail" runat="server" Text="Sorry, currently you do not have any mail."></asp:Label>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnRowDeleting="OnRowDeleting"  OnRowDataBound ="OnRowDataBound" datakeynames="mailID" OnPageIndexChanging="GridView1_PageIndexChanging" emptydatatext="No data available.">
            
            <Columns>
                <asp:BoundField DataField="mailID" HeaderText="ID" SortExpression="mailID" Visible="False" />
                <asp:BoundField DataField="MessageFrom" HeaderText="From" SortExpression="MessageFrom" />
                <asp:BoundField DataField="MessageSubject" HeaderText="Subject" SortExpression="MessageSubject" />
                <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" />
                <asp:CommandField HeaderText="Delete Message" ShowDeleteButton="True" ButtonType="Button" />
            </Columns>
        </asp:GridView>
                </div>
            </div>
        </div>

        <div class="main-container">
        </div>
    </form>
    <!--#include file="Footer.html" -->

</body>
</html>

