using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using MySql.Data.MySqlClient;
using System.Configuration;
using MWN.Connector;

namespace MWN
{
    public partial class VerifyAccount : System.Web.UI.Page
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
                    if (fromWhere == "ChangedPassword")
                    {
                        SuccessRegister.Text = "Successfully Changed Your Password! A Verification Code has been sent to your email. Please re-verify your account. ";
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
                    else if (fromWhere == "RegisterAccount")
                    {
                        SuccessRegister.Text = "Successfully Registered Your Account! A Verification Code has been sent to your email. ";
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
                    else if (fromWhere == "ResendVerify")
                    {
                        SuccessRegister.Text = "A New Generated Verification Code has been sent to your email. ";
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
                else if (toShow == "NotShow")
                {
                    SuccessRegister.Text = "";
                }
            }
        }

        protected void VerifyButton_Click(object sender, EventArgs e)
        {
            string userName = UserName.Text;
            string verificationCode = VerificationCode.Text;
            VerificationCodeValidateLabel.Text = "";

            Boolean toUpdate = false;

            // Comparing VerificationCode according to the username
            string query = "SELECT * FROM mwn.account WHERE userName = @1 AND verified = @2";
            using (MySqlConnection conn = DBConnector.getConnection())
            {
                conn.Open();
                using (MySqlCommand command = new MySqlCommand(query, conn))
                {
                    command.Parameters.Add(new MySqlParameter("1", userName));
                    command.Parameters.Add(new MySqlParameter("2", verificationCode));
                    MySqlDataReader reader = command.ExecuteReader();
                    // If there is return, means correct VerificationCode
                    while (reader.Read())
                    {
                        toUpdate = true;
                    }
                }
            }

            if (toUpdate == true)
            {
                // Setting the verification code of the username to "Verified"
                string query2 = "UPDATE mwn.account SET verified=@1 WHERE userName=@2";
                using (MySqlConnection conn = DBConnector.getConnection())
                {
                    conn.Open();
                    using (MySqlCommand command = new MySqlCommand(query2, conn))
                    {
                        command.Parameters.Add(new MySqlParameter("1", "Verified"));
                        command.Parameters.Add(new MySqlParameter("2", userName));
                        command.ExecuteNonQuery();
                    }
                }
                // Before Redirecting to Login page
                string query3 = "UPDATE mwn.fromTo SET fromToList=@1, fromWhere=@2 WHERE idFromTo = 1";
                using (MySqlConnection conn = DBConnector.getConnection())
                {
                    conn.Open();
                    using (MySqlCommand command = new MySqlCommand(query3, conn))
                    {
                        command.Parameters.Add(new MySqlParameter("1", "Show"));
                        command.Parameters.Add(new MySqlParameter("2", "VerifyAccount"));
                        command.ExecuteNonQuery();
                    }
                }
                // Redirecting to Login page
                Response.Redirect("Login.aspx");
            }
            else
            {
                // Checking whether account is already verified or not
                string verified = "";
                string query4 = "SELECT verified FROM mwn.account WHERE userName = @1";
                using (MySqlConnection conn = DBConnector.getConnection())
                {
                    conn.Open();
                    using (MySqlCommand command = new MySqlCommand(query4, conn))
                    {
                        command.Parameters.Add(new MySqlParameter("1", userName));
                        MySqlDataReader reader = command.ExecuteReader();
                        while (reader.Read())
                        {
                            verified = reader["verified"].ToString();
                        }
                    }
                }

                if (verified == "Verified")
                {
                    VerificationCodeValidateLabel.Text = "Account already verified.";
                }
                else
                {
                    VerificationCodeValidateLabel.Text = "Invalid Verification Code. Please re-enter.";
                }
            }
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