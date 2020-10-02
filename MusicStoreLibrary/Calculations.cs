using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;
using System.Data;

namespace MusicStoreLibrary
{
    public class Calculations
    {
        DBConnect dbConnection = new DBConnect();

        public double calprice(int SongId, String Format, String subscription)
        {
            double price = 0.0;
            DataSet songdb = dbConnection.GetDataSet("SELECT * FROM Songs WHERE SongID = " + SongId);
            price = Convert.ToDouble(songdb.Tables[0].Rows[0]["Cost"]);
            price = TotalCost(price, Format, subscription);
            return price;
        }

        public double TotalCost(double price, string format, string subscriptions)
        {
           double cost = 0;

            switch (format)
            {
                case "vinyl":
                    cost = price + 2.10;
                    break;
                case "digital":
                    cost = price + 3.22;
                    break;
                case "stream":
                    cost = price + 2.00;
                    break;
            }
            double sub = 0;
            switch (subscriptions)
            {
                case "monthly":
                    sub = price / 10;
                    break;
                case "annual":
                    sub = price / 25;
                    break;
                case "one":
                    sub = cost;
                    break;
            }
            return cost;
        }


        
        public void updatesong(int SongId, int quantity, string SongFormat)
        {
           
            DataSet updatedata = dbConnection.GetDataSet("UPDATE db.Songs set TotalPurchase = TotalPurchase + " + quantity + "WHERE SongID= " + SongId);

        }
    }

  
}
