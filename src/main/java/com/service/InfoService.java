package com.service;

import com.vo.VeiwInfo;

import java.util.ArrayList;

public interface InfoService {
    ArrayList<VeiwInfo>selectAllInfo();

    ArrayList<VeiwInfo>selectAllInfo(int pageNum,int pageSize);

    ArrayList<VeiwInfo>selectOnlyThree();

    int getAllInfoCount();

    VeiwInfo getByInfoId(Integer infoId);
}
