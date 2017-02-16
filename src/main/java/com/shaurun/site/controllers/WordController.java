package com.shaurun.site.controllers;

import com.shaurun.site.model.Lesson;
import com.shaurun.site.model.Topic;
import com.shaurun.site.model.Word;
import com.shaurun.site.services.LessonService;
import com.shaurun.site.services.SubjectService;
import com.shaurun.site.services.TopicSetvice;
import com.shaurun.site.services.WordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Collection;
import java.util.Collections;
import java.util.List;

@Controller
public class WordController {
    private SubjectService subjectService;
    private LessonService lessonService;
    private TopicSetvice topicSetvice;
    private WordService wordService;

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
    public void setTopicSetvice(TopicSetvice topicSetvice) {
        this.topicSetvice = topicSetvice;
    }

    @Autowired(required = true)
    @Qualifier(value = "wordService")
    public void setWordService(WordService wordService) {
        this.wordService = wordService;
    }

    @RequestMapping(value = "/lesson/{lessonId}", method = RequestMethod.GET)
    public String listLessonWords(Model model, @PathVariable("lessonId") long lessonId) {
        Lesson lesson = lessonService.getLessonById(lessonId);
        model.addAttribute("lesson", lesson); //adding lesson just to know in what lesson we are
        List<Word> wordsList = wordService.listLessonWords(lesson);
        model.addAttribute("listWords", wordsList); //list of words under specified lesson
        List<String> topicNames = Collections.EMPTY_LIST;
        List<Topic> topics = subjectService.listSubjectTopics(lesson.getSubject().getId());
        model.addAttribute("listTopics", //list of available topics for user
                subjectService.listSubjectTopics(lesson.getSubject().getId()));
        model.addAttribute("word", new Word()); //new word to add
        return "lesson";
    }

    @RequestMapping(value = "/lesson/{lessonId}/addWord", method = RequestMethod.POST)
    public String addSubject(Model model, @ModelAttribute("word") Word word, @PathVariable("lessonId") long lessonId){
        Lesson lesson = lessonService.getLessonById(lessonId);
        word.setLesson(lesson);
        if (word.getId() == 0l){
            wordService.add(word);
        } else {
            wordService.edit(word);
        }
        return "redirect:/lesson/"+lessonId;
    }


}
