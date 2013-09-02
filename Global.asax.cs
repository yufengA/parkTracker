using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using SEP_ASS3.Models;
using System.Threading;
namespace SEP_ASS3
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                "Default", // Route name
                "{controller}/{action}/{id}", // URL with parameters
                new { controller = "Home", action = "Index", id = UrlParameter.Optional }// Parameter defaults
            );

        }
        void Monitor()
        {
            while (true)
            {
                RangerManager.MonitorVisitor();
                Thread.CurrentThread.Join(1000 * 60 * 5);
            }
        }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            RegisterRoutes(RouteTable.Routes);
            Thread thread = new Thread(new ThreadStart(Monitor));
            thread.Start();
        }
    }
}