package com.shaurun.site.services;

import com.shaurun.site.model.Lesson;
import com.shaurun.site.model.Topic;
import com.shaurun.site.model.Word;

import java.util.List;

public interface WordService {
    void add(Word word);

    void edit(Word word);

    void delete(long id);

    Word getWordById(long id);

    List<Word> listWords();

    List<Word> listLessonWords(Lesson lesson);

    List<Word> listTopicWords(Topic topic);
}
