/*
	Commonly used Drawing methods
	@author 
	
*/

class com.airtightinteractive.utils.DrawUtil {
	
	/**
	* wedge()
	*	
	* x, y = center point of the wedge.
	* startAngle = starting angle in degrees.
	* arc = sweep of the wedge. Negative values draw clockwise.
	* radius = radius of wedge. If [optional] yRadius is defined, then radius is the x radius.
	* yRadius = [optional] y radius for wedge.
	*  
	*/
	
	static function wedge(clip_mc:MovieClip,x:Number, y:Number, startAngle:Number, arc:Number, radius:Number, yRadius:Number) {
		
		/*
		if (arguments.length<5) {
			return;
		}
		*/
		// move to x,y position
		clip_mc.moveTo(x, y);
		
		// if yRadius is undefined, yRadius = radius
		if (yRadius == undefined) {
			yRadius = radius;
		}
		
		// Init vars
		var segAngle, theta, angle, angleMid, segs, ax, ay, bx, by, cx, cy;
		
		// limit sweep to reasonable numbers
		if (Math.abs(arc)>360) {
			arc = 360;
		}
		
		// Flash uses 8 segments per circle, to match that, we draw in a maximum
		// of 45 degree segments. First we calculate how many segments are needed
		// for our arc.
		segs = Math.ceil(Math.abs(arc)/45);
		
		// Now calculate the sweep of each segment.
		segAngle = arc/segs;
		
		// The math requires radians rather than degrees. To convert from degrees
		// use the formula (degrees/180)*Math.PI to get radians.
			theta = -(segAngle/180)*Math.PI;
			
		// convert angle startAngle to radians
		angle = -(startAngle/180)*Math.PI;
		
		// draw the curve in segments no larger than 45 degrees.
		if (segs>0) {
			
			// draw a line from the center to the start of the curve
			ax = x+Math.cos(startAngle/180*Math.PI)*radius;
			ay = y+Math.sin(-startAngle/180*Math.PI)*yRadius;
			clip_mc.lineTo(ax, ay);
			
			// Loop for drawing curve segments
			for (var i = 0; i<segs; i++) {
				angle += theta;
				angleMid = angle-(theta/2);
				bx = x+Math.cos(angle)*radius;
				by = y+Math.sin(angle)*yRadius;
				cx = x+Math.cos(angleMid)*(radius/Math.cos(theta/2));
				cy = y+Math.sin(angleMid)*(yRadius/Math.cos(theta/2));
				clip_mc.curveTo(cx, cy, bx, by);
			}
			
			// close the wedge by drawing a line to the center
			clip_mc.lineTo(x, y);
			
		}
		
	}
		
