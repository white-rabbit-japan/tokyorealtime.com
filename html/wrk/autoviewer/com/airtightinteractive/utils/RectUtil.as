/**
 * Performs common rectangle drawing functions
 * @author Felix Turner
 */
class com.airtightinteractive.utils.RectUtil {
	
	
	/**
	 * Draws a rectangle
	 */
	static function rectangle(clip_mc:MovieClip, x1:Number, y1:Number, x2:Number, y2:Number):Void {
		
		clip_mc.moveTo(x1,y1);
		clip_mc.lineTo(x2,y1);
		clip_mc.lineTo(x2,y2);
		clip_mc.lineTo(x1,y2);
		clip_mc.lineTo(x1,y1);
	}
	
	/**
	 * Draws a hollow rectangle
	 */
	static function hollowRectangle(clip_mc:MovieClip,x1:Number,y1:Number,x2:Number,y2:Number,frameWidth:Number){
		rectangle(clip_mc, x1,y1,x2,y2);	
		rectangle(clip_mc, x1+frameWidth,y1+frameWidth,x2-frameWidth,y2-frameWidth);
	}
	
}