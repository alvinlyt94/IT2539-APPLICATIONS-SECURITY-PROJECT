using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using MySql.Data.MySqlClient;
using System.Configuration;
using MWN.Connector;
using System.Security.Cryptography;
using System.Text;
using System.Net.Mail;

namespace MWN
{
    public partial class ForgotPassword : System.Web.UI.Page
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
                SecurityAnsTextField.Style["visibility"] = "hidden";
                SeqLabel.Style["visibility"] = "hidden";
                SeaLabel.Style["visibility"] = "hidden";
                ToGoIn.Style["visibility"] = "hidden";
            }
        }

        protected void RetrievePassword_Click(object sender, EventArgs e)
        {
            string userName = UsernameTextField.Text;
            string securityAns = SecurityAnsTextField.Text;

            // To proceed to check security ans
            Boolean toProceed = false;
            int ToGoInside = int.Parse(ToGoIn.Text);


            // Retrieve security qns
            string query = "SELECT securityQns FROM mwn.account WHERE userName=@1";
            using (MySqlConnection conn = DBConnector.getConnection())
            {
                conn.Open();
                using (MySqlCommand command = new MySqlCommand(query, conn))
                {
                    command.Parameters.Add(new MySqlParameter("1", userName));
                    MySqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        UsernameValidateLabel.Text = "";

                        // Display both the labels of Security Qns and Security Ans
                        SeqLabel.Style["visibility"] = "show";
                        SeaLabel.Style["visibility"] = "show";

                        // Display SecurityQnsLabel retrieved
                        SecurityQnsLabel.Text = reader["securityQns"].ToString();

                        // Display SecurityAnsTextField for input
                        SecurityAnsTextField.Style["visibility"] = "show";

                        SecurityAnsTextField.Enabled = true;

                        // Username label shown and textfield hidden
                        UsernameLabel.Text = userName;
                        UsernameTextField.Style["visibility"] = "hidden";

                        // Change Button name
                        RetrievePassword.Text = "Submit Answer";
                        toProceed = true;
                    }
                    else
                    {
                        UsernameValidateLabel.Text = "Username is not available.";
                    }
                }
            }

            // Proceed to security ans
            if (toProceed == true)
            {
                ToGoInside++;
                ToGoIn.Text = ToGoInside.ToString();

                // Retrieve security ans
                string securityAnsDatabase = null;
                string saltDatabase = null;
                string query2 = "SELECT securityAns, saltStringA FROM mwn.account WHERE userName=@1";
                using (MySqlConnection conn = DBConnector.getConnection())
                {
                    conn.Open();
                    using (MySqlCommand command = new MySqlCommand(query2, conn))
                    {
                        command.Parameters.Add(new MySqlParameter("1", userName));
                        MySqlDataReader reader = command.ExecuteReader();
                        while (reader.Read())
                        {
                            // SecurityAns retrieved
                            securityAnsDatabase = reader["securityAns"].ToString();
                            saltDatabase = reader["saltStringA"].ToString();
                        }
                    }
                }

                byte[] key = StringToByteArray(securityAnsDatabase);
                byte[] salt = StringToByteArray(saltDatabase);

                using (var deriveBytes = new Rfc2898DeriveBytes(securityAns, salt))
                {
                    byte[] newKey = deriveBytes.GetBytes(20);  // derive a 20-byte key

                    // Comparing Security Answer
                    if (newKey.SequenceEqual(key))
                    {
                        SecurityAnsValidateLabel.Text = "";

                        Application["Name"] = userName;

                        // Generate PIN Number
                        string pinNumber = PinNumberGenerator(6, false);
                        string toSendPinNumber = pinNumber;

                        string saltStringPN = null;
                        // specify that we want to randomly generate a 20-byte salt for password
                        using (var deriveBytes2 = new Rfc2898DeriveBytes(pinNumber, 20))
                        {
                            byte[] salt2 = deriveBytes2.Salt;
                            byte[] key2 = deriveBytes2.GetBytes(20);  // derive a 20-byte key

                            //converting to hexidecimal string 
                            saltStringPN = ByteArrayToString(salt2);
                            pinNumber = ByteArrayToString(key2);
                        }

                        // Update PIN Number
                        string query5 = "UPDATE mwn.account SET pinNumber=@1, saltStringPN=@2 WHERE userName=@3";
                        using (MySqlConnection conn = DBConnector.getConnection())
                        {
                            conn.Open();
                            using (MySqlCommand command = new MySqlCommand(query5, conn))
                            {
                                command.Parameters.Add(new MySqlParameter("1", pinNumber));
                                command.Parameters.Add(new MySqlParameter("2", saltStringPN));
                                command.Parameters.Add(new MySqlParameter("3", userName));
                                command.ExecuteNonQuery();
                            }
                        }

                        // Retrieve phone number
                        string phoneDatabase = "";
                        string query4 = "SELECT phoneNumber FROM mwn.account WHERE userName = @1";
                        using (MySqlConnection conn = DBConnector.getConnection())
                        {
                            conn.Open();
                            using (MySqlCommand command = new MySqlCommand(query4, conn))
                            {
                                command.Parameters.Add(new MySqlParameter("1", userName));
                                command.ExecuteNonQuery();
                                MySqlDataReader reader = command.ExecuteReader();
                                while (reader.Read())
                                {
                                    phoneDatabase = reader["phoneNumber"].ToString();
                                }
                            }
                        }

                        // Sending to phone
                        MySMS.SMSService smsWS = new MySMS.SMSService();
                        string s = smsWS.sendMessage(phoneDatabase, "Greetings " + userName + "! Your PIN Number is: " + toSendPinNumber + ". Please use this PIN number to change your password. Thank you for using MWN's SMS Service!" , "ASPJ11", "524420");

                        // REMEMBER TO REMOVE FROM EMAIL

                        //// Sending to email
                        //MailMessage mail = new MailMessage("mwn_nanyang@hotmail.com", "alvinlyt94@hotmail.com", "RE: Pin Number", "Your PIN Number is: " + toSendPinNumber + ". Please use this PIN number to change your password. Thank you for using My Well-being Network SMS Service!");
                        //SmtpClient client = new SmtpClient("smtp.live.com");
                        //client.Port = 587;
                        //client.Credentials = new System.Net.NetworkCredential("mwn_nanyang@hotmail.com", "nanyang2013");
                        //client.EnableSsl = true;
                        //client.Send(mail);

                        // Before Redirecting to ChangePassword page
                        string query6 = "UPDATE mwn.fromTo SET fromToList=@1, fromWhere=@2 WHERE idFromTo = 1";
                        using (MySqlConnection conn = DBConnector.getConnection())
                        {
                            conn.Open();
                            using (MySqlCommand command = new MySqlCommand(query6, conn))
                            {
                                command.Parameters.Add(new MySqlParameter("1", "Show"));
                                command.Parameters.Add(new MySqlParameter("2", "ForgotPassword"));
                                command.ExecuteNonQuery();
                            }
                        }

                        Response.Redirect("ChangePassword.aspx");
                    }
                    else
                    {
                        if (ToGoInside >= 2)
                        {
                            SecurityAnsValidateLabel.Text = "Invalid Security Answer. Please re-enter.";
                        }
                    }
                }
            }
        }

        private static readonly Random Random = new Random();

        private static string PinNumberGenerator(int passwordLength, bool strongPassword)
        {
            int seed = Random.Next(1, int.MaxValue);
            //const string allowedChars = "ABCDEFGHJKLMNOPQRSTUVWXYZ0123456789";
            const string allowedChars = "0123456789";
            const string specialCharacters = @"!#$%&'()*+,-./:;<=>?@[\]_";

            var chars = new char[passwordLength];
            var rd = new Random(seed);

            for (var i = 0; i < passwordLength; i++)
            {
                // If we are to use special characters
                if (strongPassword && i % Random.Next(3, passwordLength) == 0)
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

        //converting string to byte    
        public static byte[] StringToByteArray(String hex)
        {
            int NumberChars = hex.Length;
            byte[] bytes = new byte[NumberChars / 2];
            for (int i = 0; i < NumberChars; i += 2)
                bytes[i / 2] = Convert.ToByte(hex.Substring(i, 2), 16);
            return bytes;
        }

        public static string ByteArrayToString(byte[] ba)
        {
            StringBuilder hex = new StringBuilder(ba.Length * 2);
            foreach (byte b in ba)
                hex.AppendFormat("{0:x2}", b);
            return hex.ToString();
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