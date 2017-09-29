<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="news00002.aspx.cs" Inherits="MWN.news00002" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>MWN - My Well-being Network</title>
</head>
<body>
    <!--#include file="Header.html" -->

    <form id="form1" runat="server">
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
                        <li><a href="index.html">Homepage</a></li>
                        <li>&#187;</li>
                        <li><a href="#">Tools</a></li>
                        <li>&#187;</li>
                        <li><a href="NewsPage.aspx">Health Reader</a></li>
                        <li>&#187;</li>
                        <li class="current"><a href="news00002.aspx">The 8 Healthiest Fruits You Should Be Eating!</a></li>
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

                <h1>The 8 Healthiest Fruits You Should Be Eating!</h1>
                <div class="box">
                    <h5>3rd Feb 2013 by Benjamin</h5>

                    <center>
                    <img src="images/news/news00002.jpg" alt="Fruits" style="border-style:ridge; border-width:10px; width:700px; margin-left: 10px">
                        </center>
                    &nbsp;<div style="margin-left: 20px">
                        <h style="font-weight: bold; font-size: larger">Blueberries</h>
                        <p>
                            Blueberries are rich in antioxidants, which help fight cancer and prevent macular degeneration. Like cranberries, they contain compounds that can protect against urinary tract infections.
                        </p>
                    </div>
                    <br />

                    <div style="margin-left: 20px">
                        <h style="font-weight: bold; font-size: larger">Oranges</h>
                        <p>
                            A single orange gives you almost a full day's vitamin C, plus potassium. The opaque membrane around each wedge has hesperidin, which may lower cholesterol. Even the scent is calming, according to research.
                        </p>
                    </div>
                    <br />

                    <div style="margin-left: 20px">
                        <h style="font-weight: bold; font-size: larger">Apples</h>
                        <p>
                            Eat the skin for a high dose of fiber -- both soluble (the type that helps lower cholesterol) and insoluble (it keeps you regular). In addition to meeting 15 percent of your daily fiber needs, an apple is crammed with antioxidants.
                        </p>
                    </div>
                    <br />

                    <div style="margin-left: 20px">
                        <h style="font-weight: bold; font-size: larger">Bananas</h>
                        <p>
                            High in potassium and low in sodium, bananas help lower your risk of high blood pressure and stroke. Bonus: Protease inhibitors that can prevent stomach ulcers.
                        </p>
                    </div>
                    <br />

                    <div style="margin-left: 20px">
                        <h style="font-weight: bold; font-size: larger">Kiwis</h>
                        <p>
                            Ounce for ounce, kiwis contain more than twice as much vitamin C as oranges, plus they may lower the risk of cataracts and could even protect DNA from damage.
                        </p>
                    </div>
                    <br />

                    <div style="margin-left: 20px">
                        <h style="font-weight: bold; font-size: larger">Red & Purple Grapes</h>
                        <p>
                            Red wine isn't the only source of resveratrol, a powerful antioxidant that could help fight heart disease. You get nearly as much resveratrol in a cup of dark-colored grapes as you do in a five-ounce glass of merlot.
                        </p>
                    </div>
                    <br />

                    <div style="margin-left: 20px">
                        <h style="font-weight: bold; font-size: larger">Strawberries</h>
                        <p>
                            A daily handful helps control type 2 diabetes and stave off heart disease and inflammation. Strawberries are also an excellent source of vitamin C and other antioxidants.
                        </p>
                    </div>
                    <br />

                    <div style="margin-left: 20px">
                        <h style="font-weight: bold; font-size: larger">Papayas</h>
                        <p>
                            These contain papain, a substance that helps improve your digestion. Papayas also provide a lot of vitamin C and are a good source of folate.
                        </p>
                    </div>
                    <br />
                    <center>
                <div class="fb-comments" data-href="https://www.facebook.com/MwnMyWellbeingNetwork/posts/360902137350042" data-width="470" data-num-posts="2"></div>
                </div>
                </center>
                <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://yahoo.com">Tweet</a>
                <div class="fb-like" data-href="https://www.facebook.com/MwnMyWellbeingNetwork/posts/360902137350042" data-send="true" data-width="450" data-show-faces="true"></div>

            </div>
                </div>
            </div>
            <br />

            <div class="main-container">
            </div>
    </form>
    <!--#include file="Footer.html" -->

</body>
</html>

