<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="MWN.EditProfile" %>

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
                        <li><a href="ManageProfile.aspx">Manage Profile</a></li>
                        <li>&#187;</li>
                        <li class="current"><a href="EditProfile.aspx">Edit Profile</a></li>
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
                    <h3>Edit Profile.</h3>
                    <b>Please edit your profile below.</b>
                    <br />
                    <br />
                    <h5>Username:
                            <asp:Label ID="UsernameLabel" runat="server" Text="" Font-Bold="True" Font-Size="Medium" ForeColor="Green"></asp:Label>
                    </h5>

                    <h5>Old Password:</h5>
                    <asp:TextBox ID="OldPasswordTextBox" Width="350" TextMode="password" placeholder="Min. 8 Characters, Number/Symbols, Upper & LowerCase" pattern="(?=^.{8,45}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" title="Min. 8 Characters, Num./Symbols, Upper & LowerCase" MaxLength="45" runat="server"></asp:TextBox>
                    <asp:Label ID="OldPasswordValidateLabel" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#FF3300"></asp:Label>

                    <br />
                    *Note: It's optional to change your password.

                    <h5>New Password:</h5>
                    <asp:TextBox ID="NewPasswordTextBox" Width="350" TextMode="password" placeholder="Min. 8 Characters, Number/Symbols, Upper & LowerCase" pattern="(?=^.{8,45}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" title="Min. 8 Characters, Num./Symbols, Upper & LowerCase" MaxLength="45" runat="server"></asp:TextBox>

                    <asp:Label ID="NewPasswordValidateLabel" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#FF3300"></asp:Label>

                    <h5>Confirm New Password:</h5>
                    <asp:TextBox ID="ConfirmNewPasswordTextBox" Width="350" TextMode="password" placeholder="Re-enter your password above" MaxLength="45" runat="server"></asp:TextBox>

                    <h5>First Name:</h5>
                    <asp:TextBox ID="FirstNameTextBox" required="required" Width="350" placeholder="Enter your first name" MaxLength="45" runat="server"></asp:TextBox>

                    <h5>Last Name:</h5>
                    <asp:TextBox ID="LastNameTextBox" required="required" Width="350" placeholder="Enter your last name" MaxLength="45" runat="server"></asp:TextBox>

                    <h5>Email Address:</h5>
                    <asp:TextBox ID="EmailTextBox" TextMode="Email" Width="350" placeholder="youremail@hotmail.com" title="youremail@hotmail.com" required="required" MaxLength="45" runat="server"></asp:TextBox>

                    <asp:Label ID="EmailValidateLabel" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#FF3300"></asp:Label>

                    <p style="font-size:smaller">*Note: Please use your personal email as a verification code will be send to your registered email address.</p>

                    <h5>Phone Number:</h5>
                    <asp:TextBox ID="PhoneNumberTextBox" Width="350" placeholder="Min. 8 Numeric Characters" pattern="[0-9]{8,8}$" title="Min. 8 Numeric Characters" required="required" MaxLength="8" runat="server"></asp:TextBox>

                    <asp:Label ID="PhoneValidateLabel" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#FF3300"></asp:Label>

                    <p style="font-size:smaller">*Note: Please use your personal phone number for the changing of password and retrieving your forgotten email address.</p>

                    <h5>Security Question:</h5>
                    <asp:Label ID="SecurityQnsLabel" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#33CC33"></asp:Label>
                    
                    <br /><br />

                    <h5>Security Answer:</h5>
                    <asp:TextBox ID="SecurityAnsTextField" Width="350" Textmode="Password" placeholder="Enter your security answer" required="required" MaxLength="45" runat="server"></asp:TextBox>

                    <asp:Label ID="SecurityAnsValidateLabel" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#FF3300"></asp:Label>

                    <br />
                    <br />
                    <asp:Button ID="UpdateProfile" runat="server" Text="Update" OnClick="UpdateProfile_Click" />
                

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
                </div>
            </div>
        </div>

        <div class="main-container">
        </div>
    </form>
    <!--#include file="Footer.html" -->
</body>
</html>
