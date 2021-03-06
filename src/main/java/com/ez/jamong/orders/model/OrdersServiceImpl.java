package com.ez.jamong.orders.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ez.jamong.common.DateSearchVO;

@Service
public class OrdersServiceImpl implements OrdersService{
	@Autowired private OrdersDAO ordersDao;

	@Override
	public int insertOrders(OrdersVO orderVo) {
		return ordersDao.insertOrders(orderVo);
	}

	@Override
	public List<Map<String, Object>> selectByUserNo(DateSearchVO dateSearchVo) {
		return ordersDao.selectByUserNo(dateSearchVo);
	}

	@Override
	public int selectTotalRecord(DateSearchVO dateSearchVo) {
		return ordersDao.selectTotalRecord(dateSearchVo);
	}

	@Override
	public List<Map<String, Object>> expertSelectByUserNo(DateSearchVO dateSearchVo) {
		return ordersDao.expertSelectByUserNo(dateSearchVo);
	}

	@Override
	public int expertSelectTotalRecord(DateSearchVO dateSearchVo) {
		return ordersDao.expertSelectTotalRecord(dateSearchVo);
	}

	@Override
	public int updateProgressByOrderNo(OrdersVO ordersVo) {
		return ordersDao.updateProgressByOrderNo(ordersVo);
	}

	@Override
	public List<Map<String, Object>> selectSellerStatistics(int sellerNo) {
		return ordersDao.selectSellerStatistics(sellerNo);
	}
	@Override
	public List<Map<String, Object>> selectSellerStatisticsYear(int sellerNo) {
		return ordersDao.selectSellerStatisticsYear(sellerNo);
	}
	@Override
	public String userTotalPrice(int userNo) {
		return ordersDao.userTotalPrice(userNo);
	}

	@Override
	public int updateUserAuthority(int userNo) {
		return ordersDao.updateUserAuthority(userNo);
	}
}
