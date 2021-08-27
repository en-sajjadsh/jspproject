package ir.sajjadsh.SajjadSH.Model;

public class ModelLearn {
    private int id, student;
    private String name, pic, text, teacher;

    public ModelLearn() {
    }

    public ModelLearn(int id, int student, String name, String pic, String text, String teacher) {
        this.id = id;
        this.student = student;
        this.name = name;
        this.pic = pic;
        this.text = text;
        this.teacher = teacher;
    }


    public void setId(int id) {
        this.id = id;
    }

    public void setStudent(int student) {
        this.student = student;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public void setText(String text) {
        this.text = text;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public int getId() {
        return id;
    }

    public int getStudent() {
        return student;
    }

    public String getName() {
        return name;
    }

    public String getPic() {
        return pic;
    }

    public String getText() {
        return text;
    }

    public String getTeacher() {
        return teacher;
    }
}
