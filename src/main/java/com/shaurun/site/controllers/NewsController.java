package com.shaurun.site.controllers;

import com.shaurun.site.model.News;
import com.shaurun.site.services.NewsService;
import com.shaurun.site.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Date;

@Controller
public class NewsController {
    private NewsService newsService;

    @Autowired(required = true)
    @Qualifier(value = "newsService")
    public void setNewsService(NewsService newsService) {
        this.newsService = newsService;
    }

    @RequestMapping(value = "/news", method = RequestMethod.GET)
    public String listNews(Model model) {
        model.addAttribute("news", new News());
        model.addAttribute("listNews", newsService.listNews());
        return "news";
    }

    @RequestMapping(value = "/news/add", method = RequestMethod.POST)
    public String addNews(Model model, @ModelAttribute("news") News news){
        news.setDate(new Date());
        if (news.getId() == 0l){
            newsService.addNews(news);
        } else {
            newsService.edit(news);
        }
        return "redirect:/news";
    }

    @RequestMapping(value = "/delete/{id}")
    public String deleteNews(Model model, @PathVariable("id") long id) {
        newsService.delete(id);
        return "redirect:/news";
    }

    @RequestMapping(value = "/edit/{id}")
    public String editNews(Model model, @PathVariable("id") long id) {
        model.addAttribute("news", newsService.getNewsById(id));
        model.addAttribute("listNews", newsService.listNews());
        return "news";
    }

    @RequestMapping(value = "newsData/{id}")
    public String newsData (Model model, @PathVariable("id") long id) {
        model.addAttribute("news", newsService.getNewsById(id));
        return "newsData";
    }
}
