package net.sunniwell.vms.model;

public class OperatorModel {

    private String id;
    private String name;
    private String password;
    private long loginUTC;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public long getLoginUTC() {
        return loginUTC;
    }

    public void setLoginUTC(long loginUTC) {
        this.loginUTC = loginUTC;
    }
}