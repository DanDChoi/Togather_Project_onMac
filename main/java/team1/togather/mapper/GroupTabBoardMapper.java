package team1.togather.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import team1.togather.domain.GroupTabBoard;
import team1.togather.domain.BoardCriteria;

public interface GroupTabBoardMapper {
	ArrayList<GroupTabBoard> gb_list();
	ArrayList<String> getCategory();
	ArrayList<GroupTabBoard> gb_list(int pageAt, int ps);
	ArrayList<GroupTabBoard> gb_list(String option, String ocontent);
	String getNameByMnum(long mnum);
	GroupTabBoard getBoardContent(Long gbnum);
	ArrayList<GroupTabBoard> Rlist();
	void insert(GroupTabBoard groupTabBoard);
	void delete(Long gbnum);
	void update(GroupTabBoard groupTabBoard);
	//조회수
	public void updateBView(Long gbnum);

	//페이징
	public List<GroupTabBoard> listPage(Integer page); //특정페이지 글정보확인
	public List<GroupTabBoard> listPageCri(BoardCriteria cri); // 페이징처리(cri객체사용)
	public Integer pageCount(); //db테이블 모든글 개수 계산 후 리턴
	public List<GroupTabBoard> getBoardBySearch(Map map);
}
