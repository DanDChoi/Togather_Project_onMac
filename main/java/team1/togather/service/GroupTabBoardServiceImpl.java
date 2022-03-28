package team1.togather.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team1.togather.domain.BoardCriteria;
import team1.togather.domain.GroupTabBoard;
import team1.togather.mapper.GroupTabBoardMapper;

@Service
public class GroupTabBoardServiceImpl implements GroupTabBoardService {
	
	@Autowired
	private GroupTabBoardMapper groupTabBoardMapper;

	@Override
	public List<GroupTabBoard> listPage(int page) {
		if(page <= 0) {
			page = 1;
		}
		page = (page - 1)*10;
		return groupTabBoardMapper.listPage(page);
	}

	@Override
	public List<GroupTabBoard> listCri(BoardCriteria cri) {
		return groupTabBoardMapper.listPageCri(cri);
	}

	@Override
	public int pageCount() {
		return groupTabBoardMapper.pageCount();
	}

	@Override
	public void insert(GroupTabBoard groupTabBoard) {
		groupTabBoardMapper.insert(groupTabBoard);

	}

	@Override
	public GroupTabBoard getBoardContent(Long gbnum) {
		return groupTabBoardMapper.getBoardContent(gbnum);
	}

	@Override
	public void delete(Long gbnum) {
		groupTabBoardMapper.delete(gbnum);

	}

	@Override
	public void update(GroupTabBoard groupTabBoard) {
		groupTabBoardMapper.update(groupTabBoard);
	}

	@Override
	public List<GroupTabBoard> getBoardBySearch(Map map) {
		return groupTabBoardMapper.getBoardBySearch(map);
	}

	@Override
	public void updateBView(Long gbnum) {
		groupTabBoardMapper.updateBView(gbnum);
	}

}
