package com.entity;

/**
 * 排名
 */
public class Rank {
    private Integer rankId;
    private Integer movieId;
    private Integer avg_start;

    public Integer getRankId() {
        return rankId;
    }

    public void setRankId(Integer rankId) {
        this.rankId = rankId;
    }

    public Integer getMovieId() {
        return movieId;
    }

    public void setMovieId(Integer movieId) {
        this.movieId = movieId;
    }

    public Integer getAvg_start() {
        return avg_start;
    }

    public void setAvg_start(Integer avg_start) {
        this.avg_start = avg_start;
    }
}
