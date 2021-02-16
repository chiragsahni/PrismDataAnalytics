package prismdataanalytics;

import com.mongodb.Mongo;

public class ConnectionSingleton {
	static Mongo  mongo=null;
	public static Mongo Connection() {
		

		if(mongo==null)
		{
		 mongo = new Mongo("localhost", 27017);
		}
		return mongo;
		// TODO Auto-generated constructor stub
	}

	
}
