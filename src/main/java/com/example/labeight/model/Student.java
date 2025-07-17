package com.example.labeight.model;

public class Student {
    private int id;
    private String name;
    private String session;
    private int birthYear;
    private String level;
    private String firstChoiceTime;
    private String secondChoiceTime;

    public Student() {}

    public Student(int id, String name, String session, int birthYear, String level,
                   String firstChoiceTime, String secondChoiceTime) {
        this.id = id;
        this.name = name;
        this.session = session;
        this.birthYear = birthYear;
        this.level = level;
        this.firstChoiceTime = firstChoiceTime;
        this.secondChoiceTime = secondChoiceTime;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getSession() { return session; }
    public void setSession(String session) { this.session = session; }

    public int getBirthYear() { return birthYear; }
    public void setBirthYear(int birthYear) { this.birthYear = birthYear; }

    public String getLevel() { return level; }
    public void setLevel(String level) { this.level = level; }

    public String getFirstChoiceTime() { return firstChoiceTime; }
    public void setFirstChoiceTime(String firstChoiceTime) { this.firstChoiceTime = firstChoiceTime; }

    public String getSecondChoiceTime() { return secondChoiceTime; }
    public void setSecondChoiceTime(String secondChoiceTime) { this.secondChoiceTime = secondChoiceTime; }

    // Calculate age based on birth year (assuming current year is 2024)
    public int getAge() {
        return 2024 - birthYear;
    }
}