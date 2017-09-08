package com.cafe24.newpickme.company.domain;

import java.util.List;

public class IndustryCategory1 {

    private int industryCategory1Id;
    private String industryCategory1Name;
    private List<IndustryCategory2> industryCategory2List;

    public int getIndustryCategory1Id() {
        return industryCategory1Id;
    }

    public void setIndustryCategory1Id(int industryCategory1Id) {
        this.industryCategory1Id = industryCategory1Id;
    }

    public String getIndustryCategory1Name() {
        return industryCategory1Name;
    }

    public void setIndustryCategory1Name(String industryCategory1Name) {
        this.industryCategory1Name = industryCategory1Name;
    }

    public List<IndustryCategory2> getIndustryCategory2List() {
        return industryCategory2List;
    }

    public void setIndustryCategory2List(List<IndustryCategory2> industryCategory2List) {
        this.industryCategory2List = industryCategory2List;
    }

    @Override
    public String toString() {
        return "IndustryCategory1{" +
                "industryCategory1Id=" + industryCategory1Id +
                ", industryCategory1Name='" + industryCategory1Name + '\'' +
                ", industryCategory2List=" + industryCategory2List +
                '}';
    }
}
