package backend.dal;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import backend.config.DBContext;
import backend.entities.Notification;
import backend.entities.Notification_From;
import backend.entities.User;
import backend.helpers.JavaHelpers;

public class NotificationDAL {

	private static Connection conn = DBContext.getConnect();
	
	
	
	public static List<Notification_From> getinboxbytoken(String token)
	{
		Notification_From td = null;
		List<Notification_From> list = new ArrayList<Notification_From>();
		try
		{
			String sql = "{call sp_GetNotification_inbox(?)}";
			CallableStatement pre = conn.prepareCall(sql);
            
            pre.setString(1, token);
	        
	        ResultSet rs = pre.executeQuery();
	        
	        while(rs.next())
	        {
	        	td = new Notification_From();
	        	DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
	        	
	        	
	        	
	            td.setNotificationId(rs.getInt("NotificationId"));
	            
	            String StringtDate = df.format(rs.getDate("NotificationTime"));
	            td.setNotificationTime(StringtDate);
	            td.setFromMerchant(rs.getInt("FromMerchant"));
	            td.setFromAgent(rs.getInt("FromAgent"));
	            td.setFromMaster(rs.getInt("FromMaster"));
	            td.setToMerchant(rs.getInt("ToMerchant"));
	            td.setToAgent(rs.getInt("ToAgent"));
	            td.setToMaster(rs.getInt("ToMaster"));
	            td.setMessage(rs.getString("Message"));
	            td.setIsSeen(rs.getInt("IsSeen"));
	            td.setSenttFrom(rs.getString("SentFrom"));
	            list.add(td);
	        }
	     
	        return list;
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			return list;
		}

	}
	
	
	
}
