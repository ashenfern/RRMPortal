using Mcd.RRMPortal.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Mcd.RRMPortal.Business
{
    interface IWidgetManager
    {
        List<StoreProfile> GetStoreProfiles();
    }
}
