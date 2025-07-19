package com.example.labeight.service;

import com.example.labeight.model.Lesson;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class LessonService {
    private Map<String, Lesson> lessons = new HashMap<>();

    public LessonService() {
        // Initialize with sample data
        lessons.put("Swimming", new Lesson("Swimming", 6));
        lessons.put("Tennis", new Lesson("Tennis", 9));
        lessons.put("Basketball", new Lesson("Basketball", 0));
    }

    public List<Lesson> getAllLessons() {
        return new ArrayList<>(lessons.values());
    }

    public Lesson getLesson(String name) {
        return lessons.get(name);
    }

    public void attendLesson(String name) {
        Lesson lesson = lessons.get(name);
        if (lesson != null && lesson.getRemaining() > 0) {
            lesson.decrementRemaining();
            lesson.addAttendedDate(LocalDate.now());
        }
    }

    public void addLessons(String name, int count) {
        Lesson lesson = lessons.get(name);
        if (lesson != null) {
            lesson.addLessons(count);
        } else {
            lessons.put(name, new Lesson(name, count));
        }
    }

    public List<String> getLessonNames() {
        return new ArrayList<>(lessons.keySet());
    }
}