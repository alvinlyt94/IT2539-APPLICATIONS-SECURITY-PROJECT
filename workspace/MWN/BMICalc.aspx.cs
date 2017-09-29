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
    public partial class BMICalc : System.Web.UI.Page
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
                ValidateWeight.Visible = false;
                ValidateHeight.Visible = false;
                desc.Visible = false;
                GridView1.DataSource = Tables.getBmi(User.Identity.Name);
                GridView1.DataBind();
            }
        }

        protected void CalculateButton_Click(object sender, EventArgs e)
        {
            string wgString = wgTextBox.Text;
            string htString = htTextBox.Text;
            double wg = 0;
            double ht = 0;

            if (wgString != "" || htString != "")
            {
                // Convert string to int
                wg = Double.Parse(wgString);
                ht = Double.Parse(htString);
            }


            //SI value
            double h = (double)ht / 100;
            double si = Math.Round(((wg / (h * h))), 3);
            TextBox.Text = "" + si;
            double minWeight = Math.Round((18.5 * (h * h)), 3);
            double maxWeight = Math.Round((25 * (h * h)), 3);
            OptimalWeight.Text = minWeight + " - " + maxWeight;

            //If value is not given for weight
            if (wgString == "")
            {
                ValidateWeight.Visible = true;
                ValidateWeight.Text = "Please enter a weight.";
            }

            //If weight is less than 10
            else if (wg <= 10)
            {
                ValidateWeight.Visible = true;
                ValidateWeight.Text = "Weight should be greater than 10kg";
                TextBox.Text = "0";
            }
            else if (wg > 160)
            {
                ValidateWeight.Visible = true;
                ValidateWeight.Text = "Weight should be lesser than 160kg";
                TextBox.Text = "0";
            }
            else{
                ValidateWeight.Visible = false;
            }

                //If given height is less than 33cms
            if (ht < 33)
            {
                ValidateHeight.Visible = true;
                ValidateHeight.Text = "Height should be more than 33cm";
                TextBox.Text = "0";
            }
            else if (ht > 200)
            {
                ValidateHeight.Visible = true;
                ValidateHeight.Text = "Height should be lesser than 200cm";
                TextBox.Text = "0";
            }
            else
            {
                ValidateHeight.Visible = false;
            }
            double c = double.Parse(TextBox.Text);
            desc.Visible = true;
            if (c < 15)
            {
                desc.Text = "You are Severely Underweight";
            }
            else if (c > 15 && c <= 18.5)
            {
                desc.Text = "You are Underweight";
            }
            else if (c > 18.5 && c <= 25)
            {
                desc.Text = "You are Normal";
            }
            else if (c > 25 && c <= 30)
            {
                desc.Text = "You are Overweight";
            }
            else if (c > 30)
            {
                desc.Text = "You are Severely Overweight";
            }

            if (User.Identity.IsAuthenticated)
            {
                if (TextBox.Text != "0")
                {
                    string query3 = "INSERT INTO mwn.bmi(username,bmi,healthStatus,height,weight,optimalWeight,timeStamp) VALUES (@1, @2, @3, @4, @5, @6, NOW())";
                    using (MySqlConnection conn = DBConnector.getConnection())
                    {
                        conn.Open();
                        using (MySqlCommand command = new MySqlCommand(query3, conn))
                        {
                            command.Parameters.Add(new MySqlParameter("1", User.Identity.Name));
                            command.Parameters.Add(new MySqlParameter("2", si));
                            command.Parameters.Add(new MySqlParameter("3", desc.Text.Substring(8)));
                            command.Parameters.Add(new MySqlParameter("4", ht));
                            command.Parameters.Add(new MySqlParameter("5", wg));
                            command.Parameters.Add(new MySqlParameter("6", OptimalWeight.Text));

                            command.ExecuteNonQuery();
                        }
                    }
                    GridView1.DataSource = Tables.getBmi(User.Identity.Name);
                    GridView1.DataBind();
                }
            }
        }
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string message = e.Row.Cells[0].Text;
                foreach (Button button in e.Row.Cells[7].Controls.OfType<Button>())
                {
                    if (button.CommandName == "Delete")
                    {
                        button.Attributes["onclick"] = "if(!confirm('Do you want to delete this?')){ return false; };";
                    }
                }
            }
        }
        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            int bmiID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values["bmiID"].ToString());
            string query3 = "DELETE FROM mwn.bmi WHERE bmiID = @1";
            using (MySqlConnection conn = DBConnector.getConnection())
            {
                conn.Open();
                using (MySqlCommand command = new MySqlCommand(query3, conn))
                {
                    command.Parameters.Add(new MySqlParameter("1", bmiID));
                    command.ExecuteNonQuery();
                }
            }
            GridView1.DataSource = Tables.getBmi(User.Identity.Name);
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataSource = Tables.getBmi(User.Identity.Name);
            GridView1.DataBind();
        }

        protected void ClearButton_Click(object sender, EventArgs e)
        {
            wgTextBox.Text = "";
            htTextBox.Text = "";
            TextBox.Text = "";
            desc.Text = "";
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