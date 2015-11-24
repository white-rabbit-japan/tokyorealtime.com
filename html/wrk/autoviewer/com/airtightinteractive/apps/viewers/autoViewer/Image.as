/****************************************************************************
* Copyright (C) 2008 Airtight Interactive. All Rights Reserved.
* Usage of this code is subject to the Terms of Use accompanying
* this product.
****************************************************************************/

import mx.transitions.Tween;
import mx.utils.Delegate;

import com.airtightinteractive.apps.viewers.autoViewer.Options;
import com.airtightinteractive.apps.viewers.autoViewer.StageManager;
import com.airtightinteractive.apps.viewers.autoViewer.XMLManager;
import com.airtightinteractive.utils.DrawUtil;
import com.airtightinteractive.utils.EffectsUtil;
import com.airtightinteractive.utils.RectUtil;

import flash.geom.ColorTransform;
import flash.geom.Transform;

/**
 * One Image instance for each large image that is loaded into app. Handle Image loading + Transitions.
 * 
 * @author Felix Turner
 */

class com.airtightinteractive.apps.viewers.autoViewer.Image {
	
	private static var sTweenFunc = mx.transitions.easing.Strong.easeInOut;
	
	private var mStageManager:StageManager;
	private var mXMLManager:XMLManager;		
	private var mClip_mc:MovieClip;
	private var mcLoader:MovieClip;
	private var mcCaption:MovieClip;
	private var mImgLoadStatus_mc:MovieClip;	
	private var mFrame_mc:MovieClip;
	private var mError_mc:MovieClip;	
	private var loader_mcl:MovieClipLoader;	
	private var mIndex:Number;	
	private var mJPGWidth:Number; //width of orig JPG
	private var mJPGHeight:Number;
	private var mCaption:String;	
	private var mWidth:Number;
	private var mHeight:Number;		
	private var mLoaded:Boolean;
	private var mImageLoadError:Boolean;
	private var mClipTrans:Transform;
	private var mColorTrans:ColorTransform ;
	private var mColorTween:Tween;
	private var mCaptionTween:Tween;	
	private var imageURL:String;
	
	function Image(target:MovieClip, index:Number, imageURL:String, width:Number, height:Number, caption:String){
				
		mStageManager = StageManager.getInstance();
		mXMLManager = XMLManager.getInstance();				
		mIndex = index;		
		mJPGWidth = width  + mXMLManager.frameWidth*2;
		mJPGHeight = height + mXMLManager.frameWidth*2;
		mCaption =  caption;
		if (mCaption == "undefined" || mCaption == undefined){
			mCaption = "";
		}
		
		var d = target.getNextHighestDepth();
		mClip_mc = target.createEmptyMovieClip("image"+d,d);
		
		mLoaded = false;
		mImageLoadError = false;
		
		//Base MC
		mFrame_mc = mClip_mc.createEmptyMovieClip("frame",mClip_mc.getNextHighestDepth());	
					
		//start loading image
		mcLoader = mClip_mc.createEmptyMovieClip("loader",mClip_mc.getNextHighestDepth());	
		loader_mcl = new MovieClipLoader();
		loader_mcl.addListener(this);	
		
		if (Options.preloadAllImages){
			loader_mcl.loadClip(imageURL,mcLoader);			
		}
		
		this.imageURL = imageURL;
		
		mcLoader._x = mXMLManager.frameWidth;
		mcLoader._y = mXMLManager.frameWidth;
		
		mColorTrans = new ColorTransform();
		mClipTrans = new Transform(mcLoader);		
		
		mColorTween = new Tween(mcLoader,"offset",sTweenFunc,Options.initialBrightness,Options.initialBrightness,1,false);	
				
		mColorTween.onMotionChanged = Delegate.create(this,setColorOffset);		
		mColorTween.onMotionFinished = Delegate.create(this,onColorTweenDone);
				
		mcCaption  = mClip_mc.createEmptyMovieClip("caption",mClip_mc.getNextHighestDepth());		
		if (Options.showImageNumbers){
			mcCaption.attachMovie("Caption","mcIndex",mcCaption.getNextHighestDepth());
			mcCaption.mcIndex.txtCaption.html = true;		
			mcCaption.mcIndex.txtCaption.htmlText = "<font size='" + Options.imageNumberFontSize + "' "
															+ "color='" +  Options.imageNumberColor + "'>" 
															+ (index+1) + " / " + mStageManager.imageCount
															+ "</font>";	
		}		
		
		if (Options.showCaptions){			
			mcCaption.attachMovie("Caption","mcCaption",mcCaption.getNextHighestDepth());	
			mcCaption.mcCaption.txtCaption.html = true;
			mcCaption.mcCaption.txtCaption.wordWrap = true;
			mcCaption.mcCaption.txtCaption.multiline = true;
			mcCaption.mcCaption.txtCaption.autosize = true;		
			mcCaption.mcCaption.txtCaption.htmlText = mCaption;
		}
		
		mcCaption._x = Options.captionPadding + mXMLManager.frameWidth;
		mcCaption._y = Options.captionPadding + mXMLManager.frameWidth;
		
		mCaptionTween = new Tween(mcCaption,"_alpha",null,0,0,1,false);
		mImgLoadStatus_mc = mClip_mc.createEmptyMovieClip("mcLoadbar",mClip_mc.getNextHighestDepth());	
		EffectsUtil.drawShadow(mImgLoadStatus_mc,5,35);		
		EffectsUtil.drawGlow(mImgLoadStatus_mc,5,30);			
		new Tween(mImgLoadStatus_mc, "_alpha", mx.transitions.easing.None.easeNone, 0, 100, 5, false);					
	}
			
