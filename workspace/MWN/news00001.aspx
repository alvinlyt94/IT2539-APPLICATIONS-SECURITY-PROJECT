<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="news00001.aspx.cs" Inherits="MWN.news00001" %>

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
                        <li class="current"><a href="news00001.aspx">Top 10 Health Tips For Lazy People!</a></li>
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

                <h1>Top 10 Health Tips For Lazy People!</h1>
                <div class="box">
                    <h5>1st Feb 2013 by Benjamin</h5>
                    <center>
        <img src="images/news/news00001.jpg" alt="Lazy exercise" style="border-style:ridge; border-width:10px; width:700px; margin-left: 10px">
                        </center>

                    <div style="margin-left: 20px">
                        <br />
                        <h style="font-weight: bold; font-size: larger">Lazy health tip 1: Build exercise into your routine</h>
                        <p>
                            We all know that eating fresh, homemade produce is good for us, yet many of us are far too tired to be whipping up a culinary masterpiece after a hard day’s work.  However, rather than falling into the trap of relying on shop bought ready meals which may be lacking in nutritional value, try making your own healthy versions instead. By cooking up healthy meals in large batches at the weekend, you can be sure to have plenty of healthy choices in your freezer for those days when you’re too lazy to cook.
                        </p>
                    </div>
                    <br />

                    <div style="margin-left: 20px">
                        <h style="font-weight: bold; font-size: larger">Lazy health tip 2: Make your own ready meals</h>
                        <p>
                            Many of us think we need to spend hours working up a sweat at the gym to stay fit. However, while intense workouts are beneficial, they can also be extremely off-putting and are not strictly necessary. Research shows that regular daily activity could be more effective than sporadic workouts, so rather than allotting a specific “exercise time” a day, try peppering your day with gentle bits of activity such as taking the stairs instead of the lift, doing the housework, or walking to the shops at lunch.
                        </p>
                    </div>
                    <br />

                    <div style="margin-left: 20px">
                        <h style="font-weight: bold; font-size: larger">Lazy health tip 3: Get a pet to improve your health</h>
                        <p>
                            If you want big health results without making a big effort, getting a pet could be the way to go. Multiple research studies have shown that pet owners have improved physical and mental health, including lowered blood pressure, better ability to cope with adverse life effects, and lowered stress levels. For those who need encouragement to up their fitness levels, getting a pet dog may also provide you with that push you need to get out and get active.
                        </p>
                    </div>
                    <br />

                    <div style="margin-left: 20px">
                        <h style="font-weight: bold; font-size: larger">Lazy health tip 4: Exercise while watching TV</h>
                        <p>
                            Vegging out in front of the TV can be the quickest way to pile on the pounds. However, couch potatoes needn’t despair; there are plenty of ways to keep healthy and active in front of the screen. To boost your fitness while watching TV, try squeezing a mini-workout into each commercial break. From situps to skipping or a quick run up and down stairs, there are plenty of ways to introduce activity into your TV-watching schedule. The golden rule is simply to keep moving, with research suggesting that even fidgeting while sitting can burn up to 350 extra calories a day.
                        </p>
                    </div>
                    <br />

                    <div style="margin-left: 20px">
                        <h style="font-weight: bold; font-size: larger">Lazy health tip 5: Do a crossword puzzle</h>
                        <p>
                            If you really can’t find the energy to put yourself through a workout, take the opportunity instead to work on another area of your body – your brain. Boosting your mental health is just as important as improving your physical wellbeing, and luckily this can be done from the comfort of your couch. Research has found that frequent participation in mentally stimulating activities can reduce your risk of Alzheimer’s disease, so rather than switching on the TV when you get in from work, give your brain a challenge and reach for a crossword, Sudoku puzzle or book instead.
                        </p>
                    </div>
                    <br />

                    <div style="margin-left: 20px">
                        <h style="font-weight: bold; font-size: larger">Lazy health tip 6: Have leisurely meals</h>
                        <p>
                            If there’s one instance where being lazy is an advantage, it’s when eating your meals. Taking long, leisurely meals – as opposed to eating on the run or multi-tasking – is a great way to look after your digestive system and also help you lose weight. By eating more slowly and focusing on your food, you will enjoy and savour it more and cut the risk of overeating. Also, as it takes 20 minutes for your body to register the feeling of being full, by eating more slowly you will feel full after less.
                        </p>
                    </div>
                    <br />

                    <div style="margin-left: 20px">
                        <h style="font-weight: bold; font-size: larger">Lazy health tip 7: Order a fruit and veg box</h>
                        <p>
                            If compiling your own healthy shopping lists feels too much like hard work, save time and energy by letting someone else do the work. Many farms and health food stores now deliver seasonal fruit and veg to local areas on a weekly basis, making it easy to try varied healthy produce without stepping foot out your door. Alternatively, for those who want more and have pennies to spare, several companies now offer the option of having prepared healthy meals delivered direct to your home.
                        </p>
                    </div>
                    <br />

                    <div style="margin-left: 20px">
                        <h style="font-weight: bold; font-size: larger">Lazy health tip 8: Hit the dance floor</h>
                        <p>
                            While the idea of a workout fills many with dread, there are plenty of ways to stay fit without it feeling like hard work. If you struggle to get motivated for an organised exercise session, try turning a night out into a workout instead. Hitting the floor for a dance is a great way to get fit, burn calories and tone and strengthen the body. More importantly, unlike with the gym, it provides a fun workout that won’t feel like exercise.
                        </p>
                    </div>
                    <br />

                    <div style="margin-left: 20px">
                        <h style="font-weight: bold; font-size: larger">Lazy health tip 9: Supplement your diet</h>
                        <p>
                            Keep falling off the healthy eating wagon? Try complementing your diet with a good quality nutritional supplement or “superfood”. While it’s no substitute for a healthy eating regime, on those days when your good intentions slip by the wayside a good supplement should help tide you over. Try a multi-vitamin complex or a natural “superfood” – such as spirulina, wheatgrass or bee pollen – which is packed with nutrients to help keep your health on track.
                        </p>
                    </div>
                    <br />

                    <div style="margin-left: 20px">
                        <h style="font-weight: bold; font-size: larger">Lazy health tip 10: Get lots of sleep</h>
                        <p>
                            While laziness is generally considered to be detrimental to your health, when it comes to sleeping it can actually pay off. Research has found that sleep can help you live longer, boost your memory and reduce stress, while getting less than five hours a night can lead to accidents, weight gain, and increased risk of heart disease. While it’s possible to have too much of a good thing, getting a regular eight hour’s sleep is a cheap and simple way to boost your health.
                        </p>
                    </div>
                    <br />
                    <center>
                <div class="fb-comments" data-href="https://www.facebook.com/MwnMyWellbeingNetwork/posts/360901904016732" data-width="470" data-num-posts="2"></div>
                </div>
                </center>
                <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://yahoo.com">Tweet</a>
                <div class="fb-like" data-href="https://www.facebook.com/MwnMyWellbeingNetwork/posts/360901904016732" data-send="true" data-width="450" data-show-faces="true"></div>

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

