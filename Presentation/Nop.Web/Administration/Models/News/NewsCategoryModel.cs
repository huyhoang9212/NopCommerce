using Nop.Web.Framework.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Nop.Admin.Models.News
{
    public class NewsCategoryModel : BaseNopEntityModel
    {
        [Display(Name = "Category Title")]
        public string Title { get; set; }
    }
}