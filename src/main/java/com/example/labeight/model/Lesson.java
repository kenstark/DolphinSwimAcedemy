package com.example.labeight.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Lesson {
    private String name;
    private int remaining;
    private List<LocalDate> attendedDates;

    public Lesson() {
        this.attendedDates = new ArrayList<>();
    }

    public Lesson(String name, int remaining) {
        this.name = name;
        this.remaining = remaining;
        this.attendedDates = new ArrayList<>();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getRemaining() {
        return remaining;
    }

    public void setRemaining(int remaining) {
        this.remaining = remaining;
    }

    public List<LocalDate> getAttendedDates() {
        return attendedDates;
    }

    public void setAttendedDates(List<LocalDate> attendedDates) {
        this.attendedDates = attendedDates;
    }

    public void addAttendedDate(LocalDate date) {
        this.attendedDates.add(date);
    }

    public void decrementRemaining() {
        if (this.remaining > 0) {
            this.remaining--;
        }
    }

    public void addLessons(int count) {
        this.remaining += count;
    }
}