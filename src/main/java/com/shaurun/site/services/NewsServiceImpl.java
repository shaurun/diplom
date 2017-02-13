package com.shaurun.site.services;

import com.shaurun.site.dao.NewsDao;
import com.shaurun.site.model.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class NewsServiceImpl implements NewsService {

    private NewsDao newsDao;

    @Autowired(required = true)
    @Qualifier(value = "newsDao")
    public void setNewsDao(NewsDao newsDao) {
        this.newsDao = newsDao;
    }

    @Override
    @Transactional
    public void addNews(News news) {
        newsDao.addNews(news);
    }

    @Override
    @Transactional
    public void edit(News news) {
        newsDao.edit(news);
    }

    @Override
    @Transactional
    public void delete(long id) {
        newsDao.delete(id);
    }

    @Override
    @Transactional
    public News getNewsById(long id) {
        return newsDao.getNewsById(id);
    }

    @Override
    @Transactional
    public List<News> listNews() {
        return newsDao.listNews();
    }
}
