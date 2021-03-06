package prismdataanalytics;
import java.io.IOException;

import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.json.JSONException;
import org.json.JSONObject;

public class CreatedOnMapper extends Mapper<LongWritable, Text, Text, DoubleWritable>{
 
    private static DoubleWritable one ;
    private Text word = new Text();
    JSONObject obj;
    @Override
    protected void map(LongWritable key, Text value,
            Context context)
            throws IOException, InterruptedException {
        String line = value.toString();
        try {
              
			obj=new JSONObject(line);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
            try {
				JSONObject obj1=obj.getJSONObject("systemProperties");
				word.set((obj1.getString("createdOn".split("T")[0])));
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            one=new DoubleWritable(1);
            context.write(word,one);
        }
    }

