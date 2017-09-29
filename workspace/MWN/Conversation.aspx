<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Conversation.aspx.cs" Inherits="MWN.Conversation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>MWN - My Well-being Network</title>
</head>
<body>
    <!--#include file="Header.html" -->
            <!-- Start Navigation -->
    <form id="Form1" runat="server">
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
                        <li class="current"><a href="Conversation.aspx">Conversation</a></li>
                    </ul>
                </div>
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
                    <h3>Conversation.</h3>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <emptydatatemplate>
                    No Data Found.  
                    </emptydatatemplate>
                    <Columns>
                <asp:BoundField DataField="timeStamp" HeaderText="Time" SortExpression="timeStamp" />
                <asp:BoundField DataField="MessageTo" HeaderText="To" SortExpression="MessageTo" />
                <asp:BoundField DataField="MessageFrom" HeaderText="From" SortExpression="MessageFrom" />
                <asp:BoundField DataField="MessageSubject" HeaderText="Subject" SortExpression="MessageSubject" />
                <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" />
            </Columns>
                </asp:GridView>
                <br />

                </div>
               </div>
        </div>

        <div class="main-container">
        </div>
    </form>
    <!--#include file="Footer.html" -->

</body>
</html>
