package com.shaurun.site.services;

import com.shaurun.site.model.News;

import java.util.List;

/**
 * Created by Shaurun on 07.02.2017.
 */
public interface NewsService {
    void addNews(News news);

    void edit(News news);

    void delete(long id);

    News getNewsById(long id);

    List<News> listNews();
}
