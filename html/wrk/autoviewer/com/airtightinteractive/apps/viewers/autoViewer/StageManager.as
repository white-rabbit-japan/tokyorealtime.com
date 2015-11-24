/****************************************************************************
* Copyright (C) 2008 Airtight Interactive. All Rights Reserved.
* Usage of this code is subject to the Terms of Use accompanying
* this product.
****************************************************************************/

import mx.transitions.easing.Strong;
import mx.transitions.Tween;
import mx.utils.Delegate;

import com.airtightinteractive.apps.viewers.autoViewer.*;

/**
 * Main application class for AutoViewer. 
 * Handles stage layout, navigation.
 * For documentation on AutoViewer see: http://www.airtightinteractive.com/projects/autoviewer/pro
 * 
 * @author Felix Turner
 */

class com.airtightinteractive.apps.viewers.autoViewer.StageManager {
	
	private static var instance : StageManager;
	private static var IS_PRO:Boolean = true;
	private static var VERSION:String = "1.4";
	private static var sResizeTime:Number = 50;
	private static var linkURL:String = "http://www.airtightinteractive.com/projects/autoviewer/"; //URL used when download link is clicked
	
	private var mXMLManager : XMLManager;
	private var mClip_mc: MovieClip;
	private var mLogoBar_mc: MovieClip;	
	private var mNextBtn:RolloverButton;
	private var mBackBtn:RolloverButton;
	private var mPlayBtn:RolloverButton;
	private var mPlaying:Boolean;
	private var mPlay_int:Number;	
	private var mResize_int:Number;
	private var aImages:Array; //All images that have been loaded for this gallery
	private var aImageXPosns:Array;	
	private var mImageArea_mc:MovieClip;	
	private var mImageCount:Number = 0;	
	private var mCurrentImageIndex:Number;
	private var mShowControls_int:Number;
	private var mPagingTwn;//:Tween;	
	private var langAbout:String = "About";
	private var langOpenImage:String = "Open Image in New Window";		
	private var mCheckIdle_int:Number;
	private var mCheckIdleTime:Number = 1200;
	private var mIdleDistance:Number = 10;
	private var mLastMouseY:Number = 0;
	private var mLastMouseX:Number = 0;
		
	/**
	 * @return singleton instance of StageManager
	 */
	public static function getInstance() : StageManager {
		if (instance == null)
			instance = new StageManager();
		return instance;
	}
	
	private function StageManager() {		
	}
	
	public function init(target:MovieClip):Void{
		
		mXMLManager = XMLManager.getInstance();		
		
		mClip_mc = target;
		
		mImageArea_mc = mClip_mc.createEmptyMovieClip("imgArea",mClip_mc.getNextHighestDepth());
						
		aImages = [];	
		aImageXPosns = [];			
		mImageCount = 0;	
		mCurrentImageIndex = 0;
		
		//get localization language
		if (_root.langAbout != undefined){
			langAbout = _root.langAbout;
		}
		if (_root.langOpenImage != undefined){
			langOpenImage = _root.langOpenImage;
		}
		
		//init resize func		
		Stage.addListener(this);			
		Key.addListener(this);		
		mPagingTwn = new Tween(mImageArea_mc, "_x", Strong.easeInOut, 0, 0, Options.slideAnimationLength, false);			
		
		//init controls
		if (Options.enableArrowButtons) {
			mNextBtn = new RolloverButton("ButtonNext",this.mClip_mc);
			mNextBtn.doAction = Delegate.create(this,showNext);
   			mBackBtn = new RolloverButton("ButtonBack",this.mClip_mc);
			mBackBtn.doAction = Delegate.create(this,showPrev);
		}
		if (Options.enablePlayButton) {
			mPlayBtn = new RolloverButton("ButtonPlay",this.mClip_mc);
			mPlayBtn.doAction = Delegate.create(this,togglePlay);   		
   			mPlayBtn.buttonFrame = 2;   		
		}
		
		mBackBtn.setEnabled(false);
		  		   			     	   		
		//init download logo
		if (!IS_PRO){
			mLogoBar_mc = mClip_mc.attachMovie("Logo","mcLogo",mClip_mc.getNextHighestDepth());
			mLogoBar_mc._visible = false;
			mLogoBar_mc.onRelease = Delegate.create(this,onLogoClick);	
		}
		
		doLayout();
		
		//init mouse idle check
		if (Options.hideControlsOnRollOut){
			mClip_mc.onMouseMove = Delegate.create(this,onMouseMove);			
		}else{
			showControls(true);
		}
		
		mXMLManager.loadXML();		
	}
	
