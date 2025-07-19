package com.example.labeight.model;

import java.util.ArrayList;
import java.util.List;

public class SwimClass {
    private int id;
    private String session;
    private String level;
    private String time;
    private List<Student> students;

    public SwimClass() {
        this.students = new ArrayList<>();
    }

    public SwimClass(int id, String session, String level, String time) {
        this.id = id;
        this.session = session;
        this.level = level;
        this.time = time;
        this.students = new ArrayList<>();
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getSession() { return session; }
    public void setSession(String session) { this.session = session; }

    public String getLevel() { return level; }
    public void setLevel(String level) { this.level = level; }

    public String getTime() { return time; }
    public void setTime(String time) { this.time = time; }

    public List<Student> getStudents() { return students; }
    public void setStudents(List<Student> students) { this.students = students; }

    public void addStudent(Student student) {
        this.students.add(student);
    }

    public void removeStudent(Student student) {
        this.students.remove(student);
    }

    public int getStudentCount() {
        return students.size();
    }
}