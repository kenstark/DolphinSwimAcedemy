package com.example.labeight.controller;

import com.example.labeight.model.Lesson;
import com.example.labeight.service.LessonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class LessonController {

    @Autowired
    private LessonService lessonService;

    @GetMapping("/")
    public String home(Model model) {
        List<Lesson> lessons = lessonService.getAllLessons();
        model.addAttribute("lessons", lessons);
        return "home";
    }

    @PostMapping("/attend/{lessonName}")
    public String attendLesson(@PathVariable String lessonName) {
        lessonService.attendLesson(lessonName);
        return "redirect:/";
    }

    @GetMapping("/add")
    public String addLessonsForm(Model model) {
        List<String> lessonNames = lessonService.getLessonNames();
        model.addAttribute("lessonNames", lessonNames);
        return "add-lessons";
    }

    @PostMapping("/add")
    public String addLessons(@RequestParam String name, @RequestParam int count) {
        lessonService.addLessons(name, count);
        return "redirect:/";
    }

    @GetMapping("/view/{lessonName}")
    public String viewLesson(@PathVariable String lessonName, Model model) {
        Lesson lesson = lessonService.getLesson(lessonName);
        model.addAttribute("lesson", lesson);
        return "view-lesson";
    }
}