using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SEP_ASS3.Models;
namespace SEP_ASS3.Controllers
{
    public class RangerController : Controller
    {
        //
        // GET: /Ranger/
        /**
         * responding url /Ranger
         * */
        public ActionResult Index()
        {
            if (Session["CurrentRanger"] == null)
                return View("Login");
            else
            {
                //if ranger is logged in then find out overdue visitors
                ViewData["Visitors"] = RangerManager.GetOverdueVisitor();
                return View();
            }
        }
        /**
         * responding url /Ranger/Logi
         * */
        public ActionResult Login(int RangerID,string password)
        {
            //find ranger and check password
           park_ranger FoundRanger = RangerManager.FindRanger(RangerID);
           if (FoundRanger != null && FoundRanger.password.Equals(password))
           {
               Session["CurrentRanger"] = FoundRanger;
               ViewData["Visitors"] = RangerManager.GetOverdueVisitor();
               return View("index");
           }
           else
           {
               ViewData["Error"] = "Unable to login, please check the information entered";
               return View("Login");
           }
           
        }
        /**
         * responding url Ranger/SendReport
         * */
        public void SendReport(string GroupID)
        {
            RangerManager.SendReportToSAR(GroupID);
            Response.Redirect("/Ranger");
        }
        /**
         * responding url Ranger/AllVisitors
         * */
        public ActionResult AllVisitors()
        {
            ViewData["Visitors"] = VisitorManager.GetAllVisitors();
            return View();
        }

        public ActionResult AllTracks()
        {
            ViewData["Tracks"] = RangerManager.GetTracks();
            return View();
        }

        /**
         * responding url SetSAREmailAddress
         * */
        public void SetSAREmailAddress(string SAREmailAddress)
        {
            RangerManager.SetSAREmailAddress(SAREmailAddress);
            Response.Redirect("/Ranger");
        }

    }
}
