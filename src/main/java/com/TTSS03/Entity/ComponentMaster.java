package com.TTSS03.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "bdg_component_master")
public class ComponentMaster {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int sl;
	private String resources;
	private String resourceType;
	private String description;
	private String createdBy;
	private String modifiedBy;
	private String createdDt;
	private String modifiedDt;
	private String recordStatus="Active";
	private int resourceCode;
	public int getSl() {
		return sl;
	}
	public void setSl(int sl) {
		this.sl = sl;
	}
	public String getResources() {
		return resources;
	}
	public void setResources(String resources) {
		this.resources = resources;
	}
	public String getResourceType() {
		return resourceType;
	}
	public void setResourceType(String resourceType) {
		this.resourceType = resourceType;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public String getModifiedBy() {
		return modifiedBy;
	}
	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}
	public String getCreatedDt() {
		return createdDt;
	}
	public void setCreatedDt(String createdDt) {
		this.createdDt = createdDt;
	}
	public String getModifiedDt() {
		return modifiedDt;
	}
	public void setModifiedDt(String modifiedDt) {
		this.modifiedDt = modifiedDt;
	}
	public String getRecordStatus() {
		return recordStatus;
	}
	public void setRecordStatus(String recordStatus) {
		this.recordStatus = recordStatus;
	}
	public int getResourceCode() {
		return resourceCode;
	}
	public void setResourceCode(int resourceCode) {
		this.resourceCode = resourceCode;
	}
	@Override
	public String toString() {
		return "ComponentMaster [sl=" + sl + ", resources=" + resources + ", resourceType=" + resourceType
				+ ", description=" + description + ", createdBy=" + createdBy + ", modifiedBy=" + modifiedBy
				+ ", createdDt=" + createdDt + ", modifiedDt=" + modifiedDt + ", recordStatus=" + recordStatus
				+ ", resourceCode=" + resourceCode + "]";
	}

	
	
	// Constructors, getters, and setters
}
