<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerifyAccount.aspx.cs" Inherits="MWN.VerifyAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MWN - My Well-being Network</title>
</head>
<body>
    <!--#include file="Header.html" -->

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

    <form id="form1" runat="server">
        <div class="main-container">
            <div class="container1">
                <div id="breadcrumb">
                    <ul>
                        <li class="first">You Are Here</li>
                        <li>&#187;</li>
                        <li><a href="HomePage.aspx">Homepage</a></li>
                        <li>&#187;</li>
                        <li><a href="Login.aspx">Login</a></li>
                        <li>&#187;</li>
                        <li class="current"><a href="VerifyAccount.aspx">Verify Account</a></li>
                    </ul>
                </div>
                <br />
                <br />
                
                <!-- Advertisement Start -->
                <center>
                    <a id="A2" runat="server" onclick="return confirm('MWN will open ad website in a new tab, is that ok?')" onserverclick="ImageAdvertisement_Click">
                        <asp:Image ID="AdvertisementImage1" runat="server" style="border-style:ridge; border-width:10px; width:800px;"></asp:Image>
                    </a>
                </center>
                <br />
                <!-- Advertisement End -->

                <a id="A1" runat="server" onServerClick="Keyboard_click" ><img src="images/keyboard.png" align="right" /></a>  
                <div class="box">
                    <h3>Verify Account.</h3>
                    <asp:Label ID="SuccessRegister" runat="server" Font-Bold="True" ForeColor="#009900"></asp:Label>
                    <b>Enter the given verification code below to verify your account. Or <a href="ResendVerify.aspx">Click Here</a> to resend your verification code.</b>
                    <br />
                    <br />
                    <fieldset style="width: 1000px;">
                        <h4>Username:</h4>
                        <asp:TextBox ID="UserName" placeholder="Enter your username" required="required" MaxLength="45" Columns="30" runat="server"></asp:TextBox>
                        <h4>Verification Code:</h4>
                        <asp:TextBox ID="VerificationCode" placeholder="Enter your verification code" MaxLength="45" required="required" Columns="30" runat="server"></asp:TextBox>

                        <asp:Label ID="VerificationCodeValidateLabel" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#FF3300"></asp:Label>

                        <br />
                        <br />

                        <asp:Button ID="VerifyButton" runat="server" OnClick="VerifyButton_Click" Text="Verify" />

                    </fieldset>
                    <br />
                    <p><a href="Register.aspx">Register</a> if you don't have an account.</p>
                </div>
            </div>
        </div>

        <div class="main-container">
        </div>
    </form>
    <!--#include file="Footer.html" -->
</body>
</html>
