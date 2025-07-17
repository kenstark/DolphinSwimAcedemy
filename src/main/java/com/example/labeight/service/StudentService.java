package com.example.labeight.service;

import com.example.labeight.model.Student;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class StudentService {
    private final List<Student> students;

    public StudentService() {
        this.students = new ArrayList<>();
        initializeStudents();
    }

    private void initializeStudents() {
        // Add students for different sessions based on the images
        students.add(new Student(1, "Josh", "Session 2: July 8 - July 18", 2017, "Minnows", "10am", "9am"));
        students.add(new Student(2, "Eva", "Session 2: July 8 - July 18", 2018, "Minnows", "10am", "1pm"));
        students.add(new Student(3, "Lucy", "Session 2: July 8 - July 18", 2020, "Starfish", "1pm", "2pm"));
        students.add(new Student(4, "Matt", "Session 2: July 8 - July 18", 2016, "Dolphins", "9am", "2pm"));

        // Add students for other sessions
        students.add(new Student(5, "Emma", "Session 1: June 17 - June 27", 2019, "Starfish", "9am", "10am"));
        students.add(new Student(6, "Liam", "Session 1: June 17 - June 27", 2017, "Minnows", "1pm", "2pm"));
        students.add(new Student(7, "Sophia", "Session 3: July 22 - August 1", 2018, "Dolphins", "10am", "1pm"));
        students.add(new Student(8, "Noah", "Session 4: August 5 - August 15", 2016, "Dolphins", "2pm", "1pm"));
    }

    public List<Student> getAllStudents() {
        return new ArrayList<>(students);
    }

    public List<Student> getStudentsBySession(String session) {
        return students.stream()
                .filter(student -> student.getSession().equals(session))
                .collect(Collectors.toList());
    }

    public void addStudent(Student student) {
        student.setId(getNextId());
        students.add(student);
    }

    private int getNextId() {
        return students.stream()
                .mapToInt(Student::getId)
                .max()
                .orElse(0) + 1;
    }

    public List<String> getAvailableSessions() {
        return List.of(
                "Session 1: June 17 - June 27",
                "Session 2: July 8 - July 18",
                "Session 3: July 22 - August 1",
                "Session 4: August 5 - August 15"
        );
    }
}