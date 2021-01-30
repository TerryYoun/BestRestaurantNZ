using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BestRestaurantNZ
{
    public class BusinessLogicLayer
    {
        DbLayer db = null;

        public BusinessLogicLayer()
        {
            db = new DbLayer();
        }
        
    }
}