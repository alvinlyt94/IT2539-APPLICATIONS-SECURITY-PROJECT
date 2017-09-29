<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsPage.aspx.cs" Inherits="MWN.NewsPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>MWN - My Well-being Network</title>
    <link rel="stylesheet" type="text/css" href="css/main.css" />
    <script type="text/javascript" src="js/main.js"></script>
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
        <header>
            <asp:LoginView ID="LoginView2" runat="server">
                <LoggedInTemplate>
                    <h2>Welcome, <b><%: User.Identity.Name %></b>!</h2>
                </LoggedInTemplate>
            </asp:LoginView>
        </header>

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
                        <li class="current"><a href="NewsPage.aspx">Health Reader</a></li>
                    </ul>
                </div>
                <br />
                <div id="mySlides">
                    <div id="slide1">
                        <img src="images/news/news00001.jpg" alt="Lazy Exercise" />
                        <span><b class="slideheading">Top 10 Health Tips For Lazy People!</b><br />
                            Are you one of the lazy people there? Check this out!<a href="news00001.aspx" title="Lazy" class="readmore">Read More!</a></span>
                    </div>
                    <div id="slide2">
                        <img src="images/news/news00002.jpg" alt="8 Fruits" />
                        <span><b class="slideheading">The 8 Healthiest Fruits You Should Be Eating!</b><br />
                            Are you eating fruits healthily? Check this out!<a href="news00002.aspx" title="Fruits" class="readmore">Read More!</a></span>
                    </div>
                    <div id="slide3">
                        <img src="images/news/news00003.jpg" alt="Healthy Lifestyle" />
                        <span><b class="slideheading">Simple Ways to Live a Healthy Lifestyle!</b><br />
                            Are you living in a healthy lifestyle? Check this out!<a href="news00003.aspx" title="Lifestyle" class="readmore">Read More!</a></span>
                    </div>
                </div>

                <div id="myController">
                    <span class="jFlowControl"></span>
                    <span class="jFlowControl"></span>
                    <span class="jFlowControl"></span>
                </div>

                <section class="jFlowPrev">
                    <div></div>
                </section>
                <section class="jFlowNext">
                    <div></div>
                </section>
                <a href="AllArticles.aspx" style="font-size:20px;">View all articles!</a>
                <br />

                <!-- Advertisement Start -->
                <center>
                    <a id="A1" runat="server" onclick="return confirm('MWN will open ad website in a new tab, is that ok?')" onserverclick="ImageAdvertisement_Click">
                        <asp:Image ID="AdvertisementImage1" runat="server" style="border-style:ridge; border-width:10px; width:800px;"></asp:Image>
                    </a>
                </center>
                <br />
                <!-- Advertisement End -->

                <article class="box" id="home_featured21">
                    <h2>RSS Health Reader</h2>
                    <div class="example">
                        <div class="post_results" id="post_results1" rss_num="8" rss_url="http://health.yahoo.com/news/rss/fitness/">
                            <div class="loading_rss">
                                <img alt="Loading..." src="images/loading.gif" />
                            </div>
                        </div>
                        <div class="post_results" id="post_results2" rss_num="8" rss_url="http://feeds.bbci.co.uk/news/health/rss.xml?edition=int">
                            <div class="loading_rss">
                                <img alt="Loading..." src="images/loading.gif" />
                            </div>
                        </div>
                        <div style="clear: both;"></div>
                    </div>
                </article>
            </div>
        </div>
        <div class="main-container">
        </div>
    </form>
    <!--#include file="Footer.html" -->

</body>
</html>
