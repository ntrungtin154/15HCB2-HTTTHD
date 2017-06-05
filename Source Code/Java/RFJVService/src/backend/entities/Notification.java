package backend.entities;
import java.sql.Date;

import javax.xml.bind.annotation.XmlRootElement;

import com.sun.xml.internal.txw2.annotation.XmlElement;

@XmlRootElement
public class Notification {
	@XmlElement
	public int getNotificationId() {
		return NotificationId;
	}

	public void setNotificationId(int notificationId) {
		NotificationId = notificationId;
	}
	@XmlElement
	public String getNotificationTime() {
		return NotificationTime;
	}

	public void setNotificationTime(String notificationTime) {
		NotificationTime = notificationTime;
	}
	@XmlElement
	public int getFromMerchant() {
		return FromMerchant;
	}

	public void setFromMerchant(int fromMerchant) {
		FromMerchant = fromMerchant;
	}
	@XmlElement
	public int getFromAgent() {
		return FromAgent;
	}

	public void setFromAgent(int fromAgent) {
		FromAgent = fromAgent;
	}
	@XmlElement
	public int getFromMaster() {
		return FromMaster;
	}

	public void setFromMaster(int fromMaster) {
		FromMaster = fromMaster;
	}
	@XmlElement
	public int getToMerchant() {
		return ToMerchant;
	}

	public void setToMerchant(int toMerchant) {
		ToMerchant = toMerchant;
	}
	@XmlElement
	public int getToAgent() {
		return ToAgent;
	}

	public void setToAgent(int toAgent) {
		ToAgent = toAgent;
	}
	@XmlElement
	public int getToMaster() {
		return ToMaster;
	}

	public void setToMaster(int toMaster) {
		ToMaster = toMaster;
	}
	@XmlElement
	public String getMessage() {
		return Message;
	}

	public void setMessage(String message) {
		Message = message;
	}
	@XmlElement
	public int getIsSeen() {
		return IsSeen;
	}

	public void setIsSeen(int isSeen) {
		IsSeen = isSeen;
	}

	private int NotificationId;					
	private String NotificationTime;
	private int FromMerchant;
	private int FromAgent;
	private int FromMaster;
	private int ToMerchant;
	private int ToAgent;
	private int ToMaster;
	private String Message;
	private int IsSeen;
	
	public Notification() {
		super();
		// TODO Auto-generated constructor stub
	}
}
