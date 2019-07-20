package com.dao;

import java.util.List;

import org.hibernate.Transaction;

import com.vo.CityMasterVo;
import com.vo.ProfileMasterVo;
import com.vo.SupportMasterVo;
import com.vo.UserMasterVo;

public class ProfileMasterDao {
	DBConnection connection = new DBConnection();

	public void addprofiledetail(ProfileMasterVo profileMasterVo) {
		connection.getConnection();
		Transaction transaction = connection.session.beginTransaction();
		connection.session.saveOrUpdate(profileMasterVo);
		transaction.commit();
		connection.session.close();
		
	}

	public List<CityMasterVo> listCity(String stateId) {
		connection.getConnection();
		List listCity = connection.session.createQuery("from CityMasterVo where stateId="+stateId).list();
		return listCity;
	}

	public List listallState() {
		connection.getConnection();
		List listallState = connection.session.createQuery("from StateMasterVo").list();
		return listallState;
	}

	public List listallCity() {
		connection.getConnection();
		List listallCity = connection.session.createQuery("from CityMasterVo").list();
		return listallCity;
	}

	public List profileDetail(ProfileMasterVo profileMasterVo) {
		connection.getConnection();
		List profileDetail = connection.session.createQuery("from ProfileMasterVo where  profileId="+profileMasterVo.getProfileId()).list();
		return profileDetail;
	}

	public List editProfile(ProfileMasterVo profileMasterVo) {
		connection.getConnection();
		List editProfile = connection.session.createQuery("from ProfileMasterVo where profileId="+profileMasterVo.getProfileId()).list();
		connection.session.close();
		return editProfile;
	}

	public void updateProfile(ProfileMasterVo profileMasterVo) {
		connection.getConnection();
		Transaction transaction = connection.session.beginTransaction();
		connection.session.update(profileMasterVo);
		transaction.commit();
		connection.session.close();
		
	}

	public List profileListDetail(ProfileMasterVo profileMasterVo) {
		connection.getConnection();
		List profileListDetail = connection.session.createQuery("from ProfileMasterVo where  profileId="+profileMasterVo.getProfileId()).list();
		return profileListDetail;
	}
	/*
	 * public List listProfile(ProfileMasterVo profileMasterVo) {
	 * connection.getConnection(); List listProfile =
	 * connection.session.createQuery("from ProfileMasterVo where ") return
	 * listProfile; }
	 */

	public void updateUser(UserMasterVo userMasterVo) {
		connection.getConnection();
		Transaction transaction = connection.session.beginTransaction();
		connection.session.update(userMasterVo);
		transaction.commit();
		connection.session.close();
		
	}

	public List checkProfile(ProfileMasterVo profileMasterVo) {
		connection.getConnection();
		List checkProfile = connection.session.createQuery("from ProfileMasterVo where  profileId="+profileMasterVo.getProfileId()).list();
		return checkProfile;
	}

	public List userProfile(ProfileMasterVo profileMasterVo) {
		connection.getConnection();
		List userProfile = connection.session.createQuery("from UserMasterVo where  userId="+profileMasterVo.getUserId().getUserId()).list();
		return userProfile;
	}


	
}
