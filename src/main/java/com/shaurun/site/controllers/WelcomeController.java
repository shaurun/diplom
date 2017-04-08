package com.shaurun.site.controllers;

import com.shaurun.site.model.News;
import com.shaurun.site.services.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Comparator;
import java.util.List;
import java.util.function.Predicate;

@Controller
public class WelcomeController {
    private NewsService newsService;

    @Autowired(required = true)
    @Qualifier(value = "newsService")
    public void setNewsService(NewsService newsService) {
        this.newsService = newsService;
    }

    @RequestMapping(value = {"/welcome", "/"}, method = RequestMethod.GET)
    public String listNews(Model model) {
        model.addAttribute("news", new News());
        List<News> newsList = newsService.listNews();
        newsList.removeIf(new Predicate<News>() {
            @Override
            public boolean test(News news) {
                return !news.getPublished();
            }
        });
        newsList.sort(new Comparator<News>() {
            @Override
            public int compare(News o1, News o2) {
                int dateCompare = o1.getDate().compareTo(o2.getDate())*-1;
                if (dateCompare == 0) {
                    return o1.getId() > o2.getId() ? -1 :
                            o1.getId() == o2.getId() ? 0 : 1;
                }
                return dateCompare;
            }
        });
        model.addAttribute("listNews", newsList);
        return "welcome";
    }

    @RequestMapping(value = {"/tutorial"}, method = RequestMethod.GET)
    public String tutorial(Model model) {
        return "tutorial";
    }
}
