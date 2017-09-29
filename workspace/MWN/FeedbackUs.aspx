<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeedbackUs.aspx.cs" Inherits="MWN.FeedbackUs" %>

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
                        <li class="current"><a href="FeedbackUs.aspx">Feedback Us</a></li>
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

                <a id="A1" runat="server" onserverclick="Keyboard_click">
                    <img src="images/keyboard.png" align="right" /></a>
                <div class="box">
                    <h3>Feedback Us!</h3>
                    <b>Please complete the feedback form below to get a chance to be our <u>Premium User</u>!</b>
                    <br />
                    <asp:Label ID="SuccessSent" runat="server" Font-Bold="True" ForeColor="#009900" Text="Thank you for your feedback! Please wait for at least 24 hours for us to vett your feedback to be Premium User!"></asp:Label>
                    <br /><br />

                    <h5>Q1) Do you find our website useful in terms of information provided?</h5>
                    <asp:RadioButtonList ID="Question1" runat="server">
                        <asp:ListItem Value="Very Useful!" Selected="True">Very Useful!</asp:ListItem>
                        <asp:ListItem Value="Useful!">Useful!</asp:ListItem>
                        <asp:ListItem Value="Not Bad!">Not Bad!</asp:ListItem>
                        <asp:ListItem Value="Not Useful!">Not Useful!</asp:ListItem>
                        <asp:ListItem Value="Useless!">Useless!</asp:ListItem>
                    </asp:RadioButtonList>
                    <br />


                    <h5>Q2) Please rate our overall website:</h5>
                    <asp:RadioButtonList ID="Question2" runat="server">
                        <asp:ListItem Value="Very Good!" Selected="True">Very Good!</asp:ListItem>
                        <asp:ListItem Value="Good!">Good!</asp:ListItem>
                        <asp:ListItem Value="Not Bad!">Not Bad!</asp:ListItem>
                        <asp:ListItem Value="Bad!">Bad!</asp:ListItem>
                        <asp:ListItem Value="Very Bad!">Very Bad!</asp:ListItem>
                    </asp:RadioButtonList>
                    <br />

                    <h5>Q3) What other information(s) you would like to see in our website?</h5>
                    <asp:TextBox ID="Question3" runat="server" Height="100px" TextMode="MultiLine" Width="600px"></asp:TextBox>
                    <br /><br />

                    <h5>Q4) What other feature(s) you would like to see in our website?</h5>
                    <asp:TextBox ID="Question4" runat="server" Height="100px" TextMode="MultiLine" Width="600px"></asp:TextBox>
                    <br /><br />

                    <h5>Q5) Would you subscribe to us if we send updates of our website to your emails?</h5>
                    <asp:RadioButtonList ID="Question5" runat="server">
                        <asp:ListItem Value="Yes!" Selected="True">Yes!</asp:ListItem>
                        <asp:ListItem Value="No!">No!</asp:ListItem>
                    </asp:RadioButtonList>
                    <br />

                    <h5>Q6) Please give us any more feedback below:</h5>
                    <asp:TextBox ID="Question6" runat="server" Height="100px" TextMode="MultiLine" Width="600px" MaxLength="255"></asp:TextBox>
                    <br />

                    <asp:Button ID="SendButton" runat="server" onclientclick="return confirm('Confirm to submit feedback?')" onclick="SendButton_Click" Text="Submit Feedback" />
                </div>
            </div>
        </div>

        <div class="main-container">
        </div>
    </form>
    <!--#include file="Footer.html" -->

</body>
</html>
