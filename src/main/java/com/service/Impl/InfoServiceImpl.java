package com.service.Impl;

import com.dao.InfoDao;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.InfoService;
import com.vo.VeiwInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class InfoServiceImpl implements InfoService {

    @Autowired
    private InfoDao infoDao;

    @Override
    public ArrayList<VeiwInfo> selectAllInfo() {
        return infoDao.queryAllInfo();
    }

    @Override
    public ArrayList<VeiwInfo> selectAllInfo(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        ArrayList list=new ArrayList();
        list = infoDao.queryAllInfo();
        PageInfo pageInfo=new PageInfo(list);
        return list;
    }

    @Override
    public ArrayList<VeiwInfo> selectOnlyThree() {
        return infoDao.queryOnlyThree();
    }

    @Override
    public int getAllInfoCount() {
        return infoDao.queryAllInfoCount();
    }

    @Override
    public VeiwInfo getByInfoId(Integer infoId) {
        return infoDao.queryByInfoId(infoId);
    }
}
