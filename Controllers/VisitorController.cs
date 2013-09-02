using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SEP_ASS3.Models;
namespace SEP_ASS3.Controllers
{
    public class VisitorController : Controller
    {
        //
        // GET: /Visitor/

        public ActionResult Index()
        {
            Session.Clear();
            return View();
        }
        public ActionResult SignIn()
        {
            //if group selected then return to track page
            if (Request["visitor_num"] != null)
            {
                Session["VisitorGroup"] = null;
                Session["GroupNumber"] = Int32.Parse(Request["visitor_num"]);
                return View("Tracks");
            }
                // if tracks selected then starting sign in each person and 
                //record visitor track information
            else if (Request["track0"]!=null)
            {
                List<int> TrackIDS = new List<int>();
                Session["VisitorGroup"] = new List<visitor>();
                int i =0;
                while (Request["track"+i] != null)
                {
                    TrackIDS.Add(Int32.Parse(Request["track" + i]));
                    i++;
                }
                Session["VisitorTrackIDs"] = TrackIDS;
                Session["TotalDuration"] = Request["totalDuration"];
                return View();
            }
            else
            {
                    SignInEachVisitor();
                    return View();
            }  
            
        }
        public void FollowingTracks(int SourceID)
        {
            Response.ContentType = "text/xml";
            Response.Write(VisitorManager.ConvertToXml(VisitorManager.GetFollowingTracks(SourceID)));

        }
        public void AllTracks(string SourceID)
        {
            Response.ContentType = "text/xml";
            Response.Write(VisitorManager.ConvertToXml(VisitorManager.GetAllTracks()));
        }

/**
 * sign in each visitor and store them into the session
 * */
        private void SignInEachVisitor()
        {

            string FirstName = Request["firstName"];
            string LastName = Request["lastName"];
            string Email = Request["emailAddress"];
            string dob = Request["dob"];
            if (!Email.Equals("") && !LastName.Equals("") && !FirstName.Equals(""))
            {
                int groupNum = (int)Session["GroupNumber"];
                List<visitor> visitorGroup = (List<visitor>)Session["VisitorGroup"];
                visitor v = new visitor();
                v.lastName = LastName;
                v.firstName = FirstName;
                v.medicalDetails = Request["medicalDetails"];
                v.address = Request["address"];
                v.email = Email;
                v.contactNumber = Request["contactNumber"];
                v.dob = Convert.ToDateTime(dob);
                v.isoverdue = false;
                v.signedOut = false;
                visitorGroup.Add(v);
                groupNum--;
                Session["GroupNumber"] = groupNum;
                //if all visitors are signed then save to database and direct to home page
                if (groupNum == 0)
                {
                   VisitorManager.VisitorSignin(visitorGroup, (List<int>)Session["VisitorTrackIDs"], Convert.ToInt32(Session["TotalDuration"]));
                    Session.Remove("VisitorGroup");
                    Response.Redirect("/Visitor", true);
                }
            }
            else
                ViewData["Error"] = "Invalid Input";
        }
       /**
        * responding to url Visitor/SignOut
        * */
        public ActionResult SignOut()
        {
            //find visitor and compare with the details
            if (Request["firstName"] != null)
            {
                string FirstName = Request["firstName"];
                string LastName = Request["lastName"];
                DateTime dob = Convert.ToDateTime(Request["dob"]);
                string PhoneNumber = Request["phoneNumber"];
                if(VisitorManager.SignOutGroup(FirstName, LastName, PhoneNumber, dob))
                 return View("SignOutSucceed");
                else
                 return View("SignOutFailed");
            }
            else
            {
                return View();
            }
        }

    }
}
