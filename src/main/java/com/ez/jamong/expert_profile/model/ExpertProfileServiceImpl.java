package com.ez.jamong.expert_profile.model;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExpertProfileServiceImpl implements ExpertProfileService{
	@Autowired private ExpertProfileDAO expertprofileDao;

	@Override
	public int saveProfile(ExpertProfileVO vo) {
		int result=expertprofileDao.findCount(vo.getExpertNo());
		if(result>0) {
			result=expertprofileDao.updateProfileMajor(vo);
		}else {
			result=expertprofileDao.insertProfile(vo);
		}
		return result;
	}

	@Override
	public ExpertProfileVO selectByExpertNo(int expertNo) {
		return expertprofileDao.selectByExpertNo(expertNo);
	}

	@Override
	public int updateLicense(Map<String, Object> map) {
		return expertprofileDao.updateLicense(map);
	}

	@Override
	public int updateCareer(Map<String, Object> map) {
		return expertprofileDao.updateCareer(map);
	}
	
	
}
