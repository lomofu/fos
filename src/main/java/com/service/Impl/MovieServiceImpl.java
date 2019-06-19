package com.service.Impl;

import com.dao.MovieDao;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.service.MovieService;
import com.vo.VeiwMovie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;


@Service
public class MovieServiceImpl implements MovieService {
    @Autowired
    private MovieDao movieDao;


    /**
     * 查询全部电影
     * @param pageNum 当前页数
     * @param pageSize 一页的数量
     * @return
     */
    @Override
    public ArrayList<VeiwMovie> getAllMovie(int pageNum,int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        ArrayList movieList= new ArrayList();

            movieList=movieDao.queryAllMovie();
        PageInfo page = new PageInfo(movieList);
        return movieList;
    }

    @Override
    public VeiwMovie getMovieByMovieId(Integer movieId) {
        return movieDao.queryByMovieId(movieId);
    }

    @Override
    public VeiwMovie getMovieByMovieIdInfo(Integer movieId) {
        return movieDao.queryByMovieIdInfo(movieId);
    }

    @Override
    public ArrayList<VeiwMovie> getMovieByTypeId(Integer typeId) {
        return movieDao.queryMovieByType(typeId);
    }

    @Override
    public ArrayList<VeiwMovie> getMovieByTypeId(Integer typeId, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        ArrayList movieTypeList= new ArrayList();
        movieTypeList=movieDao.queryMovieByType(typeId);
        PageInfo page = new PageInfo(movieTypeList);
        return movieTypeList;
    }

    /**
     * 通过电影名字查询电影
     * @param movieName
     * @return
     */

    @Override
    public ArrayList<VeiwMovie> getMovieByName(String movieName) {
        //将%添加进字符串中
        StringBuffer sb = new StringBuffer();
        for(int i=0;i<movieName.length();i++){
            sb.append(movieName.charAt(i));
            if(i != movieName.length()-1)
                sb.append("%");
        }
        movieName = sb.toString();
        return movieDao.queryByMoieName(movieName);
    }

    @Override
    public ArrayList<VeiwMovie> getMovieByName(String movieName, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        ArrayList list= new ArrayList();
        StringBuffer sb = new StringBuffer();
        for(int i=0;i<movieName.length();i++){
            sb.append(movieName.charAt(i));
            if(i != movieName.length()-1)
                sb.append("%");
        }
        movieName = sb.toString();
        list=movieDao.queryByMoieName(movieName);
        PageInfo page = new PageInfo(list);
        return list;
    }

    /**
     * 获取电影总数
     * @return int
     */

    @Override
    public int getMovieCount() {
        return movieDao.queryAllMovies();
    }

    @Override
    public int getTypeMovieCount(Integer typeId) {
        return movieDao.queryTypeMovies(typeId);
    }


}
