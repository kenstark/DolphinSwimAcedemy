package com.example.labeight.service;

import com.example.labeight.model.Student;
import com.example.labeight.model.SwimClass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ClassService {
    private final List<SwimClass> classes;
    private final StudentService studentService;

    @Autowired
    public ClassService(StudentService studentService) {
        this.studentService = studentService;
        this.classes = new ArrayList<>();
        initializeClasses();
    }

    private void initializeClasses() {
        // Create sample classes for different sessions
        SwimClass class1 = new SwimClass(1, "Session 1: June 17 - June 27", "Starfish", "9am");
        SwimClass class2 = new SwimClass(2, "Session 1: June 17 - June 27", "Minnows", "10am");
        SwimClass class3 = new SwimClass(3, "Session 2: July 8 - July 18", "Starfish", "1pm");
        SwimClass class4 = new SwimClass(4, "Session 2: July 8 - July 18", "Minnows", "10am");
        SwimClass class5 = new SwimClass(5, "Session 2: July 8 - July 18", "Dolphins", "9am");

        classes.add(class1);
        classes.add(class2);
        classes.add(class3);
        classes.add(class4);
        classes.add(class5);

        // Assign students to classes based on their preferences and levels
        assignStudentsToClasses();
    }

    private void assignStudentsToClasses() {
        List<Student> allStudents = studentService.getAllStudents();
        
        for (Student student : allStudents) {
            // Find a class that matches the student's session, level, and preferred time
            SwimClass matchingClass = findMatchingClass(student);
            if (matchingClass != null) {
                matchingClass.addStudent(student);
            }
        }
    }

    private SwimClass findMatchingClass(Student student) {
        // First try to match with first choice time
        SwimClass firstChoice = classes.stream()
                .filter(c -> c.getSession().equals(student.getSession()))
                .filter(c -> c.getLevel().equals(student.getLevel()))
                .filter(c -> c.getTime().equals(student.getFirstChoiceTime()))
                .findFirst()
                .orElse(null);

        if (firstChoice != null) {
            return firstChoice;
        }

        // If no match with first choice, try second choice
        return classes.stream()
                .filter(c -> c.getSession().equals(student.getSession()))
                .filter(c -> c.getLevel().equals(student.getLevel()))
                .filter(c -> c.getTime().equals(student.getSecondChoiceTime()))
                .findFirst()
                .orElse(null);
    }

    public List<SwimClass> getAllClasses() {
        return new ArrayList<>(classes);
    }

    public List<SwimClass> getClassesBySession(String session) {
        return classes.stream()
                .filter(c -> c.getSession().equals(session))
                .collect(Collectors.toList());
    }

    public SwimClass getClassById(int id) {
        return classes.stream()
                .filter(c -> c.getId() == id)
                .findFirst()
                .orElse(null);
    }

    public void createClass(String session, String level, String time) {
        int nextId = getNextId();
        SwimClass newClass = new SwimClass(nextId, session, level, time);
        classes.add(newClass);
    }

    public void assignStudentToClass(int classId, int studentId) {
        SwimClass swimClass = getClassById(classId);
        if (swimClass != null) {
            Student student = studentService.getAllStudents().stream()
                    .filter(s -> s.getId() == studentId)
                    .findFirst()
                    .orElse(null);
            
            if (student != null) {
                // Remove student from any existing class in the same session
                removeStudentFromSessionClasses(student, swimClass.getSession());
                // Add student to new class
                swimClass.addStudent(student);
            }
        }
    }

    private void removeStudentFromSessionClasses(Student student, String session) {
        classes.stream()
                .filter(c -> c.getSession().equals(session))
                .forEach(c -> c.removeStudent(student));
    }

    public List<Student> getUnassignedStudents(String session) {
        List<Student> sessionStudents = studentService.getStudentsBySession(session);
        List<Student> assignedStudents = getClassesBySession(session).stream()
                .flatMap(c -> c.getStudents().stream())
                .collect(Collectors.toList());

        return sessionStudents.stream()
                .filter(s -> !assignedStudents.contains(s))
                .collect(Collectors.toList());
    }

    public List<String> getAvailableTimes() {
        return List.of("9am", "10am", "1pm", "2pm");
    }

    public List<String> getAvailableLevels() {
        return List.of("Starfish", "Minnows", "Dolphins");
    }

    private int getNextId() {
        return classes.stream()
                .mapToInt(SwimClass::getId)
                .max()
                .orElse(0) + 1;
    }
}