using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SEP_ASS3.Models
{
    public class VisitorManager
    {
        //creat visitor information to be store to database
        public static void VisitorSignin(List<visitor> Visitors,List<int> TrackIDs,int Duration)
        {
            group_visitor Gv = new group_visitor();
            Gv.group_id = Guid.NewGuid().ToString();
            DateTime StartTime = DateTime.Now;
            Gv.duration = Duration;          
            Gv.startTime = StartTime ;
            Gv.endTime = StartTime.AddHours(Duration);

            foreach (visitor V in Visitors)
            {
                V.mailSent = false;
                V.ID = Guid.NewGuid().ToString();
                V.group_visitor = Gv;
            }

            foreach(int ID in TrackIDs){
                visitor_track vt = new visitor_track();
                TrackDAO.TrackVisited(ID);
                vt.track_ID = ID;
                vt.group_visitor = Gv;
            }
            VisitorDAO.SaveGroup(Gv);
            VisitorDAO.SaveChanges();
               
        }

        public static List<track> GetAllTracks()
        {
            return TrackDAO.GetAllTracks();
        }

       
        public static List<track> GetFollowingTracks(int SourceID)
        {
           track tr =  TrackDAO.GetTrack(SourceID);
           return TrackDAO.GetTracks(tr.destination);
        }

        //signout group if succeed return true and change status to signout otherwise return false
        public static Boolean SignOutGroup(string FirstName, string LastName, string PhoneNumber, DateTime dob)
        {
            
               visitor FoundVisitor = VisitorDAO.GetVisitor(FirstName, LastName, PhoneNumber, dob);
               if (FoundVisitor == null)
                   return false;
               else
               {
                   FoundVisitor.signedOut = true;
                   foreach (visitor V in FoundVisitor.group_visitor.visitor)
                   {
                       V.signedOut = true;
                   }
                   VisitorDAO.SaveChanges();
                   return true;
               }
            
        }

        //list all the visitors based on page number
        public static List<visitor> GetAllVisitors()
        {         
               return VisitorDAO.GetAllVisitor();
        }

        //conver tracks list to xml 
        public static string ConvertToXml(List<track> tracks)
        {
            string XmlResult =  "<?xml version= \"1.0\"?>\n<tracks>";
            foreach (track T in tracks)
            {
                XmlResult += "<track>";
                XmlResult += "<ID>" + T.ID+ "</ID>";
                XmlResult += "<startPoint>" + T.startPoint + "</startPoint>";
                XmlResult += "<destination>" + T.destination + "</destination>";
                XmlResult += "<visitedTime>" + T.visitedTime + "</visitedTime>";
                XmlResult += "<overdueTime>" + T.overdueTime + "</overdueTime>";
                XmlResult += "<duration>" + T.duration + "</duration>";
                XmlResult += "</track>";
            }
                XmlResult += "</tracks>";
            return XmlResult;
        }

    }
}