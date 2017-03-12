package com.shaurun.site.controllers;

import com.shaurun.site.model.Topic;
import com.shaurun.site.model.Word;
import com.shaurun.site.services.TopicService;
import com.shaurun.site.services.WordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class TopicController {
    private TopicService topicService;
    private WordService wordService;

    @Autowired
    @Qualifier(value = "topicService")
    public void setTopicService(TopicService topicService) {
        this.topicService = topicService;
    }

    @Autowired(required = true)
    @Qualifier(value = "wordService")
    public void setWordService(WordService wordService) {
        this.wordService = wordService;
    }

    @RequestMapping(value = "/topic/{topicId}", method = RequestMethod.GET)
    public String listTopicWords(Model model, @PathVariable("topicId") long topicId) {
        Topic topic = topicService.getTopicById(topicId);
        model.addAttribute("subject", topic.getSubject());
        model.addAttribute("topic", topic); //adding lesson just to know in what lesson we are
        List<Word> wordsList = wordService.listTopicWords(topic);
        model.addAttribute("listWords", wordsList); //list of words under specified lesson
        return "topic";
    }
}
