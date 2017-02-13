package com.shaurun.site.dao;

import com.shaurun.site.model.Lesson;
import com.shaurun.site.model.Subject;
import com.shaurun.site.model.User;

import java.util.List;

public interface LessonDao {
    void add(Lesson lesson);

    void edit(Lesson lesson);

    void delete(long id);

    Lesson getLessonById(long id);

    List<Lesson> listLessons();

    List<Lesson> listUserLessons(User user);

    Subject getLessonSubject(Lesson lesson);
}
