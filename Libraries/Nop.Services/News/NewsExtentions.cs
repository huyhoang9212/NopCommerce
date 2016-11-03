using Nop.Core.Domain.News;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Nop.Services.News
{
    public static class NewsExtentions
    {
        public static string  GetFormattedBreadCrump(this NewsCategory newsCategory,
            INewsCategoryService newsCategoryService, 
            string separator = ">>", int languageId = 0)
        {
            string result = "";
            var breadCrumbCategories = GetCategoriesBreadCrumb(newsCategory, newsCategoryService);
            for(var i = 0; i <= breadCrumbCategories.Count - 1; i++)
            {
                var categoryName = breadCrumbCategories[i].Name;
                result = string.IsNullOrEmpty(result)
                    ? categoryName
                    : string.Format("{0} {1} {2}", result, separator, categoryName);
            }
            return result;
        }
         
        public static IList<NewsCategory> GetCategoriesBreadCrumb(this NewsCategory category, 
            INewsCategoryService newscategoryService)
        {
            if (category == null)
                throw new ArgumentNullException("category");

            var result = new List<NewsCategory>();
            var alreadyAddToList = new List<int>();
            while(category != null
                && !alreadyAddToList.Contains(category.Id))
            {
                result.Add(category);
                alreadyAddToList.Add(category.Id);
                category = newscategoryService.GetNewsCategoryById(category.ParentCategoryId);
            }

            result.Reverse();

            return result;
        }
    }
}
