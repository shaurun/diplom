package com.shaurun.site.model;

import javax.persistence.*;

@Entity
@Table(name = "lessons")
public class Lesson {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    long id;

    @Column(name = "name")
    String name;

    @Column(name = "status")
    int status;

    @ManyToOne
    Subject subject;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    @Override
    public String toString() {
        return "Lesson{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", status=" + status +
                ", subject=" + subject +
                '}';
    }
}
