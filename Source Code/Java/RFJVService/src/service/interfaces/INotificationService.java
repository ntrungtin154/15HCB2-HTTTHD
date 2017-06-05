package service.interfaces;
import java.util.List;

import backend.entities.Notification;
import backend.entities.Notification_From;

public interface INotificationService<T> extends IGenericService<T> {
	 public List<Notification_From> getinboxbytoken(String jsondata) throws Exception;
}