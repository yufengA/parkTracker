using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SEP_ASS3.Models
{
    public class BaseDao
    {
        static protected sepEntities2 Context = new sepEntities2();
        //commiting to database
        public static void SaveChanges()
        {
            Context.SaveChanges();
        }
    }
}