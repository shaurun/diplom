package com.shaurun.site.services;

import com.shaurun.site.dao.LessonDao;
import com.shaurun.site.model.Lesson;
import com.shaurun.site.model.Subject;
import com.shaurun.site.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class LessonServiceImpl implements LessonService {
    private LessonDao lessonDao;

    @Autowired(required = true)
    @Qualifier(value = "lessonDao")
    public void setLessonDao(LessonDao lessonDao){
        this.lessonDao = lessonDao;
    }

    @Override
    @Transactional
    public void add(Lesson lesson) {
        lessonDao.add(lesson);
    }

    @Override
    @Transactional
    public void edit(Lesson lesson) {
        lessonDao.edit(lesson);
    }

    @Override
    @Transactional
    public void delete(long id) {
        lessonDao.delete(id);
    }

    @Override
    @Transactional
    public Lesson getLessonById(long id) {
        return lessonDao.getLessonById(id);
    }

    @Override
    @Transactional
    public List<Lesson> listLessons() {
        return lessonDao.listLessons();
    }

    @Override
    @Transactional
    public List<Lesson> listUserLessons(User user) {
        return listUserLessons(user);
    }

    @Override
    @Transactional
    public Subject getLessonSubject(Lesson lesson) {
        return lessonDao.getLessonSubject(lesson);
    }
}