	public function onLogoClick():Void{	
		getURL(linkURL,"autoviewer");
	};
	
	/*
	 * Called by QueryManager when results XML has loaded 
	 */	 	
	public function createImages():Void{	
				
		//init right click menu		
		var stage_cm:ContextMenu = new ContextMenu ();
		stage_cm.hideBuiltInItems();
		if (mXMLManager.enableRightClickOpen){
			stage_cm.customItems.push(new ContextMenuItem(langOpenImage+"...", Delegate.create(this,openImage)));		
		}					
		if (!IS_PRO){
			stage_cm.customItems.push(new ContextMenuItem(langAbout + " AutoViewer v"+ VERSION+"...", Delegate.create(this,onLogoClick)));									
		}		
		mClip_mc.menu = stage_cm;
		
		mClip_mc.mcLogo._visible = false;
				
		mImageCount = mXMLManager.mImageCount;

		for (var i : Number = 0; i < mImageCount; i++) {
			aImages[i] = new Image(mImageArea_mc, i, mXMLManager.aImageFileNames[i],
												mXMLManager.aImageWidths[i],
												mXMLManager.aImageHeights[i],
												mXMLManager.aImageCaptions[i]);					
		}	
		
		doLayout();	
		mLogoBar_mc._visible = true;	
			
		if (Options.playAtStart){
			setPlaying(true);
		}
		
		showImage();
	}		
	
	//call doLayout when the stage is resized	
	function onResize(){				
		if (mResize_int == null){
			mResize_int = setInterval(Delegate.create(this,doLayout),sResizeTime);
		}	
	}
	
	function doLayout(){
		clearInterval(mResize_int);
		mResize_int = null;
		
		var w:Number;
		var h:Number;
		if (_global.AVStageWidth != undefined){
			w = _global.AVStageWidth;
			h = _global.AVStageHeight;			
		}else{
			w = Stage.width;
			h = Stage.height;
		}

		//layout logo
		mLogoBar_mc._x = Math.round(w - mLogoBar_mc._width - 10 - XMLManager.getInstance().frameWidth);
		mLogoBar_mc._y = Math.round(h - mLogoBar_mc._height - 10 - XMLManager.getInstance().frameWidth);
		 
		//layout controls		
		mBackBtn.setBtnPosn(Math.round(Options.controlsHPadding + mBackBtn.width/2),Math.round(h/2));
		mNextBtn.setBtnPosn(Math.round(w - mNextBtn.width/2 - Options.controlsHPadding),Math.round(h /2));
		trace('nxt: '+mNextBtn.width+ 'prv:'+mBackBtn.width);
		mPlayBtn.setBtnPosn(w/2,h - XMLManager.getInstance().frameWidth - Options.controlsVPadding - mPlayBtn.width/2);
				
		//resize and reposition images
		if (mImageCount == 0)return;
		var xpos = 0;
				
		for (var i : Number = 0; i < mImageCount; i++) {							
			aImages[i].setSize(w,h);
			
			if (Options.leftAlignImages){
				aImageXPosns[i] = xpos;	
			}else{
				aImageXPosns[i] = xpos - Math.round((w-aImages[i].width)/2);	
			}			
			
			//center jpg vertically		
			aImages[i].setPosn(xpos,Math.round((h-aImages[i].height)/2));			
			xpos +=	aImages[i].width + mXMLManager.imagePadding;					
		}
		
		//re-center on current img
		var gotoX = -aImageXPosns[mCurrentImageIndex];		
		mPagingTwn.continueTo(gotoX,1);
		mPagingTwn.fforward();			
	}
			
