package com.shaurun.site.dao;

import com.shaurun.site.model.News;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class NewsDaoImpl implements NewsDao {
    private static final Logger LOG = LogManager.getLogger();

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addNews(News news) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(news);
        LOG.debug("Saved news: {}", news.toString());
    }

    @Override
    public void edit(News news) {
        Session session = sessionFactory.getCurrentSession();
        session.update(news);
        LOG.debug("News {} were updated", news.toString());
    }

    @Override
    public void delete(long id) {
        Session session = sessionFactory.getCurrentSession();
        News news = (News) session.load(News.class, new Long(id));
        if (news != null){
            session.delete(news);
            LOG.debug("News {} were deleted", news.toString());
        } else {
            LOG.debug("Request to delete news {} was declined. No news with id {} were found in database",
                    news.toString(), news.getId());
        }
    }

    @Override
    public News getNewsById(long id) {
        Session session = sessionFactory.getCurrentSession();
        News news = (News) session.load(News.class, new Long(id));
        LOG.debug("News found by id {}: {}", news.getId(), news.toString());
        return news;
    }

    @Override
    public List<News> listNews() {
        Session session = sessionFactory.getCurrentSession();
        List<News> newsList = session.createQuery("FROM News").list();
        LOG.debug("News list: {}", newsList.toString());
        return newsList;
    }
}
