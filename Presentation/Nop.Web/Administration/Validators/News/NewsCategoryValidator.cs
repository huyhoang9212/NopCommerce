using FluentValidation;
using Nop.Admin.Models.News;
using Nop.Core.Domain.News;
using Nop.Data;
using Nop.Services.Localization;
using Nop.Web.Framework.Validators;

namespace Nop.Admin.Validators.News
{
    public partial class NewsCategoryValidator : BaseNopValidator<NewsCategoryModel>
    {
        public NewsCategoryValidator(ILocalizationService localizationService, IDbContext dbContext)
        {
            RuleFor(x => x.Title).NotEmpty().WithMessage(localizationService.GetResource("Admin.ContentManagement.News.NewsItems.Fields.Title.Required"));

            SetStringPropertiesMaxLength<NewsCategory>(dbContext);
        }
    }
}