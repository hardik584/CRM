package com.vo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="city_master")

public class CityMasterVo  implements Serializable{

	 
	private static final long serialVersionUID = 1L;

			@Id
		    @GeneratedValue(strategy = GenerationType.AUTO)
		    @Column(name = "city_id" , updatable = false, nullable = false)
		    int cityId;
			
			public int getCityId() {
				return cityId;
			}

			public void setCityId(int cityId) {
				this.cityId = cityId;
			}

			public String getCityName() {
				return cityName;
			}

			public void setCityName(String cityName) {
				this.cityName = cityName;
			}

			public StateMasterVo getStateId() {
				return stateId;
			}

			public void setStateId(StateMasterVo stateId) {
				this.stateId = stateId;
			}

			@Column(name = "city_name")
			String cityName;
			
		 	@ManyToOne
		    @JoinColumn(referencedColumnName="state_id",name="state_id")
			private StateMasterVo stateId;
				

}
