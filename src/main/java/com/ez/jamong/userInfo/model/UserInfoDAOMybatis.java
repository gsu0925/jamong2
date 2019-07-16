package com.ez.jamong.userInfo.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.jamong.common.SearchVO;

@Repository
public class UserInfoDAOMybatis implements UserInfoDAO{
	@Autowired private SqlSession session;
	private String namespace="config.mybatis.mapper.oracle.userInfo.";
	@Override
	public List<Map<String, Object>> selectUserInfoSearch(SearchVO searchVo) {
		return session.selectList(namespace+"selectUserInfoSearch", searchVo);
	}

	@Override
	public int selectTotalCount(SearchVO searchVo) {
		return session.selectOne(namespace+"selectTotalCount",searchVo);
	}

	@Override
	public int memberInactiveByUserNo(int userNo) {
		return session.update(namespace+"memberInactiveByUserNo",userNo);
	}

	@Override
	public int memberActiveByUserNo(int userNo) {
		return session.update(namespace+"memberActiveByUserNo",userNo);
	}

	@Override
	public int registUser(UserInfoVO vo) {
		return session.insert(namespace+"registUser",vo);
	}

	@Override
	public int existUser(String userid) {
		return session.selectOne(namespace+"existUser",userid);
	}

	@Override
	public String selectForUserLogin(String userid) {
		return session.selectOne(namespace+"selectForUserLogin",userid);
	}

	@Override
	public UserInfoVO selectUser(String userid) {
		return session.selectOne(namespace+"selectUser",userid);
	}
	
}
