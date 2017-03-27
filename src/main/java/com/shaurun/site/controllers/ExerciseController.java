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
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;

import java.util.*;

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
     * This method returns page with exercise settings
     * @param model
     * @return
     */
    @RequestMapping(value = "{subjectId}/exercises", method = RequestMethod.GET)
    public String getExercisesSetup(Model model, @PathVariable("subjectId") long subjectId) {
        model.addAttribute("subject", subjectService.getSubjectById(subjectId));
        model.addAttribute("lessons", subjectService.listSubjectLessons(subjectId));
        model.addAttribute("topics", subjectService.listSubjectTopics(subjectId));
        return "exercises";
    }

    @RequestMapping(value = "/subject/{subjectId}/exercise", method = RequestMethod.GET)
    public String shuffleWords(Model model, @PathVariable("subjectId") long subjectId,
                               @RequestParam(value = "lesson", required = false) List<String> lessonIds,
                               @RequestParam(value = "topic", required = false) List<String> topicIds,
                               @RequestParam(value = "repeatable", required = false, defaultValue = "true") boolean repeatable,
                               @RequestParam(value = "quantity", required = false, defaultValue = "0") int quantity,
                               @RequestParam(value = "type", required = false, defaultValue = "1") int type)    {
        System.out.println("------------------------------");
        System.out.println(lessonIds);
        System.out.println(topicIds);
        System.out.println(repeatable);
        System.out.println(quantity);
        System.out.println(type);

        List<Word> words = new ArrayList<>();

        if (topicIds == null && lessonIds == null) { //do nothing
            return getExercisesSetup(model, subjectId);
        }

        if (topicIds != null) {
            for (String topicId : topicIds) {
                Topic topic = topicService.getTopicById(Long.parseLong(topicId));
                words.addAll(wordService.listTopicWords(topic));
            }
        }

        if (lessonIds != null) {
            for (String lessonId : lessonIds) {
                Lesson lesson = lessonService.getLessonById(Long.parseLong(lessonId));
                words.addAll(wordService.listLessonWords(lesson));
            }
        }

        if (!repeatable) {
            Set<Word> wordsSet = new HashSet<>();
            wordsSet.addAll(words);
            words = new ArrayList<>();
            words.addAll(wordsSet);
        }

        long seed = System.nanoTime();
        Random random = new Random(seed);
        Collections.shuffle(words, random);

        if (quantity > 0) {
            while (words.size()-quantity > 0) {
                words.remove(words.size()-1);
            }
            while (repeatable && words.size()-quantity < 0) {
                words.add(words.get(random.nextInt((words.size()))));
            }
        }

        if (type == 3) {
            model.addAttribute("mix", true);
        } else {
            model.addAttribute("mix", false);
        }

        if (type == 2) {
            model.addAttribute("inverse", true);
        } else {
            model.addAttribute("inverse", false);
        }
        model.addAttribute("listWords", words);

        return "exercise";
    }

    /**
     * This method returns page with shuffled list of lesson words to be used in JS
     * @param model
     * @param lessonId
     * @return
     */
    @RequestMapping(value = "/exercises/lesson/{lessonId}", method = RequestMethod.GET)
    public String shuffleLessonWords(Model model, @PathVariable("lessonId") long lessonId, String inverse) {
        Lesson lesson = lessonService.getLessonById(lessonId);
        model.addAttribute("subject", lesson.getSubject());
        model.addAttribute("lesson", lesson); //adding lesson just to know in what lesson we are
        //adding words
        List<Word> wordsList = wordService.listLessonWords(lesson);
        long seed = System.nanoTime();
        Collections.shuffle(wordsList, new Random(seed));
        model.addAttribute("listWords", wordsList); //list of words under specified lesson

        if (inverse != null) {
            model.addAttribute("inverse", true);
        }

        model.addAttribute("mix", false);
        return "exercise";
    }

    /**
     * This method returns page with shuffled list of topic words to be used in JS
     * @param model
     * @param topicId
     * @return
     */
    @RequestMapping(value = "/exercises/topic/{topicId}", method = RequestMethod.GET)
    public String shuffleTopicWords(Model model, @PathVariable("topicId") long topicId, String inverse) {
        Topic topic = topicService.getTopicById(topicId);
        model.addAttribute("subject", topic.getSubject());
        model.addAttribute("topic", topic); //adding topic just to know in what topic we are
        //adding words
        List<Word> wordsList = wordService.listTopicWords(topic);
        long seed = System.nanoTime();
        Collections.shuffle(wordsList, new Random(seed));
        model.addAttribute("listWords", wordsList); //list of words under specified lesson
        if (inverse != null) {
            model.addAttribute("inverse", true);
        }
        return "exercise";
    }


}
