package com.cafe24.newpickme.company.domain;

public class IndustryCategory2 {

    private int industryCategory2Id;
    private String industryCategory2Name;

    private int industryCategory1Id;
    private IndustryCategory1 industryCategory1;

    public int getIndustryCategory2Id() {
        return industryCategory2Id;
    }

    public void setIndustryCategory2Id(int industryCategory2Id) {
        this.industryCategory2Id = industryCategory2Id;
    }

    public String getIndustryCategory2Name() {
        return industryCategory2Name;
    }

    public void setIndustryCategory2Name(String industryCategory2Name) {
        this.industryCategory2Name = industryCategory2Name;
    }

    public int getIndustryCategory1Id() {
        return industryCategory1Id;
    }

    public void setIndustryCategory1Id(int industryCategory1Id) {
        this.industryCategory1Id = industryCategory1Id;
    }

    public IndustryCategory1 getIndustryCategory1() {
        return industryCategory1;
    }

    public void setIndustryCategory1(IndustryCategory1 industryCategory1) {
        this.industryCategory1 = industryCategory1;
    }

    @Override
    public String toString() {
        return "IndustryCategory2{" +
                "industryCategory2Id=" + industryCategory2Id +
                ", industryCategory2Name='" + industryCategory2Name + '\'' +
                ", industryCategory1Id=" + industryCategory1Id +
                ", industryCategory1=" + industryCategory1 +
                '}';
    }
}
