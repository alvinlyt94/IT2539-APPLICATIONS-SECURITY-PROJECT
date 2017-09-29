<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sports.aspx.cs" Inherits="MWN.Sports" %>

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
                        <li class="current"><a href="Sports.aspx">Sports</a></li>
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

                <h1>Sports</h1>
                <div class="box">
                    <div class="portfolio">
                        <div class="tagline_left">
                            <h3>Badminton</h3>
                            <p><b>Badminton</b> is a racquet sport played by either two opposing players (singles) or two opposing pairs (doubles), who take positions on opposite halves of a rectangular court that is divided by a net. Players score points by striking a shuttlecock with their racquet so that it passes over the net and lands in their opponents' half of the court. Each side may only strike the shuttlecock once before it passes over the net. A rally ends once the shuttlecock has struck the floor, or if a fault has been called by either the umpire or service judge or, in their absence, the offending player, at any time during the rally.</p>
                            <br /><p class="readmore"><a href="Sports_Badminton.aspx">View More Information &raquo;</a></p>
                        </div>
                        <div class="tagline_right">
                            <a href="images/badminton.jpg" data-gal="prettyPhoto" title="Image shown above is the top-view of a shuttlecock.">
                                <img src="images/badminton.jpg" alt="" /></a>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <!-- ############################# -->
                    <div class="portfolio">
                        <div class="tagline_left">
                            <h3>Basketball</h3>
                            <p><b>Basketball</b> is a team sport, the objective being to shoot a ball through a basket horizontally positioned to score points while following a set of rules. Usually, two teams of five players play on a marked rectangular court with a basket at each width end. Basketball is one of the world's most popular and widely viewed sports.</p>
                            <br /><p class="readmore"><a href="#">View More Information &raquo;</a></p>
                        </div>
                        <div class="tagline_right">
                            <a href="images/basketball.jpg" data-gal="prettyPhoto" title="Image shown above is a basketball passing through the basket net.">
                                <img src="images/basketball.jpg" alt="" /></a>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <!-- ############################# -->
                    <div class="portfolio">
                        <div class="tagline_left">
                            <h3>Bowling</h3>
                            <p><b>Bowling</b> refers to a series of sports or leisure activities in which a player rolls or throws a bowling ball. In indoor bowls, the target is usually to knock over pins. In outdoor variations, the aim is usually to get the ball as close to a target ball as possible. The indoor version of bowling is often played on a flat wooden or other synthetic surface, while outdoor bowling the surface may be grass, gravel or a synthetic surface. The most common types of indoor bowling include ten-pin, nine-pin, candlepin, duckpin and five-pin bowling, while in outdoor bowling, bowls, pétanque and boules are popular.</p>
                                <br /><p class="readmore"><a href="#">View More Information &raquo;</a></p>
                        </div>
                        <div class="tagline_right">
                            <a href="images/bowling.jpg" data-gal="prettyPhoto" title="Image shown above is a ball rolling over the platform going to hit on the bowling pins.">
                                <img src="images/bowling.jpg" alt="" /></a>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <!-- ############################# -->
                    <div class="portfolio">
                        <div class="tagline_left">
                            <h3>Floorball</h3>
                            <p><b>Floorball</b>, a type of floor hockey, is an indoor team sport which was developed in the 1970s in Sweden. Floorball is most popular in areas where the sport has developed the longest, such as the Czech Republic, Denmark, Estonia, Finland, Latvia, Norway, Sweden and Switzerland. The game is played indoors on a wooden or rubber mat floor or just a basketball court, making it a year-round sport at amateur and professional levels. There are professional leagues, such as Finland's Salibandyliiga and Sweden's Svenska Superligan.</p>
                            <br />
                            <p>While there are 55 members of the International Floorball Federation (IFF), the Czech Republic, Finland, Sweden and Switzerland have finished in most of the coveted 1st, 2nd and 3rd places at the World Floorball Championships.</p>
                            <br />
                            <p>In addition to those four countries, floorball is gaining popularity in countries such as Latvia, Australia, Canada, Germany, Japan, Singapore, Malaysia and the United States.</p>
                                <br /><p class="readmore"><a href="#">View More Information &raquo;</a></p>
                        </div>
                        <div class="tagline_right">
                            <a href="images/floorball.jpg" data-gal="prettyPhoto" title="Image shown above is a basketball passing through the basket net.">
                                <img src="images/floorball.jpg" alt="" /></a>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <!-- ############################# -->
                    <div class="portfolio">
                        <div class="tagline_left">
                            <h3>Soccer</h3>
                            <p><b>Soccer</b> is a sport played between two teams of eleven players with a spherical ball. At the turn of the 21st century, the game was played by over 250 million players in over 200 countries, making it the world's most popular sport. The game is played on a rectangular field of grass or green artificial turf, with a goal in the middle of each of the short ends. The object of the game is to score by kicking the ball into the opposing goal.</p>
                            <br />
                            <p>The game is played at all levels, from unrefereed teams of a few (not necessarily as many as eleven) children without spectators in a field of any size, with pairs of coats as goalposts and not strictly conforming to the rules, to strictly-regulated games between teams of highly-competent professional players before enthusiastic crowds of 100,000 or more in a purpose-built stadium.</p>
                                <br /><p class="readmore"><a href="#">View More Information &raquo;</a></p>
                        </div>
                        <div class="tagline_right">
                            <a href="images/soccer.jpg" data-gal="prettyPhoto" title="Image shown above is a man trying to kick the soccer ball with his right foot.">
                                <img src="images/soccer.jpg" alt="" /></a>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <!-- ############################# -->
                    <div class="portfolio">
                        <div class="tagline_left">
                            <h3>Softball</h3>
                            <p><b>Softball</b> is a variant of baseball played with a larger ball on a smaller field. Invented in 1888 in Chicago as an indoor game, it was at various times called indoor baseball, mush ball, playground, softbund ball, kitten ball, and, because it was also played by women, ladies' baseball. The name softball was given to the game in 1926. A tournament (1933) at the Chicago World's Fair spurred interest in the game. The Amateur Softball Association of America (founded 1933) governs the game in the United States and sponsors annual sectional and World Series championships. </p>
                                <br /><p class="readmore"><a href="#">View More Information &raquo;</a></p>
                        </div>
                        <div class="tagline_right">
                            <a href="images/softball.jpg" data-gal="prettyPhoto" title="Image shown above is a woman trying to catch the ball with her glove on her left hand.">
                                <img src="images/softball.jpg" alt="" /></a>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <!-- ############################# -->
                    <div class="portfolio">
                        <div class="tagline_left">
                            <h3>Swimming</h3>
                            <p><b>Swimming</b> is a water based sport governed by the Fédération Internationale de Natation (FINA). It is the self propulsion of a person through water or other liquid, for survival, recreation, sport, exercise or other reason. Locomotion is achieved through co-ordinated movement of the limbs, the body, or both. Humans are able to hold their breath underwater and undertake rudimentary locomotive swimming within weeks of birth, as an evolutionary response.</p>
                            <br />
                            <p>Swimming is consistently found to be amongst the top recreational activities undertaken by the public, and in some countries, swimming lessons are a compulsory part of the educational curriculum. As a formalised sport, swimming features in a range of local, national and international competitions, including featuring in every modern summer Olympics.</p>
                                <br /><p class="readmore"><a href="#">View More Information &raquo;</a></p>
                        </div>
                        <div class="tagline_right">
                            <a href="images/swimming.jpg" data-gal="prettyPhoto" title="Image shown above is a man swimming, wearing a swim cap and a goggle.">
                                <img src="images/swimming.jpg" alt="" /></a>
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

