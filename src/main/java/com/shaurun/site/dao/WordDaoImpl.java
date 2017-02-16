package com.shaurun.site.dao;

import com.shaurun.site.model.Lesson;
import com.shaurun.site.model.Topic;
import com.shaurun.site.model.Word;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class WordDaoImpl implements WordDao{
    private static final Logger LOG = LogManager.getLogger();

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void add(Word word) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(word);
        LOG.debug("Saved new word: {}", word.toString());
    }

    @Override
    public void edit(Word word) {
        Session session = sessionFactory.getCurrentSession();
        session.update(word);
        LOG.debug("Updated word: {}", word.toString());
    }

    @Override
    public void delete(long id) {
        Session session = sessionFactory.getCurrentSession();
        Word word = (Word) session.get(Word.class, new Long(id));
        if (word != null){
            session.delete(word);
            LOG.debug("Deleted word", word.toString());
        } else {
            LOG.debug("Request to delete word {} was declined. No word with id {} was found in database",
                    word.toString(), word.getId());
        }
    }

    @Override
    public Word getWordById(long id) {
        Session session = sessionFactory.getCurrentSession();
        Word word = (Word) session.get(Word.class, new Long(id));
        LOG.debug("Word found by id {}: {}", id, word.toString());
        return word;
    }

    @Override
    public List<Word> listWords() {
        Session session = sessionFactory.getCurrentSession();
        List<Word> wordsList = session.createQuery("FROM Word").list();
        LOG.debug("Words list: {}", wordsList.toString());
        return wordsList;
    }

    @Override
    public List<Word> listLessonWords(Lesson lesson) {
        Session session = sessionFactory.getCurrentSession();
        List<Word> wordsList = session.createQuery("FROM Word w WHERE w.lesson = :lesson")
                .setParameter("lesson", lesson)
                .list();
        LOG.debug("Words list: {}", wordsList.toString());
        return wordsList;
    }

    @Override
    public List<Word> listTopicWords(Topic topic) {
        Session session = sessionFactory.getCurrentSession();
        List<Word> wordsList = session.createQuery("FROM Word w WHERE w.topic = :topic")
                .setParameter("topic", topic)
                .list();
        LOG.debug("Words list: {}", wordsList.toString());
        return wordsList;
    }
}
