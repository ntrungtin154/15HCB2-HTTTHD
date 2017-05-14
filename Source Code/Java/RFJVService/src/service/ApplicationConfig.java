package service;

import java.util.Set;

import javax.ws.rs.core.Application;


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
	}
}
