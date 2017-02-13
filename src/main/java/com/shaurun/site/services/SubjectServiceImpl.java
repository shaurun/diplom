package com.shaurun.site.services;

import com.shaurun.site.dao.SubjectDao;
import com.shaurun.site.model.Lesson;
import com.shaurun.site.model.Subject;
import com.shaurun.site.model.Topic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class SubjectServiceImpl implements SubjectService {
    private SubjectDao subjectDao;

    @Autowired(required = true)
    @Qualifier(value = "subjectDao")
    public void setSubjectDao(SubjectDao subjectDao) {
        this.subjectDao = subjectDao;
    }

    @Override
    @Transactional
    public void addSubject(Subject subject) {
        subjectDao.addSubject(subject);
    }

    @Override
    @Transactional
    public void edit(Subject subject) {
        subjectDao.edit(subject);
    }

    @Override
    @Transactional
    public void delete(long id) {
        subjectDao.delete(id);
    }

    @Override
    @Transactional
    public Subject getSubjectById(long id) {
        return subjectDao.getSubjectById(id);
    }

    @Override
    @Transactional
    public List<Subject> listSubjects() {
        return subjectDao.listSubjects();
    }

    @Override
    @Transactional
    public List<Lesson> listSubjectLessons(long subjectId) {
        return subjectDao.listSubjectLessons(subjectId);
    }

    @Override
    @Transactional
    public List<Topic> listSubjectTopics(long subjectId) {
        return subjectDao.listSubjectTopics(subjectId);
    }
}
