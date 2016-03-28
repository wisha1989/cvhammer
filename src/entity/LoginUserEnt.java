package entity;
import java.util.Date;

/**
 * 
 * @author lulufong
 *class 用户注册
 *param: uId 注册的唯一编号；uPone 注册的十一位手机号码 ； uPassword 6-10为字母或数字组成的密码
 */
public class LoginUserEnt {
private String uPoneNum;
private String uPassword;
private Date uTime;

public  LoginUserEnt() {
	
}
public  LoginUserEnt(String uPoneNum, String uPassword) {
	//super();
	this.uPoneNum = uPoneNum;
	this.uPassword = uPassword;
}
public String getuPoneNum() {
	return uPoneNum;
}
public void setuPoneNum(String uPoneNum) {
	this.uPoneNum = uPoneNum;
}
public String getuPassword() {
	return uPassword;
}
public void setuPassword(String uPassword) {
	this.uPassword = uPassword;
}
public Date getuTime() {
	return uTime;
}
public void setuTime(Date uTime) {
	this.uTime = uTime;
}
@Override
public String toString() {
	return "LoginUser [uPoneNum=" + uPoneNum
			+ ", uPassword=" + uPassword + ", uTime=" + uTime + "]";
}
}
