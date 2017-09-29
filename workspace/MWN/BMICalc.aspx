<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BMICalc.aspx.cs" Inherits="MWN.BMICalc" %>

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
                        <li><a href="#">Tools</a></li>
                        <li>&#187;</li>
                        <li class="current"><a href="BMICalc.aspx">BMI Calculator</a></li>
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
                    <h3>BMI Calculator.</h3>
                    <center>
                    Weight: <asp:TextBox ID="wgTextBox" pattern="\d+(\.\d*)?" title="Only Numeric Characters" required="required" MaxLength="5" runat="server" Width="70px"></asp:TextBox> Kg
                    <br /><asp:Label ID="ValidateWeight" runat="server" Font-Bold="True" ForeColor="Red" Text="Label"></asp:Label>
                    <br />
                    Height: <asp:TextBox ID="htTextBox" pattern="\d+(\.\d*)?" title="Only Numeric Characters" required="required" MaxLength="5" runat="server" Width="70px"></asp:TextBox> cm
                    <br /><asp:Label ID="ValidateHeight" runat="server" Font-Bold="True" ForeColor="Red" Text="Label"></asp:Label>
                    <br />

                    <asp:Button ID="CalculateButton" runat="server" Text="Calculate" OnClick="CalculateButton_Click" />
                    <asp:Button ID="ClearButton" runat="server" OnClick="ClearButton_Click" Text="Clear" />
                        <br /><br />
                        BMI:
                    <asp:TextBox ID="TextBox" ReadOnly="true" runat="server" Width="80px"></asp:TextBox>
                        <br />
                        <b><asp:Label ID="desc" runat="server" Text=""></asp:Label><asp:Label ID="OptimalWeight" runat="server" Visible="False"></asp:Label></b>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnRowDeleting="OnRowDeleting"  OnRowDataBound ="OnRowDataBound" datakeynames="bmiID" OnPageIndexChanging="GridView1_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="bmiID" HeaderText="BMIID" SortExpression="bmiID" Visible="False"/>
                            <asp:BoundField DataField="bmi" HeaderText="BMI" SortExpression="bmi" />
                            <asp:BoundField DataField="height" HeaderText="Height" SortExpression="height" />
                            <asp:BoundField DataField="weight" HeaderText="Weight" SortExpression="weight" />
                            <asp:BoundField DataField="optimalWeight" HeaderText="OptimalWeight" SortExpression="optimalWeight" />
                            <asp:BoundField DataField="healthStatus" HeaderText="Status" SortExpression="healthStatus" />
                            <asp:BoundField DataField="timeStamp" HeaderText="Time" SortExpression="timeStamp" />
                            <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ButtonType="Button" />
                        </Columns>
                    </asp:GridView>
                        </center>
                </div>
            </div>
        </div>

        <div class="main-container">
        </div>
    </form>
    <!--#include file="Footer.html" -->

</body>
</html>
