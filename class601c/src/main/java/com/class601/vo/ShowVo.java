package com.class601.vo;

public class ShowVo {

	private String showId;
	private String movieId;
	private String movieNm;
	private String movieRating;
	private String theaterId;
	private String theaterNm;
	private String cinemaId;
	private String cinemaNm;
	private String cinemaFloorNo;
	private String cinemaTypeId;
	private String cinemaTypeNm;
	private String cinemaTypePrice;

	public String getMovieRating() {
		return movieRating;
	}

	public void setMovieRating(String movieRating) {
		this.movieRating = movieRating;
	}

	public String getCinemaFloorNo() {
		return cinemaFloorNo;
	}

	public void setCinemaFloorNo(String cinemaFloorNo) {
		this.cinemaFloorNo = cinemaFloorNo;
	}

	public String getCinemaTypePrice() {
		return cinemaTypePrice;
	}

	public void setCinemaTypePrice(String cinemaTypePrice) {
		this.cinemaTypePrice = cinemaTypePrice;
	}

	public String getTimeTypePrice() {
		return timeTypePrice;
	}

	public void setTimeTypePrice(String timeTypePrice) {
		this.timeTypePrice = timeTypePrice;
	}

	private String timeTypeId;
	private String timeTypeNm;
	private String timeTypePrice;
	private String startTime;
	private String showDate;

	private int pageNo;
	private int pageSize;

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String getShowId() {
		return showId;
	}

	public void setShowId(String showId) {
		this.showId = showId;
	}

	public String getMovieId() {
		return movieId;
	}

	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}

	public String getMovieNm() {
		return movieNm;
	}

	public void setMovieNm(String movieNm) {
		this.movieNm = movieNm;
	}

	public String getTheaterId() {
		return theaterId;
	}

	public void setTheaterId(String theaterId) {
		this.theaterId = theaterId;
	}

	public String getTheaterNm() {
		return theaterNm;
	}

	public void setTheaterNm(String theaterNm) {
		this.theaterNm = theaterNm;
	}

	public String getCinemaId() {
		return cinemaId;
	}

	public void setCinemaId(String cinemaId) {
		this.cinemaId = cinemaId;
	}

	public String getCinemaNm() {
		return cinemaNm;
	}

	public void setCinemaNm(String cinemaNm) {
		this.cinemaNm = cinemaNm;
	}

	public String getCinemaTypeId() {
		return cinemaTypeId;
	}

	public void setCinemaTypeId(String cinemaTypeId) {
		this.cinemaTypeId = cinemaTypeId;
	}

	public String getCinemaTypeNm() {
		return cinemaTypeNm;
	}

	public void setCinemaTypeNm(String cinemaTypeNm) {
		this.cinemaTypeNm = cinemaTypeNm;
	}

	public String getTimeTypeId() {
		return timeTypeId;
	}

	public void setTimeTypeId(String timeTypeId) {
		this.timeTypeId = timeTypeId;
	}

	public String getTimeTypeNm() {
		return timeTypeNm;
	}

	public void setTimeTypeNm(String timeTypeNm) {
		this.timeTypeNm = timeTypeNm;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getShowDate() {
		return showDate;
	}

	public void setShowDate(String showDate) {
		this.showDate = showDate;
	}

}
