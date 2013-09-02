using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SEP_ASS3.Models
{
    public class TrackDAO : BaseDao
    {
        //list all the tracks from database
        public static List<track> GetAllTracks()
        {
            var Result =  from tr in Context.track
                          select tr;
            List<track> tracks = new List<track>();
            foreach(track T in Result)
                tracks.Add(T);
            return tracks;
        }
        //list all the tracks where starts from StartPoint
        public static List<track> GetTracks(string StartPoint)
        {
            var Result = from tr in Context.track
                         where tr.startPoint == StartPoint
                         select tr;
            List<track> tracks = new List<track>();
            foreach (track T in Result)
                tracks.Add(T);
            return tracks;
        }
        //return a track from datbase based on ID
        public static track GetTrack(int ID)
        {
          var Result = from tr in Context.track
                         where tr.ID == ID
                         select tr;
            return Result.ToList()[0];
        }
        //increase the visited track by 1 
        public static void TrackVisited(int ID)
        {
            var Result = from tr in Context.track
                         where tr.ID == ID
                         select tr;
            Result.ToList()[0].visitedTime = Result.ToList()[0].visitedTime + 1;
        }

    }
}