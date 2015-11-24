/****************************************************************************
* Copyright (C) 2008 Airtight Interactive. All Rights Reserved.
* Usage of this code is subject to the Terms of Use accompanying
* this product.
****************************************************************************/

import mx.utils.Delegate;
import mx.transitions.Tween;
import com.airtightinteractive.apps.viewers.autoViewer.Options;

/**
 * Generic rollover button. Button shift on press/release.
 * 
 * @author Felix Turner
 */
class com.airtightinteractive.apps.viewers.autoViewer.RolloverButton {
	
	private var mClip_mc:MovieClip;
	private var mEnabled:Boolean;
	private var mVisible:Boolean;	
	private var mFadeTwn:Tween;
	private var mDown:Boolean;
	
	function RolloverButton(symbolName:String,target:MovieClip){
		
		mClip_mc = target.attachMovie(symbolName,symbolName,target.getNextHighestDepth());							
		mClip_mc.onPress = Delegate.create(this,onPress);
		mClip_mc.onRelease = Delegate.create(this,onRelease);
		mClip_mc.onReleaseOutside = Delegate.create(this,onReleaseOutside);
		mEnabled = true;
		mVisible = false;
		mClip_mc._alpha = 0;
		mDown = false;
	}
	
	public function onPress(){
		if (!mEnabled) return;
		mDown = true;
		mClip_mc._x += 1;
		mClip_mc._y += 1;							
	}
		
	public function onRelease(){
		if (!mEnabled) return;
		mClip_mc._x -= 1;
		mClip_mc._y -= 1;
		mDown = false;
		doAction();		
	}	
	
	public function onReleaseOutside(){
		if (!mEnabled) return;
		mClip_mc._x -= 1;
		mClip_mc._y -= 1;	
		mDown = false;
	}	
	
	public function doAction(){			
	}
	
	public function setBtnPosn(x:Number,y:Number):Void{		
		mClip_mc._x = x;
		mClip_mc._y = y;			
	}
			
	public function set buttonFrame(f:Number){
		mClip_mc.mcBtn.gotoAndStop(f);
	}
	
	public function get width():Number{
		return mClip_mc.mcBtn._width; 	
	}
	
	public function get height():Number{
		return mClip_mc.mcBtn._height; 	
	}
	
	public function setEnabled(enabled:Boolean){
	
		mEnabled = enabled;				
		if (!enabled) doShow(false); //always hide disabled buttons		
		mClip_mc.useHandCursor = mEnabled;
		
		if (!Options.hideControlsOnRollOut) show(enabled);
	}
	
	/**
	* Called to show/hide buttons on mouse movement
	*/
	public function show(show:Boolean){
		
		if (!mEnabled) return;//ignore if disabled
		if (mClip_mc.hitTest(_root._xmouse,_root._ymouse) && show == false)	return; //ignore hide if mouseover			
		doShow(show);					
	}	
	
	public function doShow(show:Boolean){
		
		if (show == mVisible) return; //ignore if no change
		
		//do show tween
		if (show) {
			new Tween(mClip_mc, "_alpha", null, 0, 95, 5, false);		
		}else{
			new Tween(mClip_mc, "_alpha", null, 95, 0, 5, false);
		}
		
		mVisible = show;		
	}
	
	
}