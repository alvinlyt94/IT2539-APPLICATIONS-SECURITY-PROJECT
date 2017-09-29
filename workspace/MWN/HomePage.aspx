<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="MWN.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
        <header>
            <asp:LoginView ID="LoginView2" runat="server">
                <LoggedInTemplate>
                    <h2>Welcome, <b><%: User.Identity.Name %></b>!</h2>
                </LoggedInTemplate>
            </asp:LoginView>
        </header>

        <div class="main-container">
            <div class="container1">
                <div id="mySlides">
                    <div id="slide1">
                        <img src="Images/slider1.jpg" alt="Slide 1 jFlow Plus" />
                        <span><b class="slideheading">Health Reader</b><br />
                            Read health news here! Both from our website and other sources.<a href="NewsPage.aspx" title="Go to NewsPage" class="readmore">Go to Health Reader!</a></span>
                    </div>
                    <div id="slide2">
                        <img src="Images/slider2.jpg" alt="Slide 2 jFlow Plus" />
                        <span><b class="slideheading">BMI Calculator</b><br />
                            Calculate your BMI here! Are you Obese, Underweight or just right?<a href="BMICalc.aspx" title="Go to BMI Calculator" class="readmore">Go to BMI Calculator!</a></span>
                    </div>
                    <div id="slide3">
                        <img src="Images/slider3.jpg" alt="Slide 3 jFlow Plus" />
                        <span><b class="slideheading">Become a Premium User!</b><br />
                            Become a premium user by takng a feedback survery, and remove ads!<br />
                            <br />
                            *Note: You have to be logged in to feedback us. <a href="FeedbackUs.aspx" title="Become a Premium Member" class="readmore">Take survey!</a></span>
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

                <article class="box" id="home_featured21">
                    <div class="block">
                        <h2>Who We Are?</h2>
                        <p>
                            Our project is called <b>My Well-being Network (MWN).</b> Our project is <b>Website Application</b> that will be develops in <b>C#</b> and <b>ASP.NET Framework.</b> It is a health-related website which consists of sports, diets, and basically information that is related to human physical well-being.
                           <!--<a href="#" class="read_more">Read More</a>-->
                        </p>
                    </div>
                    <div class="block">
                        <h2>Compatibility</h2>
                        <ul id="list">
                            <li>Internet Explorer</li>
                            <li>Mozilla Firefox</li>
                            <li>Google Chrome</li>
                            <li>Safari</li>
                            <li>Opera</li>
                        </ul>
                        <br />
                        <img src="images/browsers.png" alt="Web Browsers" />

                    </div>
                    <div class="block last">
                        <h2>What's Our Aim?</h2>
                        <p>
                            Our project aims to create a <b>health-related website</b> to provide physical well-being information and tools (e.g. BMI calculator, messaging system) related to sports and diet for people who are concerned of their own health and well-being. Also, our project <b>aims to create awareness of information related to health and well-being for people</b> who are unaware of it around the globe!
                            <br />
                            <!--<a href="#" class="read_more">Read More</a>-->
                        </p>
                    </div>
                    <div class="clear"></div>
                </article>

            </div>
        </div>
        <div class="main-container">
        </div>
    </form>
    <!--#include file="Footer.html" -->

</body>
</html>
