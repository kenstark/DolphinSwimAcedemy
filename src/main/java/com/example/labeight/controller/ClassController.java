package com.example.labeight.controller;

import com.example.labeight.model.Student;
import com.example.labeight.model.SwimClass;
import com.example.labeight.service.ClassService;
import com.example.labeight.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/classes")
public class ClassController {

    @Autowired
    private ClassService classService;

    @Autowired
    private StudentService studentService;

    @GetMapping
    public String classes(@RequestParam(value = "session", required = false) String session, Model model) {
        List<String> availableSessions = studentService.getAvailableSessions();
        String selectedSession = session != null ? session : "Session 1: June 17 - June 27";

        List<SwimClass> classes = classService.getClassesBySession(selectedSession);

        model.addAttribute("classes", classes);
        model.addAttribute("availableSessions", availableSessions);
        model.addAttribute("selectedSession", selectedSession);

        return "classes";
    }

    @GetMapping("/create")
    public String showCreateClassForm(Model model) {
        model.addAttribute("availableSessions", studentService.getAvailableSessions());
        model.addAttribute("availableLevels", classService.getAvailableLevels());
        model.addAttribute("availableTimes", classService.getAvailableTimes());
        return "create-class";
    }

    @PostMapping("/create")
    public String createClass(@RequestParam String session,
                             @RequestParam String level,
                             @RequestParam String time) {
        classService.createClass(session, level, time);
        return "redirect:/classes?session=" + session;
    }

    @GetMapping("/assign")
    public String showAssignStudentForm(@RequestParam(value = "session", required = false) String session, Model model) {
        String selectedSession = session != null ? session : "Session 1: June 17 - June 27";
        
        List<SwimClass> classes = classService.getClassesBySession(selectedSession);
        List<Student> unassignedStudents = classService.getUnassignedStudents(selectedSession);
        List<String> availableSessions = studentService.getAvailableSessions();

        model.addAttribute("classes", classes);
        model.addAttribute("unassignedStudents", unassignedStudents);
        model.addAttribute("availableSessions", availableSessions);
        model.addAttribute("selectedSession", selectedSession);

        return "assign-student";
    }

    @PostMapping("/assign")
    public String assignStudent(@RequestParam int classId,
                               @RequestParam int studentId,
                               @RequestParam String session) {
        classService.assignStudentToClass(classId, studentId);
        return "redirect:/classes/assign?session=" + session;
    }
}