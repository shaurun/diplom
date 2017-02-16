package com.shaurun.site.services;

import com.shaurun.site.dao.WordDao;
import com.shaurun.site.model.Lesson;
import com.shaurun.site.model.Topic;
import com.shaurun.site.model.Word;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class WordServiceImpl implements WordService {
    private WordDao wordDao;

    @Autowired(required = true)
    @Qualifier(value = "wordDao")
    public void setWordDao(WordDao wordDao) {
        this.wordDao = wordDao;
    }

    @Override
    @Transactional
    public void add(Word word) {
        wordDao.add(word);
    }

    @Override
    @Transactional
    public void edit(Word word) {
        wordDao.edit(word);
    }

    @Override
    @Transactional
    public void delete(long id) {
        wordDao.delete(id);
    }

    @Override
    @Transactional
    public Word getWordById(long id) {
        return wordDao.getWordById(id);
    }

    @Override
    @Transactional
    public List<Word> listWords() {
        return wordDao.listWords();
    }

    @Override
    @Transactional
    public List<Word> listLessonWords(Lesson lesson) {
        return wordDao.listLessonWords(lesson);
    }

    @Override
    @Transactional
    public List<Word> listTopicWords(Topic topic) {
        return wordDao.listTopicWords(topic);
    }
}
