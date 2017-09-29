using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using MySql.Data.MySqlClient;
using System.Configuration;
using MWN.Connector;
using System.Net;
using System.IO;
using System.Text;
using System.Net.Mail;
using System.Security.Cryptography;

namespace MWN
{
    public partial class ManageProfile : System.Web.UI.Page
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

                // Direct user back to login page if he/she is not logged in
                if (!User.Identity.IsAuthenticated)
                {
                    Response.Redirect("Login.aspx");
                }

                string userName = User.Identity.Name;
                string firstName = null;
                string lastName = null;
                string emailAddress = null;
                string phoneNumber = null;
                string accountType = null;

                string query0 = "SELECT * FROM mwn.account WHERE userName=@1";
                using (MySqlConnection conn = DBConnector.getConnection())
                {
                    conn.Open();
                    using (MySqlCommand command = new MySqlCommand(query0, conn))
                    {
                        command.Parameters.Add(new MySqlParameter("1", userName));
                        MySqlDataReader reader = command.ExecuteReader();
                        while (reader.Read())
                        {
                            firstName = reader["firstName"].ToString();
                            lastName = reader["lastName"].ToString();
                            emailAddress = reader["emailAddress"].ToString();
                            phoneNumber = reader["phoneNumber"].ToString();
                            accountType = reader["accountType"].ToString();
                        }
                    }
                }
                UsernameLabel.Text = userName;
                FirstNameLabel.Text = firstName;
                LastNameLabel.Text = lastName;
                EmailLabel.Text = emailAddress;
                PhoneLabel.Text = phoneNumber;
                AccountTypeLabel.Text = accountType;

                if (accountType == "Premium User" || accountType == "Admin User")
                {
                    AdsOnOffLabel.Visible = true;
                    AdsOnOffButton.Visible = true;

                    string AdsVisible = null;
                    string query2 = "SELECT AdsVisible FROM mwn.account WHERE userName=@1";
                    using (MySqlConnection conn = DBConnector.getConnection())
                    {
                        conn.Open();
                        using (MySqlCommand command = new MySqlCommand(query2, conn))
                        {
                            command.Parameters.Add(new MySqlParameter("1", userName));
                            MySqlDataReader reader = command.ExecuteReader();
                            while (reader.Read())
                            {
                                AdsVisible = reader["AdsVisible"].ToString();
                            }
                        }
                    }
                    AdsOnOffButton.Text = AdsVisible;
                }

                if (accountType == "Admin User")
                {
                    MiloClickLabel.Visible = true;
                    NikeClickLabel.Visible = true;
                    AdidasClickLabel.Visible = true;
                    GatoradeClickLabel.Visible = true;
                    NbClickLabel.Visible = true;

                    string miloCounterDisplay = null;
                    string nikeCounterDisplay = null;
                    string adidasCounterDisplay = null;
                    string gatoradeCounterDisplay = null;
                    string nbCounterDisplay = null;

                    string query1 = "SELECT * FROM mwn.advertisement WHERE idadvertisement=1";
                    using (MySqlConnection conn = DBConnector.getConnection())
                    {
                        conn.Open();
                        using (MySqlCommand command = new MySqlCommand(query1, conn))
                        {
                            MySqlDataReader reader = command.ExecuteReader();
                            while (reader.Read())
                            {
                                miloCounterDisplay = reader["miloCounter"].ToString();
                                nikeCounterDisplay = reader["nikeCounter"].ToString();
                                adidasCounterDisplay = reader["adidasCounter"].ToString();
                                gatoradeCounterDisplay = reader["gatoradeCounter"].ToString();
                                nbCounterDisplay = reader["nbCounter"].ToString();
                            }
                        }
                    }

                    MiloClickCountLabel.Text = miloCounterDisplay;
                    NikeClickCountLabel.Text = nikeCounterDisplay;
                    AdidasClickCountLabel.Text = adidasCounterDisplay;
                    GatoradeClickCountLabel.Text = gatoradeCounterDisplay;
                    NbClickCountLabel.Text = nbCounterDisplay;

                    string AdsVisible = null;
                    string query2 = "SELECT AdsVisible FROM mwn.account WHERE userName=@1";
                    using (MySqlConnection conn = DBConnector.getConnection())
                    {
                        conn.Open();
                        using (MySqlCommand command = new MySqlCommand(query2, conn))
                        {
                            command.Parameters.Add(new MySqlParameter("1", userName));
                            MySqlDataReader reader = command.ExecuteReader();
                            while (reader.Read())
                            {
                                AdsVisible = reader["AdsVisible"].ToString();
                            }
                        }
                    }
                    AdsOnOffButton.Text = AdsVisible;
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
                    SuccessUpdate.Text = "Successfully Updated Your Account! ";
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
                else if (toShow == "NotShow")
                {
                    SuccessUpdate.Text = "";
                }
            }
        }

        protected void AdsOnOffButton_Click(object sender, EventArgs e)
        {
            string userName = User.Identity.Name;
            string AdsVisible = null;
            if (AdsOnOffButton.Text == "Enabled")
            {
                AdsOnOffButton.Text = "Disabled";
                AdsVisible = "Disabled";
                AdvertisementImage1.Visible = false;
            }
            else if (AdsOnOffButton.Text == "Disabled")
            {
                AdsOnOffButton.Text = "Enabled";
                AdsVisible = "Enabled";
                AdvertisementImage1.Visible = true;

                string randomAdvertisementIndex = RandomAdvertisement(1, false);
                if (randomAdvertisementIndex == "1")
                {
                    AdvertisementImage1.ImageUrl = "images/milo_banner.jpg";
                }
                else if (randomAdvertisementIndex == "2")
                {
                    AdvertisementImage1.ImageUrl = "images/nike_banner.jpg";
                }
            }

            string query2 = "UPDATE mwn.account SET AdsVisible = @1 WHERE userName=@2";
            using (MySqlConnection conn = DBConnector.getConnection())
            {
                conn.Open();
                using (MySqlCommand command = new MySqlCommand(query2, conn))
                {
                    command.Parameters.Add(new MySqlParameter("1", AdsVisible));
                    command.Parameters.Add(new MySqlParameter("2", userName));
                    command.ExecuteNonQuery();
                }
            }
        }

        protected void ImageAdvertisement_Click(object sender, EventArgs e)
        {
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

            if (AccountTypeLabel.Text == "Premium Account User" || AccountTypeLabel.Text == "Admin User")
            {
                MiloClickCountLabel.Text = miloCounter.ToString();
                NikeClickCountLabel.Text = nikeCounter.ToString();
                AdidasClickCountLabel.Text = adidasCounter.ToString();
                GatoradeClickCountLabel.Text = gatoradeCounter.ToString();
                NbClickCountLabel.Text = nbCounter.ToString();
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

        protected void EditButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditProfile.aspx");
        }
    }
}