package service.export;

import java.util.List;

import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import backend.entities.*;
import service.config.ResponseConfig;
import service.object.AgentService;
import service.object.NotificationService;

@Path("notification")
public class NotificationRestful {
	
	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/getnotiinboxbytoken")
	public Response GetAgentByUserId(String jsondata)
	{
		try
		{
			NotificationService as = new NotificationService();
			List<Notification_From> not = as.getinboxbytoken(jsondata);
					
			if(not != null)
				return ResponseConfig.OK(new GenericEntity<List<Notification_From>>(not){});
			else
				return ResponseConfig.NOT_FOUND();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return ResponseConfig.SERVER_ERROR();
		}
	} 
	
	
}

