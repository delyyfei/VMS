package net.sunniwell.pas.util;

import java.util.*;

/**
 * @author zhoudeming
 * @date 2016/11/14
 */
public class CollectionParam {

    private List<Object> list = new ArrayList<>();
    private Set<Object> set = new HashSet<>();
    private Map<String, Object> map = new HashMap<>();

    public List<Object> getList() {
        return list;
    }

    public void setList(List<Object> list) {
        this.list = list;
    }

    public Set<Object> getSet() {
        return set;
    }

    public void setSet(Set<Object> set) {
        this.set = set;
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }
}
