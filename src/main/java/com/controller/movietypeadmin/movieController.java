package com.controller.movietypeadmin;

import com.dto.Layui;
import com.entity.MovieType;
import com.service.MovieTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
@Controller
@RequestMapping(value = "/movietype")

public class movieController {

    @Autowired
    private MovieTypeService movieTypeService;


    /**
     * 查询所有电影类型 并返回json数据类型
     *
     * @return
     */
    @RequestMapping(value = "/getallmovietype", method = RequestMethod.GET)
    @ResponseBody
    private Layui getAllMovieType() {
        Layui layui = new Layui();
        List<MovieType> list = movieTypeService.getAllMovieType();
        try {
            layui = Layui.selectsuccess(list.size(), list);
        } catch (Exception e) {
            layui=Layui.fail(e);
        }
        return layui;
    }


}
