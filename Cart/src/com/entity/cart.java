package com.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 34432 on 2017/5/19.
 */
public class cart {
    private double sum;
    private List<item> lists = new ArrayList<item>();

    public double getSum() {
        return sum;
    }

    public void setSum(double sum) {
        this.sum = sum;
    }

    public List<item> getLists() {
        return lists;
    }

    public void setLists(List<item> lists) {
        this.lists = lists;
    }
}
