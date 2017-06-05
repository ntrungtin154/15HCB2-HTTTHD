package service.config;

import java.util.Set;

import javax.ws.rs.core.Application;

import service.export.AgentRestful;
import service.export.MerchantRestful;
import service.export.NotificationRestful;
import service.export.UserRestful;


@javax.ws.rs.ApplicationPath("rest")
public class ApplicationConfig extends Application {
	
	@Override
	public Set<Class<?>> getClasses()
	{
		Set<Class<?>> resources = new java.util.HashSet<Class<?>>();
		addRestResourceClass(resources);
		return resources;		
	}
	
	private void addRestResourceClass(Set<Class<?>> resources)
	{
		resources.add(UserRestful.class);	
		resources.add(AgentRestful.class);	
		resources.add(MerchantRestful.class);
		resources.add(NotificationRestful.class);
	}
}
