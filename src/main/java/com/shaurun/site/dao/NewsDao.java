package com.shaurun.site.dao;

import com.shaurun.site.model.News;

import java.util.List;

public interface NewsDao {
    void addNews(News news);

    void edit(News news);

    void delete(long id);

    News getNewsById(long id);

    List<News> listNews();
}
