<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HealthTopics.aspx.cs" Inherits="MWN.HealthTopics" %>

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
                        <li class="current"><a href="HealthTopics.aspx">Health Topics</a></li>
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

                <h1>Health Topics</h1>
                <div id="gallery" class="box">
                    <ul>
                        <!-- Row 1 Start -->
                        <h5>Cancer &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Chronic Diseases &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Food for Health
                        </h5>
                        <li><a data-gal="prettyPhoto[gallery2]" href="images/Health Topics/HealthTopics_Cancer.jpg" title="Cancer, known medically as a malignant neoplasm, is a broad group of various diseases, all involving unregulated cell growth. In cancer, cells divide and grow uncontrollably, forming malignant tumors, and invade nearby parts of the body.">
                            <img src="images/Health Topics/HealthTopics_Cancer.jpg" width="260" height="190" alt="" /></a></li>
                        <li><a data-gal="prettyPhoto[gallery2]" href="images/Health Topics/HealthTopics_ChronicDiseases.jpg" title="A chronic condition is a human health condition or disease that is persistent or otherwise long-lasting in its effects. The term chronic is usually applied when the course of the disease lasts for more than three months. Common chronic diseases include arthritis, asthma, cancer, COPD, diabetes and HIV/AIDS.">
                            <img src="images/Health Topics/HealthTopics_ChronicDiseases.jpg" width="260" height="190" alt="" /></a></li>
                        <li class="last"><a data-gal="prettyPhoto[gallery2]" href="images/Health Topics/HealthTopics_FoodForHealth.jpg" title="Education about food choices, safety, sources, and the role food plays in good health.">
                            <img src="images/Health Topics/HealthTopics_FoodForHealth.jpg" width="260" height="190" alt="" /></a></li>

                        <!-- Row 2 Start -->
                        <h5>Eye Care &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Sexual Health &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Health Ageing
                        </h5>
                        <li><a data-gal="prettyPhoto[gallery2]" href="images/Health Topics/HealthTopics_EyeCare.jpg" title="Image 1">
                            <img src="images/Health Topics/HealthTopics_EyeCare.jpg" width="260" height="190" alt="" /></a></li>
                        <li><a data-gal="prettyPhoto[gallery2]" href="images/Health Topics/HealthTopics_SexualHealth.jpg" title="Image 2">
                            <img src="images/Health Topics/HealthTopics_SexualHealth.jpg" width="260" height="190" alt="" /></a></li>
                        <li class="last"><a data-gal="prettyPhoto[gallery2]" href="images/Health Topics/HealthTopics_HealthAgeing.jpg" title="Image 3">
                            <img src="images/Health Topics/HealthTopics_HealthAgeing.jpg" width="260" height="190" alt="" /></a></li>

                        <!-- Row 3 Start -->
                        <h5>Oral Health &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Weight Managment &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        Smoke Free Living
                        </h5>
                        <li><a data-gal="prettyPhoto[gallery2]" href="images/Health Topics/HealthTopics_OralHealth.jpg" title="Image 1">
                            <img src="images/Health Topics/HealthTopics_OralHealth.jpg" width="260" height="190" alt="" /></a></li>
                        <li><a data-gal="prettyPhoto[gallery2]" href="images/Health Topics/HealthTopics_WeightManagement.jpg" title="Image 2">
                            <img src="images/Health Topics/HealthTopics_WeightManagement.jpg" width="260" height="190" alt="" /></a></li>
                        <li class="last"><a data-gal="prettyPhoto[gallery2]" href="images/Health Topics/HealthTopics_SmokeFreeLiving.jpg" title="Image 3">
                            <img src="images/Health Topics/HealthTopics_SmokeFreeLiving.jpg" width="260" height="190" alt="" /></a></li>
                    </ul>
                    <br class="clear" />
                </div>

                <br />

                <div class="clear"></div>
            </div>


        </div>

        <div class="main-container">
        </div>
    </form>
    <!--#include file="Footer.html" -->

</body>
</html>

