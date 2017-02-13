package com.shaurun.site.controllers;

import com.shaurun.site.services.TopicSetvice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

@Controller
public class TopicController {
    private TopicSetvice topicSetvice;

    @Autowired
    @Qualifier(value = "topicService")
    public void setTopicSetvice(TopicSetvice topicSetvice) {
        this.topicSetvice = topicSetvice;
    }
}
