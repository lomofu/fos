package com.dao;

import com.vo.VeiwInfo;

import java.util.ArrayList;

public interface InfoDao {
    ArrayList<VeiwInfo> queryAllInfo();

    ArrayList<VeiwInfo>queryOnlyThree();

    int queryAllInfoCount();

    VeiwInfo queryByInfoId(Integer infoId);
}
