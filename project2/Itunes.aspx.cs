using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;
using MusicStoreLibrary;
using System.Collections;
using System.Globalization;

namespace project2
{
    public partial class Itunes : System.Web.UI.Page
    {
        DBConnect dBConnect = new DBConnect();
        ArrayList arrsongs = new ArrayList();
        List<String> error = new List<string>();
        Calculations cal = new Calculations();

        int SongId;
        String title;
        String SongFormat;
        String subscriptions;
        double total = 0;

        int quantity = 0;
        double cost;
        const int months = 20;
        const int annualy = 200;
        private const int ZeroColumn = 0;
        private const int SecondColumn = 2;
        private const int FourthColumn = 4;
        int SongQuantity = 0;
        private String statsSelected = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                songdisplay.DataSource = dBConnect.GetDataSet("SELECT * FROM dbo.Songs");
                songdisplay.DataBind();
            }
        }

        protected void songssoldstatistics(object sender, EventArgs e)
        {
            statsSelected = songstatsdropdown.Text;
            if (songstatsdropdown.Text == "defaultstats")
            {
                SongStatistics.Visible = false;
                TotalSongsByGenre.Visible = false;
            }
            if (songstatsdropdown.Text == "songtitles")
            {
                SongStatistics.Visible = true;
                TotalSongsByGenre.Visible = false;
                SongStatistics.DataSource = dBConnect.GetDataSet("SELECT * FROM dbo.Songs ORDER BY TotalPurchases DESC");
                SongStatistics.DataBind();
            }

            if (songstatsdropdown.Text == "genre")
            {
                SongStatistics.Visible = false;
                TotalSongsByGenre.Visible = true;
                TotalSongsByGenre.DataSource = dBConnect.GetDataSet("SELECT Genre, SUM (TotalPurchases) FROM dbo.Songs GROUP BY Genre");
                TotalSongsByGenre.DataBind();

            }
        }
        public void updatequantity()
        {


        }
        public void updatesub()
        {
            DBConnect objdb = new DBConnect();
            string sub = plandropdown.Text;
            switch (sub)
            {
                case "monthly":
                    string command = "UPDATE dbo.PurchaseTypes SET MonthlyTotal = MonthlyTotal + '" + 1 + "'";
                    objdb.DoUpdate(command);
                    break;
                case "annual":
                    string command2 = "UPDATE dbo.PurchaseTypes SET AnnualTotal = AnnualTotal + '" + 1 + "'";
                    objdb.DoUpdate(command2);
                    break;
                case "one":
                    string command3 = "UPDATE dbo.PurchaseTypes SET OneTimePurchasesTotal =OneTimePurchasesTotal + '" + 1 + "'";
                    objdb.DoUpdate(command3);
                    break;
            }
        }

        public void usererror()
        {
            if (plandropdown.Text == "noplane")
            {
                error.Add("Select a Plane");
            }
            if (name.Text == "")
            {
                error.Add("Enter a Name");
            }
            if (address.Text == "")
            {
                error.Add("Enter a Address");
            }
            if (state.Text == "")
            {
                error.Add("Enter a State");
            }
            if (city.Text == "")
            {
                error.Add("Enter a City");
            }
            if (zip.Text == "")
            {
                error.Add("Enter a valid Zip Code");
            }
            if (phone.Text == "")
            {
                error.Add("Enter a valid Phone Number");
            }
            if (credit.Text == "")
            {
                error.Add("Enter a valid Credit Card Number");
            }
            
            if (month.Text == "month")
            {
                error.Add("Select a Month");
            }
            if (year.Text == "year")
            {
                error.Add("Select a Year");
            }
        }




        public void showuserdetail()
        {
            outputtable.Visible = true;
            lblname.Text = "Name: " + name.Text;
            lbladdress.Text = "Address: " + address.Text;
            lblcity.Text = "City: " + city.Text;
            lblstate.Text = "State: " + state.Text;
            lblzip.Text = "Zip Code: " + zip.Text;
            lblphone.Text = "Phone Number: " + phone.Text;
            lblcard.Text = "Credit Card: " + credit.Text;
            lblmonth.Text = "Month: " + month.Text;
            lblyear.Text = "Year: " + year.Text;
            lblpurchasetype.Text = "Purchase Typer: " + plandropdown.Text;
            Receipt.Visible = true;
        }
        public void controlsinvisible()
        {
            userinfo.Visible = false;
            Receipt.Visible = true;
            submit.Visible = false;
        }
        protected void viewsubscriptions(object sender, EventArgs e)
        {
            subscriptiontable.DataSource = dBConnect.GetDataSet("SELECT * FROM dbo.PurchaseTypes");
            subscriptiontable.DataBind();

        }

        public void checkerror()
        {
            foreach (GridViewRow row in songdisplay.Rows)
            {
                var checkbox = row.FindControl("songcheckbox") as CheckBox;
            }
        }
        protected void showstats(object sender, EventArgs e)
        {
            if (showstatsbtn.Text == "Show Statistics")
            {
                songstatsdropdown.Visible = true;
                showstatsbtn.Text = "Hide Statistics";
            }
            else
            {
                showstatsbtn.Text = "Show Statistics";
                songstatsdropdown.Visible = true;
                TotalSongsByGenre.Visible = true;
                songstatsdropdown.Text = "songtitles";

            }
        }




        protected void submit_Click(object sender, EventArgs e)
        {
            usererror();
            bool nbox = false;
            int countCheck = 0;

           
            subscriptions = plandropdown.Text;

            for (int row = 0; row < songdisplay.Rows.Count; row++)
            {
               
                CheckBox cbox;
                TextBox tbox;
                

                cbox = (CheckBox)songdisplay.Rows[row].FindControl("songcheckbox");
                if (cbox.Checked)
                {
                    nbox = true;

                    tbox = (TextBox)songdisplay.Rows[row].FindControl("quantitytextbox");
                    SongId = Convert.ToInt32(songdisplay.DataKeys[row].Values[0]);
                    title = songdisplay.Rows[row].Cells[1].Text;
                    quantity = Convert.ToInt32(tbox.Text);
                    SongQuantity += quantity;

                    cost = double.Parse(songdisplay.Rows[row].Cells[3].Text.Split('$')[1]);
                    SongFormat = ((DropDownList)songdisplay.Rows[row].FindControl("songformatdropdown")).Text;
                    double totalPrice = cal.TotalCost(cost, SongFormat, subscriptions);
                    Song song = new Song(SongId, title, quantity, totalPrice, SongFormat, subscriptions);
                    song.TotalCost = totalPrice * quantity;
                    total += song.TotalCost;
                    arrsongs.Add(song);
                    countCheck++;

                    
                    int subscription = 1;
                    if (plandropdown.Text.Equals("monthly"))
                    {
                        dBConnect.DoUpdate("UPDATE PurchaseTypes SET MonthlyTotal = MonthlyTotal + " + subscription.ToString());
                    }
                    else if (plandropdown.Text.Equals("one"))
                    {
                        dBConnect.DoUpdate("UPDATE PurchaseTypes SET OneTimePurchaseTotal = OneTimePurchaseTotal +  " + subscription.ToString());
                    }
                    else if (plandropdown.Text.Equals("annual"))
                    {
                        dBConnect.DoUpdate("UPDATE PurchaseTypes SET AunnalTotal = AunnalTotal + " + subscription.ToString());
                    }


                    Receipt.Columns[0].FooterText = "Total: ";
                    Receipt.Columns[SecondColumn].FooterText = quantity.ToString();
                    Receipt.Columns[FourthColumn].FooterText = "$" + total.ToString();
                    Receipt.DataSource = arrsongs;
                    Receipt.DataBind();
                    Receipt.Visible = true;
                    showuserdetail();
                    controlsinvisible();
                    updatesub();
                    usererror();

                    if (nbox == false)
                    {
                        Response.Write("Please select a song");
                        return;
                    }
                }
            }

        }
    }
}
