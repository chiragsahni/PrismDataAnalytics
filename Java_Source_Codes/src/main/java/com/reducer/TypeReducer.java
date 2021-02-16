package prismdataanalytics;

import java.io.IOException;
import java.util.Iterator;
import java.util.logging.Level;

import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.Mongo;

public class TypeReducer extends Reducer<Text, DoubleWritable, Text, DoubleWritable>{

    @Override
    protected void reduce(Text key, Iterable<DoubleWritable> values,
            Context context)
            throws IOException, InterruptedException {
    	
    	java.util.logging.Logger.getLogger("org.mongodb.driver").setLevel(Level.SEVERE);
 
    	Mongo mongo=ConnectionSingleton.Connection();
		DB db = mongo.getDB("ServiceSource");
		DBCollection created_by  = db.getCollection("Type");
    
        double sum = 0,count=0;
        Iterator<DoubleWritable> valuesIt = values.iterator();
        while(valuesIt.hasNext()){
            sum = sum +valuesIt.next().get();
                         
        }
        
        BasicDBObject db_obj = new BasicDBObject();
    	
        
		db_obj.put("X",(key.toString()));
		db_obj.put("Y",sum);
		
		created_by.insert(db_obj);
        
        context.write(key, new DoubleWritable(sum));
    }    
}	