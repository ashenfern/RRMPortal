using Mcd.RRMPortal.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mcd.RRMPortal.Business
{
    public class WidgetManager
    {
        public List<StoreProfile> GetStoreProfiles()
        {
            var listStoreProfiles = new List<StoreProfile>() {
            new StoreProfile(){DataValue ="Waystation Presentation Build # ",Description = "61.7.6143.0114", LastChangedOn = "02/09/2016", LastDataCollection = "03/04/2016 04:25/LT"},
            new StoreProfile(){DataValue ="ISP Version # ",Description = "10.06.00.12", LastChangedOn = "06/24/2015", LastDataCollection = "03/04/2016 04:25/LT"},
            new StoreProfile(){DataValue ="Restaurant Builder",Description = "6.28.28", LastChangedOn = "01/26/2016", LastDataCollection = "03/04/2016 04:25/LT"},
            new StoreProfile(){DataValue ="McAfee VirusScan",Description = "8.8.04001", LastChangedOn = "08/10/2015", LastDataCollection = "03/03/2016 14:50/LT"},
            new StoreProfile(){DataValue ="Expected Device Count  ",Description = "4 - 4 - 4 - 0", LastChangedOn = "03/04/2016", LastDataCollection = "03/04/2016 04:25/LT"}
        };

            return listStoreProfiles;
        }
    }
}
