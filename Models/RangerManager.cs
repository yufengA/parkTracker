using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SEP_ASS3.Models
{
    public class RangerManager
    {
        private static string SAREMAILADDRESS = "";
        public static park_ranger FindRanger(int ID)
        {
            return RangerDAO.FindRanger(ID);
        }

        public static List<visitor> GetAllVisitor()
        {
            return VisitorDAO.GetAllVisitor();
        }

        public static List<visitor> GetOverdueVisitor()
        {
            return VisitorDAO.GetOverdueVisitor();
        }

        //monitor visitor 
        public static void MonitorVisitor()
        {
            List<visitor> ReportingVisitors = new List<visitor>();

            foreach (visitor V in VisitorDAO.GetTravellingVisitor())
            {
                //get visitors from database and check if they are overdue if yes change status
                if (DateTime.Compare(DateTime.Now, Convert.ToDateTime(V.group_visitor.endTime.ToString())) > 0)
                {
                    if (V.isoverdue == false)
                    {
                        V.isoverdue = true;
                        foreach (visitor_track V_T in V.group_visitor.visitor_track)
                            V_T.track.overdueTime = V_T.track.overdueTime + 1;
                    }

                    TimeSpan ExpiredTime = DateTime.Now.Subtract(Convert.ToDateTime(V.group_visitor.endTime));
                    // if overdue time is longer than 1 hour add to reporting visitor
                    if (ExpiredTime.Hours > 0 && V.mailSent == false)
                    {                       
                        V.mailSent = true;
                        ReportingVisitors.Add(V);
                    }
                }
            }
           
            if(ReportingVisitors.Count>0)
            {// if reporting visitors is not empty then send to SAR
                try
                {
                    MailService.SendEmail("Overdue Visitor!", SAREMAILADDRESS, FormatVisitors(ReportingVisitors));
                }
                catch (Exception e)
                {
                    MailService.SendEmail("Email Sent Failed!", "", "email sent failed to "+SAREMAILADDRESS);
                }
                    ReportingVisitors.Clear();
            } 
            VisitorDAO.SaveChanges();
        }



        //proccessing a list of visitor information to a email content
        private static string FormatVisitors(List<visitor> Visitors)
        {
            List<group_visitor> Groups = new List<group_visitor>();
            foreach (visitor V in Visitors)
            {
                if (!Groups.Contains(V.group_visitor))
                    Groups.Add(V.group_visitor);
            }
            string Content = "Here are the overdue group information:\n\n";
            foreach (group_visitor group in Groups)
            {
                Content += "Group Members: ";
                foreach(visitor V in group.visitor)
                    Content+=V.firstName +" "+V.lastName+",";
                Content += "\nTheir planned tracks are:\n";
                foreach (visitor_track v_t in group.visitor_track)
                    Content += "From " +v_t.track.startPoint+" To "+v_t.track.destination+"\n\n";
            }
            return Content;
        }

        // send a group information who are overdue sar
        public static void SendReportToSAR(string GroupID)
        {
           group_visitor Group = VisitorDAO.GetGroup(GroupID);
           MailService.SendEmail("Overdue Visitor!", SAREMAILADDRESS, FormatVisitors(Group.visitor.ToList()));
           foreach (visitor V in Group.visitor) 
               V.mailSent = true;
           VisitorDAO.SaveChanges();
        }

        //change the sar email address
        public static void SetSAREmailAddress(string SAREmailAddress)
        {
           SAREMAILADDRESS = SAREmailAddress;
           MonitorVisitor();
        }

        public static List<track> GetTracks()
        {
            return TrackDAO.GetAllTracks();
        }
    }
}