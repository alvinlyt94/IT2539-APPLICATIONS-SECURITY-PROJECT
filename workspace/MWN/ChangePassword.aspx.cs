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
using System.Security.Cryptography;
using System.Text;

namespace MWN
{
    public partial class ChangePassword : System.Web.UI.Page
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
                    if (fromWhere == "ForgotPassword")
                    {
                        SuccessVerified.Text = "A new generated PIN number has been sent to your phone via SMS. Please use the PIN number given to change your password. Thank you for using My Well-being Network SMS Service! Please wait for at least 1 minute for us to send your SMS.";

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
                    SuccessVerified.Text = "";
                }
            }
        }

        protected void ChangePassword_Click(object sender, EventArgs e)
        {
            string userName = Application["Name"].ToString();
            string passWord = PasswordTextBox.Text;
            string confirmPassword = ConfirmPasswordTextBox.Text;
            string pinNumber = PinNumberTextBox.Text;

            // Checking for password & confirm password
            if (passWord == confirmPassword)
            {
                // Retrieve pin number
                string pinNumberDatabase = null;
                string saltDatabase = null;
                string query2 = "SELECT pinNumber, saltStringPN FROM mwn.account WHERE userName=@1";
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
                            pinNumberDatabase = reader["pinNumber"].ToString();
                            saltDatabase = reader["saltStringPN"].ToString();
                        }
                    }
                }

                byte[] key = StringToByteArray(pinNumberDatabase);
                byte[] salt = StringToByteArray(saltDatabase);

                using (var deriveBytes = new Rfc2898DeriveBytes(pinNumber, salt))
                {
                    byte[] newKey = deriveBytes.GetBytes(20);  // derive a 20-byte key

                    // Comparing pin number
                    if (newKey.SequenceEqual(key))
                    {
                        // Displaying of Password validation
                        PasswordValidateLabel.Text = "";

                        // Generate verification code
                        string verificationCode = VerificationCodeGenerator(15, false);

                        string saltStringP = null;
                        // specify that we want to randomly generate a 20-byte salt for password
                        using (var deriveBytes2 = new Rfc2898DeriveBytes(passWord, 20))
                        {
                            byte[] salt2 = deriveBytes2.Salt;
                            byte[] key2 = deriveBytes2.GetBytes(20);  // derive a 20-byte key

                            //converting to hexidecimal string 
                            saltStringP = ByteArrayToString(salt2);
                            passWord = ByteArrayToString(key2);
                        }

                        string query = "UPDATE mwn.account SET passWord=@1, saltStringP=@2, verified=@3 WHERE userName=@4";
                        using (MySqlConnection conn = DBConnector.getConnection())
                        {
                            conn.Open();
                            using (MySqlCommand command = new MySqlCommand(query, conn))
                            {
                                command.Parameters.Add(new MySqlParameter("1", passWord));
                                command.Parameters.Add(new MySqlParameter("2", saltStringP));
                                command.Parameters.Add(new MySqlParameter("3", verificationCode));
                                command.Parameters.Add(new MySqlParameter("4", userName));
                                command.ExecuteNonQuery();
                            }
                        }

                        // Retrieve Email Address
                        string emailAddress = "";
                        string query4 = "SELECT emailAddress FROM mwn.account WHERE userName = @1";
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
                                    emailAddress = reader["emailAddress"].ToString();
                                }
                            }
                        }

                        // Sending email
                        MailMessage mail = new MailMessage("mwn_nanyang@hotmail.com", emailAddress, "RE: Verification Code", "Successfully Changed Your Password! Thank you " + userName + " for using My Well-being Network's Change Password service! \n\nPlease verify your account using our given verification code: " + verificationCode + "\n\nVerification Page: http://localhost:9211/VerifyAccount.aspx");
                        SmtpClient client = new SmtpClient("smtp.live.com");
                        client.Port = 587;
                        client.Credentials = new System.Net.NetworkCredential("mwn_nanyang@hotmail.com", "nanyang2013");
                        client.EnableSsl = true;
                        client.Send(mail);

                        // Before Redirecting to Login page
                        //Session["DisplayMessage"] = "Password Successfully Changed!";
                        //Session["ToDisplay"] = "Yes";
                        string query3 = "UPDATE mwn.fromTo SET fromToList=@1, fromWhere=@2 WHERE idFromTo = 1";
                        using (MySqlConnection conn = DBConnector.getConnection())
                        {
                            conn.Open();
                            using (MySqlCommand command = new MySqlCommand(query3, conn))
                            {
                                command.Parameters.Add(new MySqlParameter("1", "Show"));
                                command.Parameters.Add(new MySqlParameter("2", "ChangedPassword"));
                                command.ExecuteNonQuery();
                            }
                        }
                        // Redirecting to VerifyAccount page
                        Response.Redirect("VerifyAccount.aspx");
                    }
                    else
                    {
                        // Displaying of Pin Number validation
                        PinNumberValidateLabel.Text = "PIN Number mismatch. Please re-enter.";

                        // Displaying of Password validation
                        PasswordValidateLabel.Text = "";
                    }
                }
            }
            else
            {
                // Displaying of Password validation
                PasswordValidateLabel.Text = "Password mismatch. Please re-enter.";
            }
        }

        private static readonly Random Random = new Random();

        private static string VerificationCodeGenerator(int passwordLength, bool strongPassword)
        {
            int seed = Random.Next(1, int.MaxValue);
            //const string allowedChars = "ABCDEFGHJKLMNOPQRSTUVWXYZ0123456789";
            const string allowedChars = "abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ0123456789";
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