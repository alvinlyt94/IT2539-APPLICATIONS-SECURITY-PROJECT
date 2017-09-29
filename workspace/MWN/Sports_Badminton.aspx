<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sports_Badminton.aspx.cs" Inherits="MWN.Sports_Badminton" %>

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
                        <li><a href="#">Information</a></li>
                        <li>&#187;</li>
                        <li><a href="Sports.aspx">Sports</a></li>
                        <li>&#187;</li>
                        <li class="current"><a href="Sports_Badminton.aspx">Sports: Badminton</a></li>
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

                <h1>Sports: Badminton</h1>
                <div class="box">
                    <div class="portfolio">
                        <div class="tagline_left">
                            <h3>What is a Badminton?</h3>
                            <p><b>Badminton</b> is a racquet sport played by either two opposing players (singles) or two opposing pairs (doubles), who take positions on opposite halves of a rectangular court that is divided by a net. Players score points by striking a shuttlecock with their racquet so that it passes over the net and lands in their opponents' half of the court. Each side may only strike the shuttlecock once before it passes over the net. A rally ends once the shuttlecock has struck the floor, or if a fault has been called by either the umpire or service judge or, in their absence, the offending player, at any time during the rally.</p>
                        </div>
                        <div class="tagline_right">
                            <a href="images/sports_badminton.jpg" data-gal="prettyPhoto" title="Image shown above is a shuttle cock landing on the racquet.">
                                <img src="images/sports_badminton.jpg" alt="" /></a>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <!-- ############################# -->
                    <div class="portfolio">
                        <div class="tagline_left">
                            <h3>Equipments</h3>
                            <b>Racquets</b>
                            <p>Badminton <b>racquets</b> are lightweight, with top quality racquets weighing between 70 and 95 grams (2.4 to 3.3 ounces) not including grip or strings. They are composed of many different materials ranging from carbon fibre composite (graphite reinforced plastic) to solid steel, which may be augmented by a variety of materials. Carbon fibre has an excellent strength to weight ratio, is stiff, and gives excellent kinetic energy transfer. Before the adoption of carbon fibre composite, racquets were made of light metals such as aluminium. Earlier still, racquets were made of wood. Cheap racquets are still often made of metals such as steel, but wooden racquets are no longer manufactured for the ordinary market, because of their excessive mass and cost.</p>
                            <br />
                            <br />
                            <b>Shuttlecock</b>
                            <p>A <b>shuttlecock</b> (often abbreviated to shuttle; also called a birdie) is a high-drag projectile, with an open conical shape: the cone is formed from sixteen overlapping feathers embedded into a rounded cork base. The cork is covered with thin leather or synthetic material.</p>
                            <br />
                            <p>Synthetic shuttles are often used by recreational players to reduce their costs as feathered shuttles break easily. These nylon shuttles may be constructed with either natural cork or synthetic foam base, and a plastic skirt.</p>
                        </div>
                        <div class="tagline_right">
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <a href="images/sports_badminton_racquets.jpg" data-gal="prettyPhoto" title="Image shown above are the badminton racquets.">
                                <img src="images/sports_badminton_racquets.jpg" alt="" /></a>
                            <br />
                            <a href="images/sports_badminton_shuttlecock.jpg" data-gal="prettyPhoto" title="Image shown above is a shuttlecock.">
                                <img src="images/sports_badminton_shuttlecock.jpg" alt="" /></a>
                        </div>
                        <div class="clear"></div>
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

