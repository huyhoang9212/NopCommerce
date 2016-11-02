using Nop.Web.Framework.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Nop.Admin.Models.News
{
    public partial class NewsCategoryListModel : BaseNopModel
    {
        public NewsCategoryListModel()
        {

        }

        [Display(Name = "News category name")]
        [AllowHtml]
        public string SearchCategoryName { get; set; }
    }
}