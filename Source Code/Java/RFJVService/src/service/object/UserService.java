package service.object;

import java.util.List;

import org.codehaus.jettison.json.JSONObject;

import backend.dal.UserDAL;
import backend.entities.User;
import service.interfaces.IUserService;

public class UserService implements IUserService<User> {

	//use Singleton Patern - Begin
	private static UserService instance = null;
	
	private UserService()
	{
		
	}
	
	public static UserService getInstance()
	{
		if(instance == null)
			instance = new UserService();
		
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
	public User get(String jsondata) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User> getall() throws Exception {
		// TODO Auto-generated method stub
		return UserDAL.getListUser();
	}

	@Override
	public User checklogin(String jsondata) throws Exception {
		// TODO Auto-generated method stub
		JSONObject jo = new JSONObject(jsondata);
		String user = jo.getString("username");
		String pass = jo.getString("password");
		User us = UserDAL.checkLogin(user, pass);
		return us;
	}

	@Override
	public User checkSessionLogin(String jsondata) throws Exception {
		// TODO Auto-generated method stub
		JSONObject jo = new JSONObject(jsondata);
		String token = jo.getString("token");
		User us = UserDAL.checkSessionLogin(token);
		return us;
	}

	@Override
	public boolean checkLogout(String jsondata) throws Exception {
		// TODO Auto-generated method stub
		JSONObject jo = new JSONObject(jsondata);
		String token = jo.getString("token");
		boolean rs = UserDAL.checkLogout(token);
		return rs;
	}
	
	@Override
	public Boolean checkChangePaswword(String jsondata) throws Exception {
		// TODO Auto-generated method stub
		JSONObject jo = new JSONObject(jsondata);
		String token = jo.getString("token");
		String password_old = jo.getString("password_old");
		String password_new = jo.getString("password_new");
		Boolean rs = UserDAL.checkChangePassword(token, password_old, password_new);
		return rs;
	}

}
