using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SEP_ASS3.Models
{
    public class VisitorDAO : BaseDao
    {
       
        //save a visitor to database
        public static void SaveVisitor(visitor v)
        {
            Context.AddObject("visitor", v);     
        }
        //save a visitor_track to datbase
        public static void SaveVisitor_Track(visitor_track v)
        {
            Context.AddObject("visitor_track", v);
        }

        // save a grop to database
        public static void SaveGroup(group_visitor g)
        {    
            Context.AddObject("group_visitor", g);
 
        }

        //find a visitor from database based on first name , last name, phone number and date of birth
        public static visitor GetVisitor(string FirstName, string LastName, string PhoneNumber, DateTime dob)
        {
            var result = from vr in Context.visitor
                         where vr.contactNumber == PhoneNumber && vr.dob == dob && vr.firstName == FirstName && vr.lastName == LastName && vr.signedOut == false
                         select vr;
            if (result.ToList().Count == 0)
                return null;
            else
             return result.ToList()[0];
        }
        //find a group from database
        public static group_visitor GetGroup(string ID)
        {
            var result = from gr in Context.group_visitor
                         where gr.group_id==ID
                         select gr;
            if (result.ToList().Count == 0)
                return null;
            else
            return result.ToList()[0];
        }

        //get all visitors from dabatase
        public static List<visitor> GetAllVisitor()
        {
            return (from v in Context.visitor
                   select v).ToList();
        }
        
        //get all visitors from database who are overdue
        public static List<visitor> GetOverdueVisitor()
        {
            return (from v in Context.visitor
                    where v.signedOut==false && v.isoverdue==true
                    select v).ToList();
        }

        //get all visitors from datbase who are not overdue
        public static List<visitor> GetTravellingVisitor()
        {
            return (from v in Context.visitor
                    where v.signedOut == false
                    select v).ToList();
        }

        //getting all groups 
        public static List<group_visitor> GetGroups()
        {
            return (from g in Context.group_visitor
                    select g).ToList();
        }

    }
}