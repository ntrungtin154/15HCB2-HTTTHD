package service.object;

import java.util.List;

import org.codehaus.jettison.json.JSONObject;

import backend.dal.NotificationDAL;
import backend.dal.UserDAL;
import backend.entities.Notification;
import backend.entities.Notification_From;
import backend.entities.User;
import service.interfaces.INotificationService;
import service.interfaces.IUserService;

public class NotificationService implements INotificationService<Notification> {

	//use Singleton Patern - Begin
	private static NotificationService instance = null;
	
	public NotificationService()
	{
		
	}
	
	public static NotificationService getInstance()
	{
		if(instance == null)
			instance = new NotificationService();
		
		return instance;
	}
	//use Singleton Patern - End
	
	@Override
	public int create(String jsondata) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(String jsondata) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String jsondata) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Notification get(String jsondata) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	

	@Override
	public List<Notification_From> getinboxbytoken(String jsondata) throws Exception {		
		JSONObject jo = new JSONObject(jsondata);
		String token = jo.getString("token");
		List<Notification_From> us = NotificationDAL.getinboxbytoken(token);
		return us;
	}

	@Override
	public List<Notification> getall() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	

}

