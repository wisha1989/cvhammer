package entity;

import java.util.Date;


public class UExpItemEnt {
	private String uPoneNum;
	private String eName;
	private String eSrcs;
	private String eRess;
	private String eParams;
	private Date eTime;
	private String eRessType;
	private String[] eResImgList;
	
	
	public UExpItemEnt() {
		
	}
	public UExpItemEnt(String uPoneNum, String eName, String eSrcs, String eRess,
			String eParams, Date eTime,String eRessType) {
		this.uPoneNum = uPoneNum;
		this.eName = eName;
		this.eSrcs = eSrcs;
		this.eRess = eRess;
		this.eParams = eParams;
		this.eTime = eTime;
		this.eRessType=eRessType;
	}
	@Override
	public String toString() {
		return "ExpItem [uPoneNum=" + uPoneNum + ", eName=" + eName
				+ ", eSrcs=" + eSrcs + ", eRess=" + eRess + ", eParams="
				+ eParams + ", eTime=" + eTime + ",eRessType="+eRessType+"]";
	}
	public String geteRessType() {
		return eRessType;
	}
	public void seteRessType(String eRessType) {
		this.eRessType = eRessType;
	}
	public String getuPoneNum() {
		return uPoneNum;
	}
	public void setuPoneNum(String uPoneNum) {
		this.uPoneNum = uPoneNum;
	}
	public String geteName() {
		return eName;
	}
	public void seteName(String eName) {
		this.eName = eName;
	}
	public String geteSrcs() {
		return eSrcs;
	}
	public void seteSrcs(String eSrcs) {
		this.eSrcs = eSrcs;
	}
	public String geteRess() {
		return eRess;
	}
	public void seteRess(String eRess) {
		this.eRess = eRess;
	}
	public String geteParams() {
		return eParams;
	}
	public void seteParams(String eParams) {
		this.eParams = eParams;
	}
	public Date geteTime() {
		return eTime;
	}
	public void seteTime(Date eTime) {
		this.eTime = eTime;
	}
	public String[] geteResImgList() {
		return eResImgList;
	}
	public void seteResImgList(String eRess){
	   this.eResImgList=eRess.split("\n");
	   System.out.println(this.eResImgList.toString());
		
	}

}
