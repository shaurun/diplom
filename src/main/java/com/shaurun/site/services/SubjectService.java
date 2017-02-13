package com.shaurun.site.services;

import com.shaurun.site.model.Lesson;
import com.shaurun.site.model.Subject;
import com.shaurun.site.model.Topic;

import java.util.List;

public interface SubjectService {
    void addSubject(Subject subject);

    void edit(Subject subject);

    void delete(long id);

    Subject getSubjectById(long id);

    List<Subject> listSubjects();

    List<Lesson> listSubjectLessons(long subjectId);

    List<Topic>  listSubjectTopics(long subjectId);
}
