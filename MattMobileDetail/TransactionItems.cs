using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MattMobileDetail
{
    public class TransactionItem
    {
        public String ID { get; set; }
        public String Name { get; set; }
        public String ItemType { get; set; }
        public int Quantity { get; set; }
        public float UnitPrice { get; set; }

        public TransactionItem(String Id, String Name, String ItemType, int Quantity)
        {
            this.ID = Id;
            this.Name = Name;
            this.ItemType = ItemType;
            this.Quantity = Quantity;
            UnitPrice = 10;
        }

    }
}