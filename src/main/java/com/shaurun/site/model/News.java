package com.shaurun.site.model;

import org.hibernate.annotations.Type;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * Simple JavaBean object that represents news
 *
 * @author Alena Damanskaya
 * @version 1.0
 */
@Entity
@Table(name = "news")
public class News {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "title")
    private String title;

    @Column(name = "info")
    private String info;

    @Temporal(value = TemporalType.DATE)
    @Column(name="date")
    //@DateTimeFormat(pattern="dd.MM.yyyy hh:mm")
    private Date date;

    @Column(name = "published")
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean published;

    public News() {}

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public boolean getPublished() {
        return published;
    }

    public void setPublished(boolean published) {
        this.published = published;
    }

    @Override
    public String toString() {
        return "News{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", info='" + info + '\'' +
                ", date=" + date +
                '}';
    }
}
