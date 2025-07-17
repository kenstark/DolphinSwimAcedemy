package com.example.labeight.controller;

import com.example.labeight.model.Student;
import com.example.labeight.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/students")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @GetMapping
    public String students(@RequestParam(value = "session", required = false) String session, Model model) {
        List<String> availableSessions = studentService.getAvailableSessions();
        String selectedSession = session != null ? session : "Session 1: June 17 - June 27";

        List<Student> students = studentService.getStudentsBySession(selectedSession);

        model.addAttribute("students", students);
        model.addAttribute("availableSessions", availableSessions);
        model.addAttribute("selectedSession", selectedSession);

        return "students";
    }
}