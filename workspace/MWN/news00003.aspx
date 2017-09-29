<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="news00003.aspx.cs" Inherits="MWN.news00003" %>

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
                        <li class="current"><a href="news00003.aspx">Simple Ways to Live a Healthy Lifestyle!</a></li>
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

                <h1>Simple Ways to Live a Healthy Lifestyle!</h1>
                <div class="box">
                    <h5>29th Jan 2013 by Benjamin</h5>

                    <center>
                    <img src="images/news/news00003.jpg" alt="Lifestyle" style="border-style:ridge; border-width:10px; width:700px; margin-left: 10px">
                        </center>

                    &nbsp;<div style="margin-left: 20px">
                        <p>
                            You hear a lot about living a healthy lifestyle, but what does that mean? In general, a healthy person doesn't smoke, is at a healthy weight, eats healthy and exercises. Sounds simple, doesn't it?
The trick to healthy living is making small changes...taking more steps, adding fruit to your cereal, having an extra glass of water...these are just a few ways you can start living healthy without drastic changes.
                        </p>
                    </div><br />

                    <div style="margin-left: 20px">
                        <h style="font-weight: bold; font-size: larger">Exercise</h>
                        <p>
                            One of the biggest problems in America today is lack of activity. We know it's good for us but avoid it like the plague either because we're used to being sedentary or afraid that exercise has to be vigorous to be worth our time. The truth is, movement is movement and the more you do, the healthier you'll be. Even moderate activities like chores, gardening and walking can make a difference.
                        </p>
                        <br />
                        <p>Just adding a little movement to your life can:</p>

                        <li>Reduce the risk of heart disease, stroke and diabetes</li>
                        <li>Improve joint stability</li>
                        <li>Increase and improve range of movement</li>
                        <li>Help maintain flexibility as you age</li>
                        <li>Maintain bone mass</li>
                        <li>Prevent osteoporosis and fractures</li>
                        <li>Improve mood and reduce symptoms of anxiety and depression</li>
                        <li>Enhance self esteem</li>
                        <li>Improve memory in elderly people</li>
                        <li>Reduce stress</li>
                        <br />

                        <p>
                            So, even if you opt for small changes and a more modest weight loss, you can see the benefits are still pretty good. One study has found that just a 10% weight reduction helped obese patients reduce blood pressure, cholesterol and increase longevity.

                        </p>
                    </div><br />

                    <div style="margin-left: 20px">
                        <h style="font-weight: bold; font-size: larger">Simple Ways to Move Your Body</h>
                        <p>
                            You can start the process of weight loss now by adding a little more activity to your life. If you're not ready for a structured program, start small. Every little bit counts and it all adds up to burning more calories.
                        </p>
                        <br />
                        <li><b>Turn off the TV.</b> Once a week, turn off the TV and do something a little more physical with your family. Play games, take a walk...almost anything will be more active than sitting on the couch.
                        </li>
                        <li><b>Walk more.</b> Look for small ways to walk more. When you get the mail, take a walk around the block, take the dog for an extra outing each day or walk on your treadmill for 5 minutes before getting ready for work.
                        </li>
                        <li><b>Do some chores.</b> Shoveling snow, working in the garden, raking leaves, sweeping the floor...these kinds of activities may not be 'vigorous' exercise, but they can keep you moving while getting your house in order.
                        </li>
                        <li><b>Pace while you talk.</b> When you're on the phone, pace around or even do some cleaning while gabbing. This is a great way to stay moving while doing something you enjoy.
                        </li>
                        <li><b>Be aware.</b> Make a list of all the physical activities you do on a typical day. If you find that the bulk of your time is spent sitting, make another list of all the ways you could move more--getting up each hour to stretch or walk, walk the stairs at work, etc.</li>
                        </p>
                    </div><br />

                    <div style="margin-left: 20px">
                        <h style="font-weight: bold; font-size: larger">Eating Well</h>
                        <p>
                            Eating a healthy diet is another part of the healthy lifestyle. Not only can a clean diet help with weight management, it can also improve your health and quality of life as you get older. You can use the new MyPlate to determine how many calories you need and what food groups you should focus on or, if you're looking for smaller changes, you can use these tips for simple ways to change how you eat:</p>
                        <br />
                            
                            <li><b>Eat more fruit.</b> Add it to your cereal, your salads or even your dinners
                            </li>
                            <li><b>Sneak in more veggies.</b> Add them wherever you can--a tomato on your sandwich, peppers on your pizza, or extra veggies in your pasta sauce. Keep pre-cut or canned/frozen veggies ready for quick snacks.
                            </li>
                            <li><b>Switch your salad dressing.</b> If you eat full-fat dressing, switch to something lighter and you'll automatically eat less calories.
                            </li>
                            <li><b>Eat low-fat or fat-free dairy.</b> Switching to skim milk or fat free yogurt is another simple way to eat less calories without having to change too much in your diet.
                            </li>
                            <li><b>Make some substitutes.</b> Look through your cabinets or fridge and pick 3 foods you eat every day. Write down the nutritional content and, the next time you're at the store, find lower-calorie substitutes for just those 3 items.</li>
                        </p>
                    </div>

                    <br />
                    <center>
                <div class="fb-comments" data-href="https://www.facebook.com/MwnMyWellbeingNetwork/posts/360902167350039" data-width="470" data-num-posts="2"></div>
                </div>
                </center>
                <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://yahoo.com">Tweet</a>
                <div class="fb-like" data-href="https://www.facebook.com/MwnMyWellbeingNetwork/posts/360902167350039" data-send="true" data-width="450" data-show-faces="true"></div>


                </div>
            </div>
            <br />

            <div class="main-container">
            </div>
    </form>
    <!--#include file="Footer.html" -->

</body>
</html>

