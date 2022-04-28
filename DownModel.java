package com.example.tracer;


public class DownModel {

    String Name, Link;
    String Image;

    public DownModel(){

    }

    public DownModel(String name, String link, String image) {
        Name = name;
        Link = link;
        Image = image;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getLink() {
        return Link;
    }

    public void setLink(String link) {
        Link = link;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String image) {
        Image = image;
    }
}