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
    public partial class EditProfile : System.Web.UI.Page
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
                string securityQns = null;

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
                            securityQns = reader["securityQns"].ToString();
                        }
                    }
                }
                UsernameLabel.Text = userName;
                FirstNameTextBox.Text = firstName;
                LastNameTextBox.Text = lastName;
                EmailTextBox.Text = emailAddress;
                PhoneNumberTextBox.Text = phoneNumber;
                SecurityQnsLabel.Text = securityQns;

                Application["EmailAddress"] = emailAddress;
                Application["PhoneNumber"] = phoneNumber;
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

        protected void UpdateProfile_Click(object sender, EventArgs e)
        {
            string userEmailAddress = Application["EmailAddress"].ToString();
            string userPhoneNumber = Application["PhoneNumber"].ToString();
            string emailAddress = EmailTextBox.Text;
            string securityAns = SecurityAnsTextField.Text;
            string phoneNumber = PhoneNumberTextBox.Text;
            string firstName = FirstNameTextBox.Text;
            string lastName = LastNameTextBox.Text;

            Boolean toAllowUpdate = true;

            // Checking for existing email
            if (userEmailAddress != emailAddress)
            {
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
                            toAllowUpdate = false;
                        }
                        // Displaying of Username validation
                        if (toAllowUpdate == true)
                        {
                            EmailValidateLabel.Text = "";
                        }
                        else
                        {
                            EmailValidateLabel.Text = "Email Address is not available.";
                        }
                    }
                }
                toAllowUpdate = true;
            }

            // Checking for existing phone
            if (userPhoneNumber != phoneNumber)
            {
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
                            toAllowUpdate = false;
                        }
                        // Displaying of Username validation
                        if (toAllowUpdate == true)
                        {
                            PhoneValidateLabel.Text = "";
                        }
                        else
                        {
                            PhoneValidateLabel.Text = "Phone Number is not available.";
                        }
                    }
                }
            }

            string oldPassword = OldPasswordTextBox.Text;
            string newPassword = NewPasswordTextBox.Text;
            string confirmNewPassword = ConfirmNewPasswordTextBox.Text;
            string saltStringP = null;

            if (oldPassword != "")
            {
                // Retrieve Password from database
                string passwordDatabase = null;
                string saltDatabase = null;
                string query5 = "SELECT passWord, saltStringP FROM mwn.account WHERE userName=@1";
                using (MySqlConnection conn = DBConnector.getConnection())
                {
                    conn.Open();
                    using (MySqlCommand command = new MySqlCommand(query5, conn))
                    {
                        command.Parameters.Add(new MySqlParameter("1", User.Identity.Name));
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

                    using (var deriveBytes = new Rfc2898DeriveBytes(oldPassword, salt))
                    {
                        byte[] newKey = deriveBytes.GetBytes(20);  // derive a 20-byte key

                        if (!newKey.SequenceEqual(key))
                        {
                            toAllowUpdate = false;
                            OldPasswordValidateLabel.Text = "Invalid password! Please re-enter.";
                        }
                        else
                        {
                            OldPasswordValidateLabel.Text = "";
                            if (newPassword != "" || confirmNewPassword != "")
                            {
                                // Checking for password & confirm password
                                if (newPassword == confirmNewPassword)
                                {
                                    // specify that we want to randomly generate a 20-byte salt for password
                                    using (var deriveBytes3 = new Rfc2898DeriveBytes(newPassword, 20))
                                    {
                                        byte[] salt3 = deriveBytes3.Salt;
                                        byte[] key3 = deriveBytes3.GetBytes(20);  // derive a 20-byte key

                                        //converting to hexidecimal string 
                                        saltStringP = ByteArrayToString(salt3);
                                        newPassword = ByteArrayToString(key3);
                                    }
                                    toAllowUpdate = true;
                                }
                                else
                                {
                                    // Displaying of Password validation
                                    NewPasswordValidateLabel.Text = "Password mismatch. Please re-enter.";
                                    toAllowUpdate = false;
                                }
                            }
                            else if (newPassword == "" || confirmNewPassword == "")
                            {
                                // Displaying of Password validation
                                NewPasswordValidateLabel.Text = "Please enter your new password.";
                                toAllowUpdate = false;
                            }
                        }
                    }
                }
            }

            // Retrieve security ans
            string securityAnsDatabase = null;
            string saltDatabase2 = null;
            string query2 = "SELECT securityAns, saltStringA FROM mwn.account WHERE userName=@1";
            using (MySqlConnection conn = DBConnector.getConnection())
            {
                conn.Open();
                using (MySqlCommand command = new MySqlCommand(query2, conn))
                {
                    command.Parameters.Add(new MySqlParameter("1", User.Identity.Name));
                    MySqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        // SecurityAns retrieved
                        securityAnsDatabase = reader["securityAns"].ToString();
                        saltDatabase2 = reader["saltStringA"].ToString();
                    }
                }
            }

            byte[] key2 = StringToByteArray(securityAnsDatabase);
            byte[] salt2 = StringToByteArray(saltDatabase2);

            using (var deriveBytes = new Rfc2898DeriveBytes(securityAns, salt2))
            {
                byte[] newKey = deriveBytes.GetBytes(20);  // derive a 20-byte key

                // Comparing Security Answer
                if (newKey.SequenceEqual(key2))
                {
                    SecurityAnsValidateLabel.Text = "";

                    if (toAllowUpdate == true)
                    {
                        if (oldPassword != "")
                        {
                            // Update Profile
                            string query33 = "UPDATE mwn.account SET firstName=@1, lastName=@2, emailAddress=@3, phoneNumber=@4, passWord=@5, saltStringP=@6 WHERE userName=@7";
                            using (MySqlConnection conn = DBConnector.getConnection())
                            {
                                conn.Open();
                                using (MySqlCommand command = new MySqlCommand(query33, conn))
                                {
                                    command.Parameters.Add(new MySqlParameter("1", firstName));
                                    command.Parameters.Add(new MySqlParameter("2", lastName));
                                    command.Parameters.Add(new MySqlParameter("3", emailAddress));
                                    command.Parameters.Add(new MySqlParameter("4", phoneNumber));
                                    command.Parameters.Add(new MySqlParameter("5", newPassword));
                                    command.Parameters.Add(new MySqlParameter("6", saltStringP));
                                    command.Parameters.Add(new MySqlParameter("7", User.Identity.Name));
                                    command.ExecuteNonQuery();
                                }
                            }
                        }
                        else
                        {
                            // Update Profile
                            string query33 = "UPDATE mwn.account SET firstName=@1, lastName=@2, emailAddress=@3, phoneNumber=@4 WHERE userName=@5";
                            using (MySqlConnection conn = DBConnector.getConnection())
                            {
                                conn.Open();
                                using (MySqlCommand command = new MySqlCommand(query33, conn))
                                {
                                    command.Parameters.Add(new MySqlParameter("1", firstName));
                                    command.Parameters.Add(new MySqlParameter("2", lastName));
                                    command.Parameters.Add(new MySqlParameter("3", emailAddress));
                                    command.Parameters.Add(new MySqlParameter("4", phoneNumber));
                                    command.Parameters.Add(new MySqlParameter("5", User.Identity.Name));
                                    command.ExecuteNonQuery();
                                }
                            }
                        }

                        // Before Redirecting to Manage Profile page
                        string query4 = "UPDATE mwn.fromTo SET fromToList=@1, fromWhere=@2 WHERE idFromTo = 1";
                        using (MySqlConnection conn = DBConnector.getConnection())
                        {
                            conn.Open();
                            using (MySqlCommand command = new MySqlCommand(query4, conn))
                            {
                                command.Parameters.Add(new MySqlParameter("1", "Show"));
                                command.Parameters.Add(new MySqlParameter("2", "EditProfile"));
                                command.ExecuteNonQuery();
                            }
                        }
                        // Redirecting to Manage Profile page
                        Response.Redirect("ManageProfile.aspx");
                    }
                }
                else
                {
                    SecurityAnsValidateLabel.Text = "Invalid Security Answer. Please re-enter.";
                }
            }
        }
    }
}