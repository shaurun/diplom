package com.shaurun.site.controllers;

import com.shaurun.site.model.Lesson;
import com.shaurun.site.model.Subject;
import com.shaurun.site.services.LessonService;
import com.shaurun.site.services.SubjectService;
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

@Controller
public class LessonController {
    private LessonService lessonService;

    private SubjectService subjectService;

    @Autowired
    private UserService userService;

    @Autowired
    @Qualifier(value = "lessonService")
    public void setLessonService(LessonService lessonService) {
        this.lessonService = lessonService;
    }

    @Autowired
    @Qualifier(value = "subjectService")
    public void setSubjectService(SubjectService subjectService) {
        this.subjectService = subjectService;
    }

    /**
     * Shows all lessons under specified Subject
     * @param model
     * @return
     */
    @RequestMapping(value = "/subject/{subjectId}/lessons", method = RequestMethod.GET)
    public String listSubjectLessons(Model model, @PathVariable("subjectId") long subjectId) {
        Subject subject = subjectService.getSubjectById(subjectId);
        Lesson lesson = new Lesson();
        lesson.setSubject(subject);
        model.addAttribute("lesson", lesson);
        List<Lesson> lessonsList = subjectService.listSubjectLessons(subjectId);
        model.addAttribute("listLessons", lessonsList);
        return "/lessons";
    }

    @RequestMapping(value = "/subject/{subjectId}/lessons/add", method = RequestMethod.POST)
    public String addLesson(Model model, @ModelAttribute("lesson") Lesson lesson, @PathVariable("subjectId") long subjectId){
        if (lesson.getId() == 0l){
            lessonService.add(lesson);
        } else {
            lessonService.edit(lesson);
        }
        return "redirect:/subject/"+subjectId+"/lessons";
    }

   /*@RequestMapping(value = "/subject/{subjectId}/lessons/delete/{id}")
    public String deleteLesson(Model model, @PathVariable("subjectId") long subjectId, @PathVariable("id") long id) {
        lessonService.delete(id);
        return "redirect:/subject/"+subjectId+"/lessons";
    }

    @RequestMapping(value = "subject/{subjectId}/lessons/edit/{id}")
    public String editLesson(Model model, @PathVariable("subjectId") long subjectId, @PathVariable("id") long id) {
        Subject subject = subjectService.getSubjectById(subjectId);
        Lesson lesson = new Lesson();
        lesson.setSubject(subject);
        model.addAttribute("lesson", lesson);
        List<Lesson> lessonsList = subjectService.listSubjectLessons(subjectId);
        model.addAttribute("listLessons", lessonsList);
        return "/subject/"+subjectId+"/lessons";
    }*/
}
