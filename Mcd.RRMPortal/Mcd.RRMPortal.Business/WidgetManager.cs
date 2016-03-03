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
        public void GetStoreProfiles()
        {
            var listStoreProfiles = new List<StoreProfile>() {
            new StoreProfile(){DataValue ="asdfsdfaf ",Description = "asdfdsaf", LastChangedOn = "dfasdfds", LastDataCollection = "asdfsdafsf"},
            new StoreProfile(){DataValue ="asdfsdfaf ",Description = "asdfdsaf", LastChangedOn = "dfasdfds", LastDataCollection = "asdfsdafsf"},
            new StoreProfile(){DataValue ="asdfsdfaf ",Description = "asdfdsaf", LastChangedOn = "dfasdfds", LastDataCollection = "asdfsdafsf"},
            new StoreProfile(){DataValue ="asdfsdfaf ",Description = "asdfdsaf", LastChangedOn = "dfasdfds", LastDataCollection = "asdfsdafsf"},
            new StoreProfile(){DataValue ="asdfsdfaf ",Description = "asdfdsaf", LastChangedOn = "dfasdfds", LastDataCollection = "asdfsdafsf"}
        };
    }
}
