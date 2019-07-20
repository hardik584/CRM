package com.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

public class DBConnection {

	static AnnotationConfiguration annotationConfiguration;
	static SessionFactory sessionFactory;
	Session session;
	Transaction transaction;
	Query query;
	void getConnection()
	{
		
		
		annotationConfiguration = new AnnotationConfiguration();
		annotationConfiguration.configure("hibernate.cfg.xml");
		sessionFactory = annotationConfiguration.buildSessionFactory();
		session = sessionFactory.openSession();
	}
	
	

}