package com.shaurun.site.controllers;

import com.shaurun.site.model.Lesson;
import com.shaurun.site.model.Topic;
import com.shaurun.site.model.Word;
import com.shaurun.site.services.LessonService;
import com.shaurun.site.services.SubjectService;
import com.shaurun.site.services.TopicService;
import com.shaurun.site.services.WordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Collections;
import java.util.List;
import java.util.Random;

@Controller
public class ExerciseController {
    private SubjectService subjectService;
    private LessonService lessonService;
    private TopicService topicService;
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
    public void setTopicService(TopicService topicService) {
        this.topicService = topicService;
    }

    @Autowired(required = true)
    @Qualifier(value = "wordService")
    public void setWordService(WordService wordService) {
        this.wordService = wordService;
    }

    /**
     * This method returns page with shuffled list of lesson words to be used in JS
     * @param model
     * @param lessonId
     * @return
     */
    @RequestMapping(value = "/exercises/lesson/{lessonId}", method = RequestMethod.GET)
    public String shuffleLessonWords(Model model, @PathVariable("lessonId") long lessonId) {
        Lesson lesson = lessonService.getLessonById(lessonId);
        model.addAttribute("subject", lesson.getSubject());
        model.addAttribute("lesson", lesson); //adding lesson just to know in what lesson we are
        //adding words
        List<Word> wordsList = wordService.listLessonWords(lesson);
        long seed = System.nanoTime();
        Collections.shuffle(wordsList, new Random(seed));
        model.addAttribute("listWords", wordsList); //list of words under specified lesson
        return "exercise";
    }


}
