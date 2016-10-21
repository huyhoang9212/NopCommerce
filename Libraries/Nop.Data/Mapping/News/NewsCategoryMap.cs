using Nop.Core.Domain.News;

namespace Nop.Data.Mapping.News
{
    public partial class NewsCategoryMap : NopEntityTypeConfiguration<NewsCategory>
    {
        public NewsCategoryMap()
        {
            this.ToTable("NewsCategory");
            this.HasKey(ni => ni.Id);
            this.Property(ni => ni.Title).IsRequired();

            this.HasRequired(ni => ni.Language)
                .WithMany()
                .HasForeignKey(ni => ni.LanguageId).WillCascadeOnDelete(true);
        }
    }
}