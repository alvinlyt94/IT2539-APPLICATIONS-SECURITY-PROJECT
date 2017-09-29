using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using MySql.Data.MySqlClient;
using System.Configuration;
using MWN.Connector;
using System.Net.Mail;

namespace MWN
{
    public partial class FeedbackUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SuccessSent.Visible = false;
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

                // Direct user back to login page if he/she is logged in
                if (!User.Identity.IsAuthenticated)
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void SendButton_Click(object sender, EventArgs e)
        {
            string userName = User.Identity.Name;
            string qn1Text = Question1.SelectedValue;
            string qn2Text = Question2.SelectedValue;
            string qn3Text = Question3.Text;
            string qn4Text = Question4.Text;
            string qn5Text = Question5.SelectedValue;
            string qn6Text = Question6.Text;
            string emailAddress = null;
            string accountID = null;
            int feedbackID = 0;

            // Get the account ID of the user doing the feedback
            string query00 = "SELECT * FROM mwn.account WHERE userName=@1";
            using (MySqlConnection conn = DBConnector.getConnection())
            {
                conn.Open();
                using (MySqlCommand command = new MySqlCommand(query00, conn))
                {
                    command.Parameters.Add(new MySqlParameter("1", User.Identity.Name));
                    MySqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        emailAddress = reader["emailAddress"].ToString();
                        accountID = reader["accountID"].ToString();
                    }
                }
            }

            // Get the ID of the feedback
            string query = "SELECT *  FROM mwn.fromto WHERE idFromTo=1";
            using (MySqlConnection conn = DBConnector.getConnection())
            {
                conn.Open();
                using (MySqlCommand command = new MySqlCommand(query, conn))
                {
                    MySqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        feedbackID = Convert.ToInt32(reader["feedbackID"]);
                    }
                }
            }

            feedbackID++;

            // Update the ID of the feedback
            string query2 = "UPDATE mwn.fromto SET feedbackID=@1 WHERE idFromTo=1";
            using (MySqlConnection conn = DBConnector.getConnection())
            {
                conn.Open();
                using (MySqlCommand command = new MySqlCommand(query2, conn))
                {
                    command.Parameters.Add(new MySqlParameter("1", feedbackID));
                    command.ExecuteNonQuery();
                }
            }

            // Sending Email
            MailMessage mail = new MailMessage("mwn_nanyang@hotmail.com", "mwn_nanyang@hotmail.com", "MWN - My Well-being Network's Feedback System with FeedbackID: " + feedbackID, "Personal Particulars: \nAccount ID: " + accountID + "\nUsername: " + User.Identity.Name + "\nEmail Address: " + emailAddress + "\n\nFeedback Details:\nQuestion 1: Do you find our website useful in terms of information provided? \n" + qn1Text + "\n\nQuestion 2: Please rate our overall website: \n" + qn2Text + "\n\nQuestion 3: What other information(s) you would like to see in our website? \n" + qn3Text + "\n\nQuestion 4: What other feature(s) you would like to see in our website? \n" + qn4Text + "\n\nQuestion 5: Would you subscribe to us if we send updates of our website to your emails? \n" + qn5Text + "\n\nQuestion 6: Please give us any more feedback below: \n" + qn6Text + "\n\n\nDate: " + DateTime.Now.ToString("MM\\/dd\\/yyyy h\\:mm tt"));
            SmtpClient client = new SmtpClient("smtp.live.com");
            client.Port = 587;
            client.Credentials = new System.Net.NetworkCredential("mwn_nanyang@hotmail.com", "nanyang2013");
            client.EnableSsl = true;
            client.Send(mail);

            SuccessSent.Visible = true;
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