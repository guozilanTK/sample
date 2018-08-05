package tk.guozilan.sample.model;


import tk.guozilan.base.model.BasePage;

import java.util.Date;

/**
 * @author guozilan
 */
public class User extends BasePage {

    private String name;

    private Date birthday;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }
}