	/**
	 * Transition to an image 
	 */	 
	public function showImage(index:Number,instant:Boolean):Void{
		
		if (index < 0) return;
		
		if (index >= mImageCount) {
			if (!Options.loopAutoplay){
				return;
			}else{			
				index=0; 
			}
		}
		
		//do image transition
		aImages[mCurrentImageIndex].hide();
		//instant jump to cur posn
		var gotoX = -aImageXPosns[mCurrentImageIndex];
		mPagingTwn.continueTo(gotoX,1);
		mPagingTwn.fforward();
		
		mCurrentImageIndex = index;
		var gotoX = -aImageXPosns[mCurrentImageIndex];			
		mPagingTwn.continueTo(gotoX,Options.slideAnimationLength);
		
		aImages[mCurrentImageIndex].show();		
		mBackBtn.setEnabled(mCurrentImageIndex != 0);
		mPlayBtn.setEnabled(true);
		if (!Options.loopAutoplay){
			mNextBtn.setEnabled(mCurrentImageIndex != (mImageCount-1));	
		}
	
		//sequential loading
		if (!Options.preloadAllImages){
			aImages[mCurrentImageIndex].loadImage();
		}					
	}		
	
	function showNext(){
		setPlaying(false);
		showImage(mCurrentImageIndex +1);
	}
	
	function showPrev(){
		setPlaying(false);
		showImage(mCurrentImageIndex -1);
	}	
	
	private function onKeyDown() {	
		
		if(Key.isDown(Key.LEFT)) {
			showPrev();									
		}else if(Key.isDown(Key.RIGHT)) {
			showNext();	
		}else if(Key.isDown(Key.HOME)) {
			showImage(0);
		}else if(Key.isDown(Key.END)) {
			showImage(mImageCount-1);
		}else if(Key.isDown(Key.SPACE)) {
			togglePlay();
		}	
	}
	
	private function togglePlay(){		
		setPlaying(!mPlaying);	
		if 	(mPlaying){	
			showImage(mCurrentImageIndex +1);
		}
	}	
	
	private function setPlaying(play:Boolean){
		mPlaying = play;
		clearInterval(mPlay_int);		
		mPlayBtn.buttonFrame = mPlaying ? 1: 2;		
		if (mPlaying){			
			mPlay_int = setInterval(Delegate.create(this,doStep),mXMLManager.displayTime);			
		}	
	}
	
	private function doStep(){					
		if (mCurrentImageIndex == mImageCount-1 && !Options.loopAutoplay){
			setPlaying(false);
		}else{
			showImage(mCurrentImageIndex +1);
		}
	}

	/**
	* Show/hide all buttons
	*/
	private function showControls(show:Boolean){			
		mNextBtn.show(show);
		mBackBtn.show(show);
		mPlayBtn.show(show);		
	}
	
	private function checkIdle(){		
		var thisMouseX = _root._xmouse;
		var thisMouseY = _root._ymouse;	
		if (Math.abs(thisMouseX - mLastMouseX) < mIdleDistance &&  Math.abs(thisMouseY - mLastMouseY)< mIdleDistance){
			showControls(false);			
		}
	}
	
	private function onMouseMove(){		
		showControls(true);
		clearInterval(mCheckIdle_int);
		mCheckIdle_int = setInterval(Delegate.create(this,checkIdle),mCheckIdleTime);			
		mLastMouseX = _root._xmouse;
		mLastMouseY = _root._ymouse;
	}

	
	/**
	 * Open current image in a new browser window
	 */
	private function openImage(){				
		getURL(mXMLManager.aImageFileNames[mCurrentImageIndex],"image_result");
	}
	
	public function showNoImagesMessage(){
		trace("No images specified in XML doc");
	}
	
	public function showErrorMessage(){
		trace("Error loading XML doc");
	}
	
	public function get currentImageIndex():Number{return mCurrentImageIndex;}
	
	public function get imageCount():Number{	return mImageCount;	}
		
}