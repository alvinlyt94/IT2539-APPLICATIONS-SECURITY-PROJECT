using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using MySql.Data.MySqlClient;
using System.Configuration;
using MWN.Connector;

using System.Web.Services;
using System.Security.Cryptography;

namespace MWN
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Advertisement start  
                string ToShowAds = null;
                string query00 = "SELECT AdsVisible FROM mwn.account WHERE userName=@1";
                using (MySqlConnection conn = DBConnector.getConnection())
                {
                    conn.Open();
                    using (MySqlCommand command = new MySqlCommand(query00, conn))
                    {
                        command.Parameters.Add(new MySqlParameter("1", User.Identity.Name));
                        MySqlDataReader reader = command.ExecuteReader();
                        while (reader.Read())
                        {
                            ToShowAds = reader["AdsVisible"].ToString();
                        }
                    }
                }
                if (ToShowAds == "Enabled" || ToShowAds == null)
                {
                    string randomAdvertisementIndex = RandomAdvertisement(1, false);
                    if (randomAdvertisementIndex == "1")
                    {
                        AdvertisementImage1.ImageUrl = "images/milo_banner.jpg";
                    }
                    else if (randomAdvertisementIndex == "2")
                    {
                        AdvertisementImage1.ImageUrl = "images/nike_banner.jpg";
                    }
                    else if (randomAdvertisementIndex == "3")
                    {
                        AdvertisementImage1.ImageUrl = "images/adidas_banner.jpg";
                    }
                    else if (randomAdvertisementIndex == "4")
                    {
                        AdvertisementImage1.ImageUrl = "images/gatorade_banner.jpg";
                    }
                    else if (randomAdvertisementIndex == "5")
                    {
                        AdvertisementImage1.ImageUrl = "images/nb_banner.jpg";
                    }
                }
                else if (ToShowAds == "Disabled")
                {
                    AdvertisementImage1.Visible = false;
                }
                // Advertisement end

                // Direct user back to homepage if he/she is logged in
                if (User.Identity.IsAuthenticated)
                {
                    Response.Redirect("Homepage.aspx");
                }

                // Retrieve Need to Wait
                string NeedToWait = null;
                string query5 = "SELECT NeedToWait FROM mwn.fromto WHERE idFromTo=1";
                using (MySqlConnection conn = DBConnector.getConnection())
                {
                    conn.Open();
                    using (MySqlCommand command = new MySqlCommand(query5, conn))
                    {
                        MySqlDataReader reader = command.ExecuteReader();
                        while (reader.Read())
                        {
                            NeedToWait = reader["NeedToWait"].ToString();
                        }
                    }
                }

                // Disable Login Button
                Button but = (Button)Login1.FindControl("LoginButton");
                if (NeedToWait == "true")
                {
                    but.Enabled = false;
                    but.ForeColor = System.Drawing.Color.Red;
                }

                TimerInfoLabel.Style["visibility"] = "hidden";
                TimerCountdownLabel.Style["visibility"] = "hidden";
                PasswordLabelText.Style["visibility"] = "hidden";

                // From Changed Password
                //string toDisplay = Session["ToDisplay"].ToString();
                //if (toDisplay == "Yes")
                //{
                //    SuccessChanged.Text = Session["DisplayMessage"].ToString();
                //    toDisplay = "No";
                //}

                // Getting display list
                string toShow = "NotShow";
                string fromWhere = "";
                string query = "SELECT fromToList, fromWhere FROM mwn.fromTo WHERE idFromTo = 1";
                using (MySqlConnection conn = DBConnector.getConnection())
                {
                    conn.Open();
                    using (MySqlCommand command = new MySqlCommand(query, conn))
                    {
                        MySqlDataReader reader = command.ExecuteReader();
                        while (reader.Read())
                        {
                            toShow = reader["fromToList"].ToString();
                            fromWhere = reader["fromWhere"].ToString();
                        }
                    }
                }

                // Show and not to show Successful Register Message
                if (toShow == "Show")
                {
                    if (fromWhere == "VerifyAccount")
                    {
                        SuccessVerified.Text = "Successfully Verified Your Account! ";
                        // Setting back to not show
                        string query2 = "UPDATE mwn.fromTo SET fromToList=@1 WHERE idFromTo = 1";
                        using (MySqlConnection conn = DBConnector.getConnection())
                        {
                            conn.Open();
                            using (MySqlCommand command = new MySqlCommand(query2, conn))
                            {
                                command.Parameters.Add(new MySqlParameter("1", "NotShow"));
                                command.ExecuteNonQuery();
                            }
                        }
                    }
                    else if (fromWhere == "RetrievedUsername")
                    {
                        SuccessVerified.Text = "Your registered Username has been successfully sent to your email address! Thank you for using My Well-being Network Forgot Username Service!";
                        // Setting back to not show
                        string query2 = "UPDATE mwn.fromTo SET fromToList=@1 WHERE idFromTo = 1";
                        using (MySqlConnection conn = DBConnector.getConnection())
                        {
                            conn.Open();
                            using (MySqlCommand command = new MySqlCommand(query2, conn))
                            {
                                command.Parameters.Add(new MySqlParameter("1", "NotShow"));
                                command.ExecuteNonQuery();
                            }
                        }
                    }
                    else if (fromWhere == "RetrieveEmail")
                    {
                        SuccessVerified.Text = "Your registered Email Address has been successfully sent to your phone via SMS! Thank you for using My Well-being Network SMS Service!";
                        // Setting back to not show
                        string query2 = "UPDATE mwn.fromTo SET fromToList=@1 WHERE idFromTo = 1";
                        using (MySqlConnection conn = DBConnector.getConnection())
                        {
                            conn.Open();
                            using (MySqlCommand command = new MySqlCommand(query2, conn))
                            {
                                command.Parameters.Add(new MySqlParameter("1", "NotShow"));
                                command.ExecuteNonQuery();
                            }
                        }
                    }

                }
                if (toShow == "NotShow")
                {
                    SuccessVerified.Text = "";
                }
            }
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            string userName = Login1.UserName;
            string passWord = Login1.Password;

            e.Authenticated = false;

            // Terence Part start
            // Retrieve Password from database
            string passwordDatabase = null;
            string saltDatabase = null;
            string query5 = "SELECT passWord, saltStringP FROM mwn.account WHERE userName=@1";
            using (MySqlConnection conn = DBConnector.getConnection())
            {
                conn.Open();
                using (MySqlCommand command = new MySqlCommand(query5, conn))
                {
                    command.Parameters.Add(new MySqlParameter("1", userName));
                    command.ExecuteNonQuery();
                    MySqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        passwordDatabase = reader["passWord"].ToString();
                        saltDatabase = reader["saltStringP"].ToString();
                    }
                }
            }

            if (passwordDatabase != null)
            {
                // load salt and key from database
                byte[] key = StringToByteArray(passwordDatabase);
                byte[] salt = StringToByteArray(saltDatabase);

                using (var deriveBytes = new Rfc2898DeriveBytes(passWord, salt))
                {
                    byte[] newKey = deriveBytes.GetBytes(20);  // derive a 20-byte key

                    if (!newKey.SequenceEqual(key))
                    {
                        e.Authenticated = false;
                    }
                    else
                    {
                        // Checking whether account is verified or not
                        string query2 = "SELECT * FROM mwn.account WHERE userName=@1 AND verified=@2";
                        using (MySqlConnection conn = DBConnector.getConnection())
                        {
                            conn.Open();
                            using (MySqlCommand command = new MySqlCommand(query2, conn))
                            {
                                command.Parameters.Add(new MySqlParameter("1", userName));
                                command.Parameters.Add(new MySqlParameter("2", "Verified"));
                                MySqlDataReader reader = command.ExecuteReader();
                                while (reader.Read())
                                {
                                    e.Authenticated = true;
                                }
                            }
                        }
                    }
                }
            }
            //Terence Part end

            //// Checking correct username & password
            //string query2 = "SELECT * FROM mwn.account WHERE userName=@1 AND passWord=@2 AND verified=@3";
            //using (MySqlConnection conn = DBConnector.getConnection())
            //{
            //    conn.Open();
            //    using (MySqlCommand command = new MySqlCommand(query2, conn))
            //    {
            //        command.Parameters.Add(new MySqlParameter("1", userName));
            //        command.Parameters.Add(new MySqlParameter("2", passWord));
            //        command.Parameters.Add(new MySqlParameter("3", "Verified"));
            //        MySqlDataReader reader = command.ExecuteReader();
            //        while (reader.Read())
            //        {
            //            e.Authenticated = true;
            //        }
            //    }
            //}

            // Displaying error message/validation
            if (e.Authenticated == false)
            {
                PasswordLabelText.Style["visibility"] = "show";

                // Login Failed Counter
                string stringCounter = null;
                string query3 = "SELECT LoginFailedCounter FROM mwn.fromto WHERE idFromTo=1";
                using (MySqlConnection conn = DBConnector.getConnection())
                {
                    conn.Open();
                    using (MySqlCommand command = new MySqlCommand(query3, conn))
                    {
                        MySqlDataReader reader = command.ExecuteReader();
                        while (reader.Read())
                        {
                            stringCounter = reader["LoginFailedCounter"].ToString();
                        }
                    }
                }
                int LoginFailedCounter = int.Parse(stringCounter);
                LoginFailedCounter++;

                // Preveting Refresh Problem
                if (passWord == "")
                {
                    LoginFailedCounter--;
                }

                // Update the Login Failed Counter in database
                string query4 = "UPDATE mwn.fromto SET LoginFailedCounter=@1 WHERE idFromTo=1";
                using (MySqlConnection conn = DBConnector.getConnection())
                {
                    conn.Open();
                    using (MySqlCommand command = new MySqlCommand(query4, conn))
                    {
                        command.Parameters.Add(new MySqlParameter("1", LoginFailedCounter));
                        command.ExecuteNonQuery();
                    }
                }

                // Disable Login Button
                Button but = (Button)Login1.FindControl("LoginButton");
                if (LoginFailedCounter >= 5)
                {
                    but.Enabled = false;
                    but.ForeColor = System.Drawing.Color.Red;

                    // Update the Need to Wait to true in database
                    string query6 = "UPDATE mwn.fromto SET NeedToWait=@1 WHERE idFromTo=1";
                    using (MySqlConnection conn = DBConnector.getConnection())
                    {
                        conn.Open();
                        using (MySqlCommand command = new MySqlCommand(query6, conn))
                        {
                            command.Parameters.Add(new MySqlParameter("1", "true"));
                            command.ExecuteNonQuery();
                        }
                    }
                }
            }
            else
            {
                PasswordLabelText.Style["visibility"] = "hidden";

                // Reset Login Failed Counter to be 0
                int LoginFailedCounter = 0;
                string query4 = "UPDATE mwn.fromto SET LoginFailedCounter=@1 WHERE idFromTo=1";
                using (MySqlConnection conn = DBConnector.getConnection())
                {
                    conn.Open();
                    using (MySqlCommand command = new MySqlCommand(query4, conn))
                    {
                        command.Parameters.Add(new MySqlParameter("1", LoginFailedCounter));
                        command.ExecuteNonQuery();
                    }
                }
            }
        }

        protected void Login1_LoggedIn(object sender, EventArgs e)
        {
            Response.Redirect("Homepage.aspx");//default page
            //Response.Redirect("About.aspx");//specific page
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            string stringCounter = null;

            // Retrieve Need to Wait
            string NeedToWait = null;
            string query2 = "SELECT NeedToWait FROM mwn.fromto WHERE idFromTo=1";
            using (MySqlConnection conn = DBConnector.getConnection())
            {
                conn.Open();
                using (MySqlCommand command = new MySqlCommand(query2, conn))
                {
                    MySqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        NeedToWait = reader["NeedToWait"].ToString();
                    }
                }
            }

            // Retrieve Login Failed Counter
            string query3 = "SELECT LoginFailedCounter FROM mwn.fromto WHERE idFromTo=1";
            using (MySqlConnection conn = DBConnector.getConnection())
            {
                conn.Open();
                using (MySqlCommand command = new MySqlCommand(query3, conn))
                {
                    MySqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        stringCounter = reader["LoginFailedCounter"].ToString();
                    }
                }
            }
            int LoginFailedCounter = int.Parse(stringCounter);

            // Greater or equal to 5 invalid logins
            if (LoginFailedCounter >= 5)
            {
                if (NeedToWait == "true")
                {
                    
                    TimerInfoLabel.Style["visibility"] = "show";
                    if (!(TimerCountdownLabel.Text == "-1"))
                    {
                        TimerCountdownLabel.Style["visibility"] = "show";
                    }

                    // Countdown timer increases
                    TimerInfoLabel.Text = "Unable to login. Please wait... ";
                    if (LoginFailedCounter == 5)
                    {
                        if (TimerCountdownLabel.Text == "-1")
                        {
                            TimerCountdownLabel.Text = "11";
                            TimerCountdownLabel.Style["visibility"] = "show";
                        }
                    }
                    else if (LoginFailedCounter == 6)
                    {
                        if (TimerCountdownLabel.Text == "-1")
                        {
                            TimerCountdownLabel.Text = "16";
                            TimerCountdownLabel.Style["visibility"] = "show";
                        }
                    }
                    else if (LoginFailedCounter == 7)
                    {
                        if (TimerCountdownLabel.Text == "-1")
                        {
                            TimerCountdownLabel.Text = "21";
                            TimerCountdownLabel.Style["visibility"] = "show";
                        }
                    }
                    else if (LoginFailedCounter >= 8)
                    {
                        if (TimerCountdownLabel.Text == "-1")
                        {
                            TimerCountdownLabel.Text = "31";
                            TimerCountdownLabel.Style["visibility"] = "show";
                        }
                    }
                }

                if (TimerCountdownLabel.Text == "0")
                {
                    TimerCountdownLabel.Style["visibility"] = "hidden";
                    TimerInfoLabel.Text = "Please re-enter your password.";

                    // Set to default
                    TimerCountdownLabel.Text = "-1";

                    // Update the Need to Wait to false in database
                    string query4 = "UPDATE mwn.fromto SET NeedToWait=@1 WHERE idFromTo=1";
                    using (MySqlConnection conn = DBConnector.getConnection())
                    {
                        conn.Open();
                        using (MySqlCommand command = new MySqlCommand(query4, conn))
                        {
                            command.Parameters.Add(new MySqlParameter("1", "false"));
                            command.ExecuteNonQuery();
                        }
                    }
                    Page.Response.Redirect(HttpContext.Current.Request.Url.ToString(), true);
                }
                else if (NeedToWait == "true")
                {
                    TimerCountdownLabel.Text = (int.Parse(TimerCountdownLabel.Text) - 1).ToString();
                }
            }
        }

        //converting string to byte    
        public static byte[] StringToByteArray(String hex)
        {
            int NumberChars = hex.Length;
            byte[] bytes = new byte[NumberChars / 2];
            for (int i = 0; i < NumberChars; i += 2)
                bytes[i / 2] = Convert.ToByte(hex.Substring(i, 2), 16);
            return bytes;
        }

        protected void Keyboard_click(object sender, EventArgs e)
        {
            System.Diagnostics.Process.Start("osk.exe");
        }

        protected void ImageAdvertisement_Click(object sender, EventArgs e)
        {
            // Advertisement start
            int miloCounter = 0;
            int nikeCounter = 0;
            int adidasCounter = 0;
            int gatoradeCounter = 0;
            int nbCounter = 0;

            string query = "SELECT miloCounter, nikeCounter, adidasCounter, gatoradeCounter, nbCounter FROM mwn.advertisement WHERE idadvertisement=1";
            using (MySqlConnection conn = DBConnector.getConnection())
            {
                conn.Open();
                using (MySqlCommand command = new MySqlCommand(query, conn))
                {
                    MySqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        miloCounter = Convert.ToInt32(reader["miloCounter"]);
                        nikeCounter = Convert.ToInt32(reader["nikeCounter"]);
                        adidasCounter = Convert.ToInt32(reader["adidasCounter"]);
                        gatoradeCounter = Convert.ToInt32(reader["gatoradeCounter"]);
                        nbCounter = Convert.ToInt32(reader["nbCounter"]);
                    }
                }
            }

            if (AdvertisementImage1.ImageUrl == "images/milo_banner.jpg")
            {
                miloCounter++;

                System.Diagnostics.Process.Start("http://www.nestle.com.sg/milo/");
            }
            else if (AdvertisementImage1.ImageUrl == "images/nike_banner.jpg")
            {
                nikeCounter++;
                System.Diagnostics.Process.Start("http://www.nike.com/sg/en_gb/");
            }
            else if (AdvertisementImage1.ImageUrl == "images/adidas_banner.jpg")
            {
                adidasCounter++;
                System.Diagnostics.Process.Start("http://www.adidas.com.sg/");
            }
            else if (AdvertisementImage1.ImageUrl == "images/gatorade_banner.jpg")
            {
                gatoradeCounter++;
                System.Diagnostics.Process.Start("http://www.gatorade.com/#Home");
            }
            else if (AdvertisementImage1.ImageUrl == "images/nb_banner.jpg")
            {
                nbCounter++;
                System.Diagnostics.Process.Start("http://www.newbalance.com.sg/");
            }

            if (AdvertisementImage1.ImageUrl == "images/milo_banner.jpg" || AdvertisementImage1.ImageUrl == "images/nike_banner.jpg" || AdvertisementImage1.ImageUrl == "images/adidas_banner.jpg" || AdvertisementImage1.ImageUrl == "images/gatorade_banner.jpg" || AdvertisementImage1.ImageUrl == "images/nb_banner.jpg")
            {
                string query2 = "UPDATE mwn.advertisement SET miloCounter=@1, nikeCounter=@2, adidasCounter=@3, gatoradeCounter=@4, nbCounter=@5 WHERE idadvertisement=1";
                using (MySqlConnection conn = DBConnector.getConnection())
                {
                    conn.Open();
                    using (MySqlCommand command = new MySqlCommand(query2, conn))
                    {
                        command.Parameters.Add(new MySqlParameter("1", miloCounter));
                        command.Parameters.Add(new MySqlParameter("2", nikeCounter));
                        command.Parameters.Add(new MySqlParameter("3", adidasCounter));
                        command.Parameters.Add(new MySqlParameter("4", gatoradeCounter));
                        command.Parameters.Add(new MySqlParameter("5", nbCounter));
                        command.ExecuteNonQuery();
                    }
                }
            }

            string randomAdvertisementIndex = RandomAdvertisement(1, false);
            if (randomAdvertisementIndex == "1")
            {
                AdvertisementImage1.ImageUrl = "images/milo_banner.jpg";
            }
            else if (randomAdvertisementIndex == "2")
            {
                AdvertisementImage1.ImageUrl = "images/nike_banner.jpg";
            }
            else if (randomAdvertisementIndex == "3")
            {
                AdvertisementImage1.ImageUrl = "images/adidas_banner.jpg";
            }
            else if (randomAdvertisementIndex == "4")
            {
                AdvertisementImage1.ImageUrl = "images/gatorade_banner.jpg";
            }
            else if (randomAdvertisementIndex == "5")
            {
                AdvertisementImage1.ImageUrl = "images/nb_banner.jpg";
            }
            // Advertisment end
        }

        private static readonly Random Random = new Random();

        private static string RandomAdvertisement(int randomLength, bool strongPassword)
        {
            int seed = Random.Next(1, int.MaxValue);
            //const string allowedChars = "ABCDEFGHJKLMNOPQRSTUVWXYZ0123456789";
            const string allowedChars = "12345";
            const string specialCharacters = @"!#$%&'()*+,-./:;<=>?@[\]_";

            var chars = new char[randomLength];
            var rd = new Random(seed);

            for (var i = 0; i < randomLength; i++)
            {
                // If we are to use special characters
                if (strongPassword && i % Random.Next(3, randomLength) == 0)
                {
                    chars[i] = specialCharacters[rd.Next(0, specialCharacters.Length)];
                }
                else
                {
                    chars[i] = allowedChars[rd.Next(0, allowedChars.Length)];
                }
            }

            return new string(chars);
        }
    }
}