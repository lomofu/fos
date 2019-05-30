package com.entity;

/**
 * 排名
 */
public class Rank {
    private Integer rankId;
    private Integer movieId;
    private Integer avgStart;

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

    public Integer getAvgStart() {
        return avgStart;
    }

    public void setAvgStart(Integer avgStart) {
        this.avgStart = avgStart;
    }
}
