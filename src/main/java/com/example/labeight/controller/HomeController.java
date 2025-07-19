package com.example.labeight.controller;

import com.example.labeight.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @Autowired
    private StudentService studentService;

    @GetMapping("/")
    public String home(Model model) {
        return "index";
    }
}