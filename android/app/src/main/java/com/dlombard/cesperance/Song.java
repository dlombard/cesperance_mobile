package com.dlombard.cesperance;

import android.icu.text.SimpleDateFormat;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import org.bson.Document;
import org.bson.types.ObjectId;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.lang.reflect.Type;
import java.util.Date;
import java.util.List;

public class Song {
    private String _id;
    private String title;
    private int num;
    private String language;
    private String book_abbrv;
    private String markdown_lyrics;
    private String html_lyrics;
    private Date created_at;
    private Date updated_at;
    private static SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    private static Type type = new TypeToken<Song>() {}.getType();
    private static Type songArrayType = new TypeToken<List<Song>>() {}.getType();
    private static Gson gson = new Gson();

    public Song(){}
    public Song(Document document){
        _id = document.getObjectId("_id").toHexString();
        title = document.getString("title");
        num = document.getInteger("num");
        language = document.getString("language");
        book_abbrv = document.getString("book_abbrv");
        markdown_lyrics = document.getString("markdown_lyrics");
        html_lyrics = document.getString("html_lyrics");
        created_at = document.getDate("created_at");
        updated_at = document.getDate("updated_at");
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

    public String get_id() {
        return _id;
    }

    public void set_id(String _id) {
        this._id = _id;
    }

    public String getBook_abbrv() {
        return book_abbrv;
    }

    public void setBook_abbrv(String book_abbrv) {
        this.book_abbrv = book_abbrv;
    }

    public String getMarkdown_lyrics() {
        return markdown_lyrics;
    }

    public void setMarkdown_lyrics(String markdown_lyrics) {
        this.markdown_lyrics = markdown_lyrics;
    }

    public String getHtml_lyrics() {
        return html_lyrics;
    }

    public void setHtml_lyrics(String html_lyrics) {
        this.html_lyrics = html_lyrics;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }

    public Document toDocument(){
        return new Document().append("_id", new ObjectId(_id)).append("title", title).append("num", num).append("book_abbrv", book_abbrv).append("language",language).append("markdown_lyrics", markdown_lyrics).append("html_lyrics", html_lyrics). append("created_at", created_at).append("updated_at", updated_at);
    }

    public Song fromJson(String json) throws JSONException{
        JSONObject j = new JSONObject(json);

        return gson.fromJson(j.toString(), type);
    }
    public List<Song> fromJsonArray(String jsonArray) throws JSONException {

            JSONArray jArray = new JSONArray(jsonArray);
            return gson.fromJson(jArray.toString(), songArrayType);

    }
    public String toJson(){
        return gson.toJson(this);
    }
    @Override
    public String toString() {
        return "Song{" +
                "_id='" + _id + '\'' +
                ", title='" + title + '\'' +
                ", num=" + num +
                ", language='" + language + '\'' +
                ", book_abbrv='" + book_abbrv + '\'' +
                ", markdown_lyrics='" + markdown_lyrics + '\'' +
                ", html_lyrics='" + html_lyrics + '\'' +
                ", created_at=" + created_at +
                ", updated_at=" + updated_at +
                '}';
    }
}
