package com.shaurun.site.controllers;

import com.shaurun.site.model.Lesson;
import com.shaurun.site.model.Subject;
import com.shaurun.site.model.Topic;
import com.shaurun.site.services.LessonService;
import com.shaurun.site.services.SubjectService;
import com.shaurun.site.services.TopicService;
import com.shaurun.site.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;
import java.util.function.Predicate;

@Controller
public class SubjectController {
    private SubjectService subjectService;
    private LessonService lessonService;
    private TopicService topicService;

    @Autowired
    private UserService userService;

    @Autowired(required = true)
    @Qualifier(value = "subjectService")
    public void setSubjectService(SubjectService subjectService) {
        this.subjectService = subjectService;
    }

    @Autowired(required = true)
    @Qualifier(value = "lessonService")
    public void setLessonService(LessonService lessonService) {
        this.lessonService = lessonService;
    }

    @Autowired(required = true)
    @Qualifier(value = "topicService")
    public void setTopicService(TopicService topicService) {
        this.topicService = topicService;
    }

    @RequestMapping(value = "/subjects", method = RequestMethod.GET)
    public String listSubjects(Model model) {
        List<Subject> subjectList = subjectService.listSubjects();
        User userDetails = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        com.shaurun.site.model.User user = userService.findByUsername(userDetails.getUsername());
        subjectList.removeIf(new Predicate<Subject>() {
            @Override
            public boolean test(Subject subject) {
                return subject.getUser().getId() != user.getId();
            }
        });
        model.addAttribute("listSubjects", subjectList);
        model.addAttribute("subject", new Subject());
        return "subjects";
    }

    @RequestMapping(value = "/subjects/add", method = RequestMethod.POST)
    public String addSubject(Model model, @ModelAttribute("subject") Subject subject){
        User userDetails = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        com.shaurun.site.model.User user = userService.findByUsername(userDetails.getUsername());
        subject.setUser(user);
        if (subject.getId() == 0l){
            subjectService.addSubject(subject);
        } else {
            Subject subjectInDB = subjectService.getSubjectById(subject.getId());
            subject.setLessons(subjectInDB.getLessons());
            subject.setTopics(subjectInDB.getTopics());
            subjectService.edit(subject);
        }
        return "redirect:/subjects";
    }

    @RequestMapping(value = "/subjects/delete/{id}")
    public String deleteSubject(Model model, @PathVariable("id") long id) {
        subjectService.delete(id);
        return "redirect:/subjects";
    }

    @RequestMapping(value = "/subjects/edit/{id}")
    public String editSubjects(Model model, @PathVariable("id") long id) {
        Subject subject = subjectService.getSubjectById(id);
        model.addAttribute("subject", subject);
        List<Subject> subjectList = subjectService.listSubjects();
        User userDetails = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        com.shaurun.site.model.User user = userService.findByUsername(userDetails.getUsername());
        subjectList.removeIf(new Predicate<Subject>() {
            @Override
            public boolean test(Subject subject) {
                return subject.getUser().getId() != user.getId();
            }
        });
        model.addAttribute("listSubjects", subjectList);
        return "subjects";
    }

    @RequestMapping(value = "subject/{id}")
    public String subjectInfo (Model model, @PathVariable("id") long id) {
        Subject subject = subjectService.getSubjectById(id);
        model.addAttribute("subject", subject);
        model.addAttribute("listLessons", subjectService.listSubjectLessons(id));
        model.addAttribute("lesson", new Lesson());
        model.addAttribute("listTopics", subjectService.listSubjectTopics(id));
        model.addAttribute("topic", new Topic());
        return "subject";
    }

    @RequestMapping(value = "/subject/{subjectId}/addLesson", method = RequestMethod.POST)
    public String addLesson(Model model, @ModelAttribute("lesson") Lesson lesson, @PathVariable("subjectId") long subjectId){
        lesson.setSubject(subjectService.getSubjectById(subjectId));
        if (lesson.getId() == 0l){
            lessonService.add(lesson);
        } else {
            Lesson lessonInDB = lessonService.getLessonById(lesson.getId());
            lesson.setWords(lessonInDB.getWords());
            lessonService.edit(lesson);
        }
        return "redirect:/subject/"+subjectId;
    }

    @RequestMapping(value = "subject/deleteLesson/{subjectId}-{id}")
    public String deleteLesson(Model model, @PathVariable("subjectId") long subjectId, @PathVariable("id") long id) {
        lessonService.delete(id);
        return "redirect:/subject/"+subjectId;
    }

    @RequestMapping(value = "subject/editLesson/{subjectId}-{id}")
    public String editLesson(Model model, @PathVariable("subjectId") long subjectId, @PathVariable("id") long id) {
        model.addAttribute("lesson", lessonService.getLessonById(id));
        List<Lesson> lessonsList = subjectService.listSubjectLessons(subjectId);
        model.addAttribute("listLessons", lessonsList);
        List<Topic> topicsList = subjectService.listSubjectTopics(subjectId);
        model.addAttribute("listTopics", topicsList);
        model.addAttribute("subject", subjectService.getSubjectById(subjectId));
        model.addAttribute("topic", new Topic());
        return "subject";
    }

    @RequestMapping(value = "/subject/{subjectId}/addTopic", method = RequestMethod.POST)
    public String addTopic(Model model, @ModelAttribute("topic") Topic topic, @PathVariable("subjectId") long subjectId){
        topic.setSubject(subjectService.getSubjectById(subjectId));
        if (topic.getId() == 0l){
            topicService.add(topic);
        } else {
            Topic topicInDB = topicService.getTopicById(topic.getId());
            topic.setWords(topicInDB.getWords());
            topicService.edit(topic);
        }
        return "redirect:/subject/"+subjectId;
    }

    @RequestMapping(value = "subject/deleteTopic/{subjectId}-{id}")
    public String deleteTopic(Model model, @PathVariable("subjectId") long subjectId, @PathVariable("id") long id) {
        topicService.delete(id);
        return "redirect:/subject/"+subjectId;
    }

    @RequestMapping(value = "subject/editTopic/{subjectId}-{id}")
    public String editTopic(Model model, @PathVariable("subjectId") long subjectId, @PathVariable("id") long id) {
        model.addAttribute("topic", topicService.getTopicById(id));
        List<Topic> topicsList = subjectService.listSubjectTopics(subjectId);
        model.addAttribute("listTopics", topicsList);
        List<Lesson> lessonsList = subjectService.listSubjectLessons(subjectId);
        model.addAttribute("listLessons", lessonsList);
        model.addAttribute("subject", subjectService.getSubjectById(subjectId));
        model.addAttribute("lesson", new Lesson());
        return "subject";
    }

}
