package com.shaurun.site.model;

public class Exercise {
    long[] lessonIds;
    long[] topicIds;
    boolean repeatable;
    int max;
    int type;

    public long[] getLessonIds() {
        return lessonIds;
    }

    public void setLessonIds(long[] lessonIds) {
        this.lessonIds = lessonIds;
    }

    public long[] getTopicIds() {
        return topicIds;
    }

    public void setTopicIds(long[] topicIds) {
        this.topicIds = topicIds;
    }

    public boolean isRepeatable() {
        return repeatable;
    }

    public void setRepeatable(boolean repeatable) {
        this.repeatable = repeatable;
    }

    public int getMax() {
        return max;
    }

    public void setMax(int max) {
        if (max < 0) { this.max = 0; }
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