	static function roundedRectangle(clip_mc:MovieClip, x:Number, y:Number, x2:Number, y2:Number,cornerRadius:Number):Void {
	
	if (arguments.length<4) {
		return;
	}
	
	var w = x2 - x;
	var h = y2 - y;
	
	// if the user has defined cornerRadius our task is a bit more complex. :)
	if (cornerRadius>0) {
		// init vars
		var theta, angle, cx, cy, px, py;
		// make sure that w + h are larger than 2*cornerRadius
		if (cornerRadius>Math.min(w, h)/2) {
			cornerRadius = Math.min(w, h)/2;
		}
		// theta = 45 degrees in radians
		theta = Math.PI/4;
		// draw top line
		clip_mc.moveTo(x+cornerRadius, y);
		clip_mc.lineTo(x+w-cornerRadius, y);
		//angle is currently 90 degrees
		angle = -Math.PI/2;
		// draw tr corner in two parts
		cx = x+w-cornerRadius+(Math.cos(angle+(theta/2))*cornerRadius/Math.cos(theta/2));
		cy = y+cornerRadius+(Math.sin(angle+(theta/2))*cornerRadius/Math.cos(theta/2));
		px = x+w-cornerRadius+(Math.cos(angle+theta)*cornerRadius);
		py = y+cornerRadius+(Math.sin(angle+theta)*cornerRadius);
		clip_mc.curveTo(cx, cy, px, py);
		angle += theta;
		cx = x+w-cornerRadius+(Math.cos(angle+(theta/2))*cornerRadius/Math.cos(theta/2));
		cy = y+cornerRadius+(Math.sin(angle+(theta/2))*cornerRadius/Math.cos(theta/2));
		px = x+w-cornerRadius+(Math.cos(angle+theta)*cornerRadius);
		py = y+cornerRadius+(Math.sin(angle+theta)*cornerRadius);
		clip_mc.curveTo(cx, cy, px, py);
		// draw right line
		clip_mc.lineTo(x+w, y+h-cornerRadius);
		// draw br corner
		angle += theta;
		cx = x+w-cornerRadius+(Math.cos(angle+(theta/2))*cornerRadius/Math.cos(theta/2));
		cy = y+h-cornerRadius+(Math.sin(angle+(theta/2))*cornerRadius/Math.cos(theta/2));
		px = x+w-cornerRadius+(Math.cos(angle+theta)*cornerRadius);
		py = y+h-cornerRadius+(Math.sin(angle+theta)*cornerRadius);
		clip_mc.curveTo(cx, cy, px, py);
		angle += theta;
		cx = x+w-cornerRadius+(Math.cos(angle+(theta/2))*cornerRadius/Math.cos(theta/2));
		cy = y+h-cornerRadius+(Math.sin(angle+(theta/2))*cornerRadius/Math.cos(theta/2));
		px = x+w-cornerRadius+(Math.cos(angle+theta)*cornerRadius);
		py = y+h-cornerRadius+(Math.sin(angle+theta)*cornerRadius);
		clip_mc.curveTo(cx, cy, px, py);
		// draw bottom line
		clip_mc.lineTo(x+cornerRadius, y+h);
		// draw bl corner
		angle += theta;
		cx = x+cornerRadius+(Math.cos(angle+(theta/2))*cornerRadius/Math.cos(theta/2));
		cy = y+h-cornerRadius+(Math.sin(angle+(theta/2))*cornerRadius/Math.cos(theta/2));
		px = x+cornerRadius+(Math.cos(angle+theta)*cornerRadius);
		py = y+h-cornerRadius+(Math.sin(angle+theta)*cornerRadius);
		clip_mc.curveTo(cx, cy, px, py);
		angle += theta;
		cx = x+cornerRadius+(Math.cos(angle+(theta/2))*cornerRadius/Math.cos(theta/2));
		cy = y+h-cornerRadius+(Math.sin(angle+(theta/2))*cornerRadius/Math.cos(theta/2));
		px = x+cornerRadius+(Math.cos(angle+theta)*cornerRadius);
		py = y+h-cornerRadius+(Math.sin(angle+theta)*cornerRadius);
		clip_mc.curveTo(cx, cy, px, py);
		// draw left line
		clip_mc.lineTo(x, y+cornerRadius);
		// draw tl corner
		angle += theta;
		cx = x+cornerRadius+(Math.cos(angle+(theta/2))*cornerRadius/Math.cos(theta/2));
		cy = y+cornerRadius+(Math.sin(angle+(theta/2))*cornerRadius/Math.cos(theta/2));
		px = x+cornerRadius+(Math.cos(angle+theta)*cornerRadius);
		py = y+cornerRadius+(Math.sin(angle+theta)*cornerRadius);
		clip_mc.curveTo(cx, cy, px, py);
		angle += theta;
		cx = x+cornerRadius+(Math.cos(angle+(theta/2))*cornerRadius/Math.cos(theta/2));
		cy = y+cornerRadius+(Math.sin(angle+(theta/2))*cornerRadius/Math.cos(theta/2));
		px = x+cornerRadius+(Math.cos(angle+theta)*cornerRadius);
		py = y+cornerRadius+(Math.sin(angle+theta)*cornerRadius);
		clip_mc.curveTo(cx, cy, px, py);
	} else {
		// cornerRadius was not defined or = 0. clip_mc makes it easy.
		clip_mc.moveTo(x, y);
		clip_mc.lineTo(x+w, y);
		clip_mc.lineTo(x+w, y+h);
		clip_mc.lineTo(x, y+h);
		clip_mc.lineTo(x, y);
	}
};	
	
}