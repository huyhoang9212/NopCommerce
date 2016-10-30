using Nop.Web.Framework.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Nop.Web.Models.News
{
    public class NewsCategorySimpleModel : BaseNopEntityModel
    {
        public NewsCategorySimpleModel()
        {
            SubNewsCategories = new List<NewsCategorySimpleModel>();
        }

        public string  Name { get; set; }

        public string  SeName { get; set; }

        public int? NumberOfNewsItems { get; set; }

        public bool IncludeInTopMenu { get; set; }

        public List<NewsCategorySimpleModel> SubNewsCategories { get; set; }
    }
}