package backend.entities;

import javax.xml.bind.annotation.XmlRootElement;

import com.sun.xml.internal.txw2.annotation.XmlElement;
@XmlRootElement
public class Notification_From extends Notification {
	private String SenttFrom;
	
	@XmlElement
	public String getSenttFrom() {
		return SenttFrom;
	}

	public void setSenttFrom(String senttFrom) {
		SenttFrom = senttFrom;
	} 
}	
