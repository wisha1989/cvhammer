package entity;
import java.util.Date;

/**
 * 
 * @author lulufong
 *class �û�ע��
 *param: uId ע���Ψһ��ţ�uPone ע���ʮһλ�ֻ����� �� uPassword 6-10Ϊ��ĸ��������ɵ�����
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
