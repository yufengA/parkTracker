using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SEP_ASS3.Models
{
    public class RangerDAO : BaseDao
    {
        //search a ranger from database based on ID
        public static park_ranger FindRanger(int ID)
        {
            var Result = from pr in Context.park_ranger
                         where pr.ID == ID
                         select pr;
            if (Result.ToList().Count > 0)
                return Result.ToList()[0];
            else
                return null;
        }

    }
}