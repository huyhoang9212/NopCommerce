using System;
using System.Collections.Generic;
using System.Linq;
using Nop.Core;
using Nop.Core.Data;
using Nop.Core.Domain.Catalog;
using Nop.Core.Domain.News;
using Nop.Core.Domain.Stores;
using Nop.Services.Events;

namespace Nop.Services.News
{
    /// <summary>
    /// News service
    /// </summary>
    public partial class NewsCategoryService : INewsCategoryService
    {
        #region Fields

        private readonly IRepository<NewsItem> _newsItemRepository;
        private readonly IRepository<NewsComment> _newsCommentRepository;
        private readonly IRepository<StoreMapping> _storeMappingRepository;
        private readonly IRepository<NewsCategory> _newsCategoryRepository;

        private readonly CatalogSettings _catalogSettings;
        private readonly IEventPublisher _eventPublisher;

        #endregion

        #region Ctor

        public NewsCategoryService(IRepository<NewsItem> newsItemRepository, 
            IRepository<NewsComment> newsCommentRepository,
            IRepository<StoreMapping> storeMappingRepository,
            IRepository<NewsCategory> newsCategoryRepository,
            CatalogSettings catalogSettings,
            IEventPublisher eventPublisher)
        {
            this._newsItemRepository = newsItemRepository;
            this._newsCommentRepository = newsCommentRepository;
            this._storeMappingRepository = storeMappingRepository;
            this._newsCategoryRepository = newsCategoryRepository;
            this._catalogSettings = catalogSettings;
            this._eventPublisher = eventPublisher;
        }

        #endregion

       

        public void DeleteNewsCategory(NewsCategory newsItem)
        {
            if (newsItem == null)
                throw new ArgumentNullException("newsItem");

            _newsCategoryRepository.Delete(newsItem);

            //event notification
            _eventPublisher.EntityDeleted(newsItem);
        }

        public NewsCategory GetNewsCategoryById(int newsId)
        {
            if (newsId == 0)
                return null;

            return _newsCategoryRepository.GetById(newsId);
        }

        public IList<NewsCategory> GetNewsCategoryByIds(int[] newsIds)
        {
            var query = _newsCategoryRepository.Table;
            return query.Where(p => newsIds.Contains(p.Id)).ToList();
        }

        public IPagedList<NewsCategory> GetAllNewsCategory(int languageId = 0, int storeId = 0, int pageIndex = 0, int pageSize = int.MaxValue, bool showHidden = false)
        {
            var query = _newsCategoryRepository.Table;
            if (languageId > 0)
                query = query.Where(n => languageId == n.LanguageId);
         
            query = query.OrderByDescending(n => n.CreatedOnUtc);

            //Store mapping
            if (storeId > 0 && !_catalogSettings.IgnoreStoreLimitations)
            {
                query = from n in query
                        join sm in _storeMappingRepository.Table
                        on new { c1 = n.Id, c2 = "NewsItem" } equals new { c1 = sm.EntityId, c2 = sm.EntityName } into n_sm
                        from sm in n_sm.DefaultIfEmpty()
                        where !n.LimitedToStores || storeId == sm.StoreId
                        select n;

                //only distinct items (group by ID)
                query = from n in query
                        group n by n.Id
                        into nGroup
                        orderby nGroup.Key
                        select nGroup.FirstOrDefault();
                query = query.OrderByDescending(n => n.CreatedOnUtc);
            }

            var news = new PagedList<NewsCategory>(query, pageIndex, pageSize);
            return news;
        }

        public void InsertNewsCategory(NewsCategory news)
        {
            if (news == null)
                throw new ArgumentNullException("news");

            _newsCategoryRepository.Insert(news);

            //event notification
            _eventPublisher.EntityInserted(news);
        }

        public void UpdateNewsCategory(NewsCategory news)
        {
            if (news == null)
                throw new ArgumentNullException("news");

            _newsCategoryRepository.Update(news);

            //event notification
            _eventPublisher.EntityUpdated(news);
        }
       
    }
}
