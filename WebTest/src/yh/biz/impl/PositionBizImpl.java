package yh.biz.impl;

import java.util.List;


import yh.biz.PositionBiz;
import yh.dao.PositionDao;
import yh.dao.impl.PositionDaoImpl;
import yh.entity.Position;

public class PositionBizImpl implements PositionBiz {
    private PositionDao positionDao = new PositionDaoImpl();
	@Override
	public List<Position> findAllPositions() {
		// TODO Auto-generated method stub
		return positionDao.findAllPositions();
	}

}
