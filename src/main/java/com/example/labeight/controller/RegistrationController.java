package com.example.labeight.controller;

import com.example.labeight.model.Student;
import com.example.labeight.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/register")
public class RegistrationController {

    @Autowired
    private StudentService studentService;

    @GetMapping
    public String showRegistrationForm(Model model) {
        model.addAttribute("student", new Student());
        model.addAttribute("sessions", studentService.getAvailableSessions());
        return "register";
    }

    @PostMapping
    public String processRegistration(@ModelAttribute Student student, Model model) {
        studentService.addStudent(student);
        return "registration-complete";
    }
}