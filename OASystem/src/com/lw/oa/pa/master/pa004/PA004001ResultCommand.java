package com.lw.oa.pa.master.pa004;

import java.io.Serializable;

public class PA004001ResultCommand implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// 更新日
	private String updatetime;
	// 排他标识
	private String exclusivefg;
	// 区域id
	private String regionid;
	// 区域id业务字典
	private String regioniddict;	
	// 机构id
	private String orgcdid;
	// 机构全称
	private String orgname;
	// 机构简称
	private String orgshortname;
	// 地址
	private String address;
	// Tel
	private String tel;
	// Fax
	private String fax;
	// 邮编
	private String zipcode;
	// 有效期
	private String effectivedate;
	// 排序no
	private String sortno;
	// 备注1
	private String remark1;
	// 备注2
	private String remark2;
	
	public String getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}

	public String getExclusivefg() {
		return exclusivefg;
	}

	public void setExclusivefg(String exclusivefg) {
		this.exclusivefg = exclusivefg;
	}

	public String getRegionid() {
		return regionid;
	}

	public void setRegionid(String regionid) {
		this.regionid = regionid;
	}

	public String getRegioniddict() {
		return regioniddict;
	}

	public void setRegioniddict(String regioniddict) {
		this.regioniddict = regioniddict;
	}

	public String getOrgcdid() {
		return orgcdid;
	}

	public void setOrgcdid(String orgcdid) {
		this.orgcdid = orgcdid;
	}

	public String getOrgname() {
		return orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}

	public String getOrgshortname() {
		return orgshortname;
	}

	public void setOrgshortname(String orgshortname) {
		this.orgshortname = orgshortname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getEffectivedate() {
		return effectivedate;
	}

	public void setEffectivedate(String effectivedate) {
		this.effectivedate = effectivedate;
	}

	public String getSortno() {
		return sortno;
	}

	public void setSortno(String sortno) {
		this.sortno = sortno;
	}

	public String getRemark1() {
		return remark1;
	}

	public void setRemark1(String remark1) {
		this.remark1 = remark1;
	}

	public String getRemark2() {
		return remark2;
	}

	public void setRemark2(String remark2) {
		this.remark2 = remark2;
	}

}
