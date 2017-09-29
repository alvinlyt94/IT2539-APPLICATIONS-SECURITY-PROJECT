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
    public partial class Register : System.Web.UI.Page
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
            }
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            PasswordValidateLabel.Text = "Password mismatch. Please re-enter.";

            string userName = UsernameTextBox.Text;
            string passWord = PasswordTextBox.Text;
            string confirmPassword = ConfirmPasswordTextBox.Text;
            string emailAddress = EmailTextBox.Text;
            string phoneNumber = PhoneNumberTextBox.Text;
            string firstName = FirstNameTextBox.Text;
            string lastName = LastNameTextBox.Text;
            string securityQns = SecurityQnsTextBox.Text;
            string securityAns = SecurityAnsTextBox.Text;
            string accountType = "Free Account User";
            string AdsVisible = "Enabled";

            Boolean toAllowCreate = true;

            // Checking for existing username
            string query1 = "SELECT userName FROM mwn.account WHERE userName = @1";
            using (MySqlConnection conn = DBConnector.getConnection())
            {
                conn.Open();
                using (MySqlCommand command = new MySqlCommand(query1, conn))
                {
                    command.Parameters.Add(new MySqlParameter("1", userName));
                    MySqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        toAllowCreate = false;
                    }
                    // Displaying of Username validation
                    if (toAllowCreate == true)
                    {
                        UsernameValidateLabel.Text = "";
                    }
                    else
                    {
                        UsernameValidateLabel.Text = "Username is not available.";
                    }
                }
            }
            toAllowCreate = true;

            // Checking for existing email
            string query3 = "SELECT emailAddress FROM mwn.account WHERE emailAddress = @1";
            using (MySqlConnection conn = DBConnector.getConnection())
            {
                conn.Open();
                using (MySqlCommand command = new MySqlCommand(query3, conn))
                {
                    command.Parameters.Add(new MySqlParameter("1", emailAddress));
                    MySqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        toAllowCreate = false;
                    }
                    // Displaying of Username validation
                    if (toAllowCreate == true)
                    {
                        EmailValidateLabel.Text = "";
                    }
                    else
                    {
                        EmailValidateLabel.Text = "Email Address is not available.";
                    }
                }
            }
            toAllowCreate = true;

            // Checking for existing phone
            string query22 = "SELECT phoneNumber FROM mwn.account WHERE phoneNumber = @1";
            using (MySqlConnection conn = DBConnector.getConnection())
            {
                conn.Open();
                using (MySqlCommand command = new MySqlCommand(query22, conn))
                {
                    command.Parameters.Add(new MySqlParameter("1", phoneNumber));
                    MySqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        toAllowCreate = false;
                    }
                    // Displaying of Username validation
                    if (toAllowCreate == true)
                    {
                        PhoneValidateLabel.Text = "";
                    }
                    else
                    {
                        PhoneValidateLabel.Text = "Phone Number is not available.";
                    }
                }
            }

            // Checking for captcha
            try
            {
                if (this.txtimgcode.Text != this.Session["CaptchaImageText"].ToString())
                {
                    lblmsg.Text = "Invalid Captcha. Please re-enter captcha.";
                    toAllowCreate = false;
                }
            }
            catch (Exception)
            {
                lblmsg.Text = "Invalid Captcha. Please re-enter captcha.";
                toAllowCreate = false;
            }
            this.txtimgcode.Text = "";

            // Checking for password & confirm password
            if (passWord == confirmPassword)
            {
                // Generate verification code
                string verificationCode = VerificationCodeGenerator(15, false);

                // Displaying of Password validation
                PasswordValidateLabel.Text = "";

                if (toAllowCreate == true)
                {
                    string saltStringP = null;
                    string saltStringA = null;
                    // specify that we want to randomly generate a 20-byte salt for password
                    using (var deriveBytes = new Rfc2898DeriveBytes(passWord, 20))
                    {
                        byte[] salt = deriveBytes.Salt;
                        byte[] key = deriveBytes.GetBytes(20);  // derive a 20-byte key

                        //converting to hexidecimal string 
                        saltStringP = ByteArrayToString(salt);
                        passWord = ByteArrayToString(key);
                    }
                    // specify that we want to randomly generate a 20-byte salt for security ans
                    using (var deriveBytes = new Rfc2898DeriveBytes(securityAns, 20))
                    {
                        byte[] salt = deriveBytes.Salt;
                        byte[] key = deriveBytes.GetBytes(20);  // derive a 20-byte key

                        //converting to hexidecimal string 
                        saltStringA = ByteArrayToString(salt);
                        securityAns = ByteArrayToString(key);
                    }

                    // save salt and key to database
                    string query33 = "INSERT INTO mwn.account(userName, passWord, emailAddress, phoneNumber, firstName, lastName, securityQns, securityAns, accountType, verified, saltStringP, saltStringA, AdsVisible) VALUES (@1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @11, @12, @13)";
                    using (MySqlConnection conn = DBConnector.getConnection())
                    {
                        conn.Open();
                        using (MySqlCommand command = new MySqlCommand(query33, conn))
                        {
                            command.Parameters.Add(new MySqlParameter("1", userName));
                            command.Parameters.Add(new MySqlParameter("2", passWord));
                            command.Parameters.Add(new MySqlParameter("3", emailAddress));
                            command.Parameters.Add(new MySqlParameter("4", phoneNumber));
                            command.Parameters.Add(new MySqlParameter("5", firstName));
                            command.Parameters.Add(new MySqlParameter("6", lastName));
                            command.Parameters.Add(new MySqlParameter("7", securityQns));
                            command.Parameters.Add(new MySqlParameter("8", securityAns));
                            command.Parameters.Add(new MySqlParameter("9", accountType));
                            command.Parameters.Add(new MySqlParameter("10", verificationCode));
                            command.Parameters.Add(new MySqlParameter("11", saltStringP));
                            command.Parameters.Add(new MySqlParameter("12", saltStringA));
                            command.Parameters.Add(new MySqlParameter("13", AdsVisible));
                            command.ExecuteNonQuery();
                        }
                    }

                    // Sending Email
                    MailMessage mail = new MailMessage("mwn_nanyang@hotmail.com", emailAddress, "RE: Verification Code", "Thank you " + userName + " for registering with My Well-being Network! \n\nPlease verify your account using our given verification code: " + verificationCode + "\n\nVerification Page: http://localhost:9211/VerifyAccount.aspx");
                    SmtpClient client = new SmtpClient("smtp.live.com");
                    client.Port = 587;
                    client.Credentials = new System.Net.NetworkCredential("mwn_nanyang@hotmail.com", "nanyang2013");
                    client.EnableSsl = true;
                    client.Send(mail);

                    // Before Redirecting to VerifyAccount page
                    string query4 = "UPDATE mwn.fromTo SET fromToList=@1, fromWhere=@2 WHERE idFromTo = 1";
                    using (MySqlConnection conn = DBConnector.getConnection())
                    {
                        conn.Open();
                        using (MySqlCommand command = new MySqlCommand(query4, conn))
                        {
                            command.Parameters.Add(new MySqlParameter("1", "Show"));
                            command.Parameters.Add(new MySqlParameter("2", "RegisterAccount"));
                            command.ExecuteNonQuery();
                        }
                    }
                    // Redirecting to VerifyAccount page
                    Response.Redirect("VerifyAccount.aspx");
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