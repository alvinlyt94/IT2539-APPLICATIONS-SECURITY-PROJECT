<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageProfile.aspx.cs" Inherits="MWN.ManageProfile" %>

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
                                        <li><a href="#">Sports</a>
                                            <ul>
                                                <li><a href="Sports_Badminton.aspx">Badminton</a></li>
                                                <li><a href="#">Basketball</a></li>
                                                <li><a href="#">Bowling</a></li>
                                                <li><a href="#">Floorball</a></li>
                                                <li><a href="#">Soccer</a></li>
                                                <li><a href="#">Softball</a></li>
                                                <li><a href="#">Swimming</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Diets</a>
                                            <ul>
                                                <li><a href="#">Breakfast</a></li>
                                                <li><a href="#">Lunch</a></li>
                                                <li><a href="#">Tea Break</a></li>
                                                <li><a href="#">Dinner</a></li>
                                                <li><a href="#">Supper</a></li>
                                                <li><a href="#">Midnight Snacks</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Food Benefits</a>
                                            <ul>
                                                <li><a href="#">Dairy</a></li>
                                                <li><a href="#">Fruits</a></li>
                                                <li><a href="#">Mean and beans</a></li>
                                                <li><a href="#">Oils</a></li>
                                                <li><a href="#">Vegetables</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="HealthTopics.aspx">Health Topics</a></li>
                                <li><a href="FeedbackUs.aspx">Feedback Us</a></li>
                                <li class="last">
                                    <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" LogoutText="Log off" LogoutPageUrl="HomePage.aspx" />
                                </li>
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
                                        <li><a href="Sports.aspx">Sports</a>
                                            <ul>
                                                <li><a href="Sports_Badminton.aspx">Badminton</a></li>
                                                <li><a href="#">Basketball</a></li>
                                                <li><a href="#">Bowling</a></li>
                                                <li><a href="#">Floorball</a></li>
                                                <li><a href="#">Soccer</a></li>
                                                <li><a href="#">Softball</a></li>
                                                <li><a href="#">Swimming</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Diets</a>
                                            <ul>
                                                <li><a href="#">Breakfast</a></li>
                                                <li><a href="#">Lunch</a></li>
                                                <li><a href="#">Tea Break</a></li>
                                                <li><a href="#">Dinner</a></li>
                                                <li><a href="#">Supper</a></li>
                                                <li><a href="#">Midnight Snacks</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Food Benefits</a>
                                            <ul>
                                                <li><a href="#">Dairy</a></li>
                                                <li><a href="#">Fruits</a></li>
                                                <li><a href="#">Mean and beans</a></li>
                                                <li><a href="#">Oils</a></li>
                                                <li><a href="#">Vegetables</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="HealthTopics.aspx">Health Topics</a></li>
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
                        <li class="current"><a href="ManageProfile.aspx">Manage Profile</a></li>
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
                    <h3>Manage Profile.</h3>
                    <b><asp:Label ID="SuccessUpdate" runat="server" Font-Bold="True" ForeColor="#009900"></asp:Label>
                        Below is your personal particulars.</b>
                    <br />
                    <br />
                    <h5>Username:
                            <asp:Label ID="UsernameLabel" runat="server" Text="" Font-Bold="True" Font-Size="Medium" ForeColor="Green"></asp:Label>
                    </h5>

                    <h5>Password:
                            <asp:Label ID="PasswordLabel" runat="server" Text="**********" Font-Bold="True" Font-Size="Medium" ForeColor="Green" ></asp:Label>
                    </h5>*Note: To change your password, please click the "Edit Profile" button.
                    <br /><br />
                    

                    <h5>First Name:
                            <asp:Label ID="FirstNameLabel" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium" ForeColor="Green"></asp:Label>
                    </h5>

                    <h5>Last Name:
                            <asp:Label ID="LastNameLabel" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium" ForeColor="Green"></asp:Label>
                    </h5>

                    <h5>Email Address:
                            <asp:Label ID="EmailLabel" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium" ForeColor="Green"></asp:Label>
                    </h5>

                    <h5>Phone Number:
                            <asp:Label ID="PhoneLabel" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium" ForeColor="Green"></asp:Label>
                    </h5>

                    <h5>Account Type:
                            <asp:Label ID="AccountTypeLabel" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium" ForeColor="Green"></asp:Label>
                    </h5>

                    <h5>
                        <asp:Label ID="AdsOnOffLabel" runat="server" Text="Current State of Advertisements: " Visible="false"></asp:Label>
                        <u>
                            <asp:LinkButton ID="AdsOnOffButton" runat="server" Visible="false" OnClick="AdsOnOffButton_Click" ForeColor="Blue"></asp:LinkButton></u>
                    </h5>

                    <h5>
                        <asp:Label ID="MiloClickLabel" runat="server" Text="No. of clicks for Milo's Advertisement: " Visible="false"></asp:Label>
                        <asp:Label ID="MiloClickCountLabel" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Green"></asp:Label>
                    </h5>

                    <h5>
                        <asp:Label ID="NikeClickLabel" runat="server" Text="No. of clicks for Nike's Advertisement: " Visible="false"></asp:Label>
                        <asp:Label ID="NikeClickCountLabel" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Green"></asp:Label>
                    </h5>

                    <h5>
                        <asp:Label ID="AdidasClickLabel" runat="server" Text="No. of clicks for Adidas's Advertisement: " Visible="false"></asp:Label>
                        <asp:Label ID="AdidasClickCountLabel" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Green"></asp:Label>
                    </h5>

                    <h5>
                        <asp:Label ID="GatoradeClickLabel" runat="server" Text="No. of clicks for Gatorade's Advertisement: " Visible="false"></asp:Label>
                        <asp:Label ID="GatoradeClickCountLabel" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Green"></asp:Label>
                    </h5>

                    <h5>
                        <asp:Label ID="NbClickLabel" runat="server" Text="No. of clicks for NB's Advertisement: " Visible="false"></asp:Label>
                        <asp:Label ID="NbClickCountLabel" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Green"></asp:Label>
                    </h5>

                    <asp:Button ID="EditButton" runat="server" Text="Edit Profile" OnClick="EditButton_Click" />

                </div>
            </div>
        </div>

        <div class="main-container">
        </div>
    </form>
    <!--#include file="Footer.html" -->
</body>
</html>
