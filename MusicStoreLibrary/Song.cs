using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;
using System.Data;

namespace MusicStoreLibrary
{
    public class Song
    {
        private int songID;
        private String song_title;
        private String music_artist;
        private String genre;
        private double cost;
        private int total_purchases;
        private string subscriptions;

        private String format;
        private int quantity;
        private double totalcost;

        public int SongID
        {
            get { return songID; }
            set { songID = value; }
        }

        public String SongTitle
        {
            get { return song_title; }
            set { song_title = value; }
        }

        public String MusicArtist
        {
            get { return music_artist; }
            set { music_artist = value; }
        }

        public String Genre
        {
            get { return genre; }
            set { genre = value; }
        }
       
        public double Cost
        {
            get { return cost; }
            set { cost = value; }
        }

        public int TotalPurchases
        {
            get { return total_purchases; }
            set { total_purchases = value; }
        }

        public String Format
        {
            get { return format; }
            set { format = value; }
        }

        public int Quantity
        {
            get { return quantity; }
            set { quantity = value; }
        }
        public double TotalCost
        {
            get { return totalcost; }
            set { totalcost = value; }
        }
        public String subscription
        {
            get { return subscriptions; }
            set { subscriptions = value; }
            
        }
       public Song(int songid, string songtitle, int Quantity, double cost, string Format,string subscription)
        {
            this.songID = songid;
            this.song_title = songtitle;
            this.quantity = Quantity;
            this.cost = cost;
            this.format = Format;
            

        }
    

    }
}
