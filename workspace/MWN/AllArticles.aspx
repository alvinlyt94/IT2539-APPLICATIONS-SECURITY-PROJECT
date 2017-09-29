<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllArticles.aspx.cs" Inherits="MWN.AllArticles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>MWN - My Well-being Network</title>
</head>
<body>
    <div id="fb-root"></div>
<script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

    <div id="Div1"></div>
<script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

    <script>!function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (!d.getElementById(id)) {
        js = d.createElement(s); js.id = id;
        js.src = "//platform.twitter.com/widgets.js";
        fjs.parentNode.insertBefore(js, fjs);
    }
}(document, "script", "twitter-wjs");</script>

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
                                        <li><a href="#">Information 1</a>
                                            <ul>
                                                <li><a href="#">Information 1.1</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Information 2</a></li>
                                    </ul>
                                </li>
                                <li><a href="HealthTopics.aspx">Health Topics</a></li>
                                <li><a href="#">Contact</a></li>
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
                                        <li><a href="#">Information 1</a>
                                            <ul>
                                                <li><a href="#">Information 1.1</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="#">Information 2</a></li>
                                    </ul>
                                </li>
                                <li><a href="HealthTopics.aspx">Health Topics</a></li>
                                <li class="last"><a href="#">Contact</a></li>
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
                        <li class="current"><a href="AllArticles.aspx">All Articles by MWN</a></li>
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

                <h1>All Articles by MWN</h1>
                <div class="box">
                    <table border="1" >
<tr>
<td><li><a href="news00001.aspx">Top 10 Health Tips For Lazy People!</a><br />
                            </li></td>

</tr>
<tr>
<td><li><a href="news00002.aspx">The 8 Healthiest Fruits You Should Be Eating!</a><br />
                            </li></td>

</tr>
                        <tr>
<td><li><a href="news00003.aspx">Simple Ways to Live a Healthy Lifestyle!</a><br />
                            </li></td>

</tr>
</table>
                   
        
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

