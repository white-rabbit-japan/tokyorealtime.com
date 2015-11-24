import flash.filters.DropShadowFilter;
import flash.filters.GlowFilter;
import flash.display.*;

/*
	Commonly used Effects methods
	@author 
	
*/

class com.airtightinteractive.utils.EffectsUtil {
	
	static function drawShadow(clip:MovieClip,distance:Number,strengthPercent:Number){
		//add drop shadow				
		var angleInDegrees:Number = 45;
		var color:Number = 0x000000;
		var alpha:Number = 1;
		var blurX:Number = 5;
		var blurY:Number = 5;
		var strength:Number = strengthPercent/100;
		var quality:Number = 1;
		var inner:Boolean = false;
		var knockout:Boolean = false;
		var hideObject:Boolean = false;
		
		var filter:DropShadowFilter = new DropShadowFilter(distance, 
		                                                    angleInDegrees, 
		                                                    color, 
		                                                    alpha, 
		                                                    blurX, 
		                                                    blurY, 
		                                                    strength, 
		                                                    quality, 
		                                                    inner, 
		                                                    knockout, 
		                                                    hideObject);	
		                                                    
		                                              	
		var f:Array = clip.filters;
		f.push(filter);
		clip.filters = f;	
						
	}	
	
	static function drawGlow(clip:MovieClip,blur:Number,strengthPercent:Number){
		//add glow
		var color:Number = 0x000000;
		var alpha:Number = 1;		
		var strength:Number = strengthPercent/100;
		var quality:Number = 1;		
		var inner:Boolean = false;
		var knockout:Boolean = false;
		
		var filter:GlowFilter = new GlowFilter(color, 
		                                        alpha, 
		                                        blur, 
		                                        blur, 
		                                        strength, 
		                                        quality, 
		                                        inner, 
		                                        knockout);
		                                        
		var f:Array = clip.filters;
		f.push(filter);
		clip.filters = f;
		
		
	}	
	
}