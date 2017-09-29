<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MWN.Register" %>

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
                        <li class="current"><a href="Register.aspx">Register</a></li>
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
                    <h3>Register.</h3>
                    <b>Use the form below to create a new account.</b>
                    <br />
                    <br />
                    <h4>Username:</h4>
                    <asp:TextBox ID="UsernameTextBox" Width="350" placeholder="Min. 4 Alpha-Numeric Characters" pattern="[a-zA-Z0-9]{4,45}$" title="Min. 4 Alpha-Numeric Characters" required="required" MaxLength="45" runat="server"></asp:TextBox>

                    <asp:Label ID="UsernameValidateLabel" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#FF3300"></asp:Label>

                    <h4>Password:</h4>
                    <asp:TextBox ID="PasswordTextBox" Width="350" TextMode="password" placeholder="Min. 8 Characters, Number/Symbols, Upper & LowerCase" pattern="(?=^.{8,45}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" title="Min. 8 Characters, Num./Symbols, Upper & LowerCase" required="required" MaxLength="45" Columns="51" runat="server"></asp:TextBox>

                    <asp:Label ID="PasswordValidateLabel" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#FF3300"></asp:Label>

                    <h4>Confirm Password:</h4>
                    <asp:TextBox ID="ConfirmPasswordTextBox" Width="350" TextMode="password" placeholder="Re-enter your password above" required="required" MaxLength="45" Columns="51" runat="server"></asp:TextBox>

                    <h4>Email Address:</h4>
                    <asp:TextBox ID="EmailTextBox" Width="350" TextMode="Email" placeholder="youremail@hotmail.com" title="youremail@hotmail.com" required="required" MaxLength="45" Columns="51" runat="server"></asp:TextBox>

                    <asp:Label ID="EmailValidateLabel" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#FF3300"></asp:Label>

                    <p style="font-size:smaller">*Note: Please use your personal email as a verification code will be send to your registered email address.</p>

                    <h4>Phone Number:</h4>
                    <asp:TextBox ID="PhoneNumberTextBox" Width="350" placeholder="Min. 8 Numeric Characters" pattern="[0-9]{8,8}$" title="Min. 8 Numeric Characters" required="required" MaxLength="8" Columns="51" runat="server"></asp:TextBox>

                    <asp:Label ID="PhoneValidateLabel" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#FF3300"></asp:Label>

                    <p style="font-size:smaller">*Note: Please use your personal phone number for the changing of password and retrieving your forgotten email address.</p>

                    <h4>First Name:</h4>
                    <asp:TextBox ID="FirstNameTextBox" Width="350" placeholder="Enter your first name" required="required" MaxLength="45" Columns="51" runat="server"></asp:TextBox>

                    <h4>Last Name:</h4>
                    <asp:TextBox ID="LastNameTextBox" Width="350" placeholder="Enter your last name" required="required" MaxLength="45" Columns="51" runat="server"></asp:TextBox>

                    <h4>Security Question:</h4>
                    <asp:TextBox ID="SecurityQnsTextBox" Width="350" placeholder="Enter your own customize security question" required="required" MaxLength="45" Columns="51" runat="server"></asp:TextBox>

                    <p style="font-size:smaller">*Note: You will be able to customize your own security question. Don't worry! You don't have to remember it. We will retrieve back the question for you.</p>

                    <h4>Security Answer:</h4>
                    <asp:TextBox ID="SecurityAnsTextBox" Width="350" Textmode="Password" placeholder="Enter your security answer" required="required" MaxLength="45" Columns="51" runat="server"></asp:TextBox>

                    <p style="font-size:smaller">*Note: Please remember your security answer as you will require it to retrieve ur personal information.</p>

                    <!-- Captcha start -->
                    <h4>Captcha:</h4>
                    <asp:Image ID="Image1" runat="server" Style="border: 2px solid #666;" Width="350" ImageUrl="~/CImage.aspx" />
                    <br />
                    <asp:TextBox ID="txtimgcode" Width="350" placeholder="Enter captcha from the image above" required="required" Columns="51" runat="server"></asp:TextBox>

                    <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#FF3300"></asp:Label>
                    <!-- Captcha end -->

                    <br />
                    <br />

                    <asp:Button ID="RegisterButton" runat="server" OnClick="RegisterButton_Click" Text="Register" />
                    <asp:Button ID="ResetButton" runat="server" OnClientClick="document.location.href=document.location.href;" Text="Reset" />
                </div>
            </div>
        </div>

        <div class="main-container">
        </div>
    </form>
    <!--#include file="Footer.html" -->
</body>
</html>
