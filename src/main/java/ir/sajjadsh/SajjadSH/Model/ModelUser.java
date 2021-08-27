package ir.sajjadsh.SajjadSH.Model;

public class ModelUser {
    private int id;
    private String name,user,email;
    private int timeDay;

    public ModelUser() {
    }

    public ModelUser(int id, String name, String user, String email, int timeDay) {
        this.id = id;
        this.name = name;
        this.user = user;
        this.email = email;
        this.timeDay = timeDay;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getTimeDay() {
        return timeDay;
    }

    public void setTimeDay(int timeDay) {
        this.timeDay = timeDay;
    }
}
