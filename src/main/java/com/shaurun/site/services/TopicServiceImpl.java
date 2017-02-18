package com.shaurun.site.services;

import com.shaurun.site.dao.TopicDao;
import com.shaurun.site.model.Topic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class TopicServiceImpl implements TopicService {
    private TopicDao topicDao;

    @Autowired(required = true)
    @Qualifier(value = "topicDao")
    public void setTopicDao(TopicDao topicDao){
        this.topicDao = topicDao;
    }

    @Override
    @Transactional
    public void add(Topic topic) {
        topicDao.add(topic);
    }

    @Override
    @Transactional
    public void edit(Topic topic) {
        topicDao.edit(topic);
    }

    @Override
    @Transactional
    public void delete(long id) {
        topicDao.delete(id);
    }

    @Override
    @Transactional
    public Topic getTopicById(long id) {
        return topicDao.getTopicById(id);
    }

    @Override
    @Transactional
    public List<Topic> listTopics() {
        return topicDao.listTopics();
    }
}
