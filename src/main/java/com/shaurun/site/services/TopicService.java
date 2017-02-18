package com.shaurun.site.services;

import com.shaurun.site.model.Topic;

import java.util.List;

/**
 * Created by Shaurun on 13.02.2017.
 */
public interface TopicService {
    void add(Topic topic);

    void edit(Topic topic);

    void delete(long id);

    Topic getTopicById(long id);

    List<Topic> listTopics();
}
