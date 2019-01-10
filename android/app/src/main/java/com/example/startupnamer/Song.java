package com.example.startupnamer;

import org.bson.Document;

public class Song {
    private String id;
    private String title;
    private int num;
    private String language;

    public Song(Document document){
        id = document.get("_id.$oid").toString();
        title = document.getString("title");
        num = document.getInteger("num");
        language = document.getString("language");
        System.out.println(id);
    }

    public String get_id() {
        return id;
    }

    public void set_id(String _id) {
        this.id = _id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }
}
