package com.shaurun.site.dao;

import com.shaurun.site.model.Topic;

import java.util.List;

public interface TopicDao {
    void add(Topic topic);

    void edit(Topic topic);

    void delete(long id);

    Topic getTopicById(long id);

    List<Topic> listTopics();
}