	function setColorOffset(){		
		mColorTrans.redOffset = mcLoader.offset;
		mColorTrans.blueOffset = mcLoader.offset;
		mColorTrans.greenOffset = mcLoader.offset;	
		mClipTrans.colorTransform = mColorTrans;
		
	}
	
	function onColorTweenDone(){
		if(mcLoader.offset == 0){
			mCaptionTween.continueTo(100,5);
		}
	}

	function onLoadProgress (target:MovieClip, bytesLoaded:Number, bytesTotal:Number):Void {
    	    	
    	var arc = -Math.round(100-percent)*3.6;		
		
    	//draw arc
    	var percent = (bytesLoaded/bytesTotal)*100;    	    	
    	mImgLoadStatus_mc.clear();	
		var arc = percent*3.6;
		var arc = -Math.round(100-percent)*3.6;
		mImgLoadStatus_mc.beginFill(mXMLManager.frameColor,95);
		DrawUtil.wedge(mImgLoadStatus_mc,mWidth/2, mHeight/2,90,-arc, 30);
		mImgLoadStatus_mc.endFill();	
    	
	}
	
	public function loadImage(){
		if (!mLoaded){
			loader_mcl.loadClip(imageURL,mcLoader);
		}
	}
	
	function onLoadInit(){
		
		mcLoader.forceSmoothing = Options.useSmoothing;
		mLoaded = true;		
		loader_mcl.removeListener(this);
		mImgLoadStatus_mc.clear();			
		setSize(mWidth,mHeight);
		new Tween(mFrame_mc, "_alpha", mx.transitions.easing.None.easeNone, 0, 100, 5, false);	
				
		if (mIndex == mStageManager.currentImageIndex){
			show();
		}else{
			hide();	
		}
	}
	
	function onLoadError(){
		
		mImgLoadStatus_mc.clear();	
		mImageLoadError = true;		
		mError_mc = mClip_mc.attachMovie("ErrorIcon","error",mClip_mc.getNextHighestDepth());					
		mError_mc._x = mWidth/2;
		mError_mc._y = mHeight/2;	
	}
	
	public function show(){
		if (!mLoaded) return;
		//fade up
		mColorTween.continueTo(0,Options.colorFadeAnimationLength);				
		
		mcLoader.onRelease = null;
		mcLoader.useHandCursor = false;
	}
	
	public function hide(){
		mColorTween.continueTo(Options.unselectedBrightness,Options.colorFadeAnimationLength);
		mCaptionTween.continueTo(0,1);
		
		mcLoader.onRelease = Delegate.create(this,onRelease);
		mcLoader.useHandCursor = true;
	}
	
	/**
	* When not selected, images act as nav buttons
	*/
	private function onRelease():Void{
		mStageManager.showImage(mIndex);		
	}
	
	public function setSize(w:Number,h:Number):Void{
		
		//scale proportionately		
		var imgAspect = w/h;
		var jpgAspect =  mJPGWidth/mJPGHeight;
						
		//image scaling
		mWidth = mJPGWidth;
		mHeight = mJPGHeight;
		
		//down scaling		
		if (Options.enableImageDownScaling){
			if (jpgAspect > imgAspect){			
				mWidth = Math.min(w,mJPGWidth);				
				mHeight = mJPGHeight *(mWidth/ mJPGWidth);					
			}else{
				mHeight = Math.min(h,mJPGHeight);				
				mWidth = mJPGWidth * (mHeight/mJPGHeight);
			}			
			mHeight = Math.round(mHeight);
			mWidth = Math.round(mWidth);		
		}
		
		//up scaling
		if (Options.enableImageUpScaling){ 
			if (jpgAspect > imgAspect){				
				mWidth = Math.max(w,mJPGWidth);					
				mHeight = mJPGHeight *(mWidth/ mJPGWidth);					
			}else{				
				mHeight = Math.max(h,mJPGHeight);					
				mWidth = mJPGWidth * (mHeight/mJPGHeight);
			}			
			mHeight = Math.round(mHeight);
			mWidth = Math.round(mWidth);	
		}		
							
		if (mLoaded){
			mcLoader._width = mWidth - mXMLManager.frameWidth*2;
			mcLoader._height = mHeight -  mXMLManager.frameWidth*2;

			mFrame_mc.clear();
			mFrame_mc.beginFill(mXMLManager.frameColor, 100);
			RectUtil.rectangle(mFrame_mc, 0,0,mWidth,mHeight);	
			mFrame_mc.endFill();
			
		}	
		
		var captionWidth = mWidth*3/4;
		var captionHeight = mHeight*3/4;
		mcCaption.mcCaption.txtCaption._width = captionWidth;
		mcCaption.mcCaption.txtCaption._height = captionHeight;
		//right align image numbers
		mcCaption.mcIndex.txtCaption._x = mWidth - (Options.captionPadding *2 + mcCaption.mcIndex.txtCaption.textWidth + mXMLManager.frameWidth*2) ;		
		
		mError_mc._x = mWidth/2;		
		mError_mc._y = mHeight/2;	
													
	}
		
	public function setPosn(x:Number,y:Number):Void{
		mClip_mc._x = x;
		mClip_mc._y = y;
	}
	
	function get width():Number{		
		return mWidth;		
	}
	
	function get height():Number{		
		return mHeight;		
	}
	
}