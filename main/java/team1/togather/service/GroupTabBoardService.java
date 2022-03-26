package team1.togather.service;

import java.util.List;
import java.util.Map;

import team1.togather.domain.GroupTabBoard;
import team1.togather.domain.BoardCriteria;

public interface GroupTabBoardService {
	public List<GroupTabBoard> listPage(int page);
	public List<GroupTabBoard> listCri(BoardCriteria cri); //페이징 처리된 글목록
	public int pageCount();
	
	void insert(GroupTabBoard groupTabBoard);
	GroupTabBoard getBoardContent(Long gbnum);
	void delete(Long gbnum);
	void update(GroupTabBoard groupTabBoard);
	public List<GroupTabBoard> getBoardBySearch(Map map);
	void updateBView(Long gbnum);
}
