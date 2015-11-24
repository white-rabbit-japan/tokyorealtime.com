/****************************************************************************
* Copyright (C) 2008 Airtight Interactive. All Rights Reserved.
* Usage of this code is subject to the Terms of Use accompanying
* this product.
****************************************************************************/

/**
 * Autoviewer options.
 * Change values in this file to modify the behaviour of AutoViewer.
 * For description of these options, see: http://www.airtightinteractive.com/projects/autoviewer/pro/pro_options.html
 * 
 * @author Felix Turner
 */
class com.airtightinteractive.apps.viewers.autoViewer.Options {
		
	function Options(){};
			
	//autoplay options
	static var playAtStart:Boolean = true; //Sets whether to automatically start playing
	static var loopAutoplay:Boolean = true ; //Sets whether to loop to first image after showing last image
	
	//image options
	static var enableImageDownScaling:Boolean = true; //Sets whether images are resized smaller to fit stage
	static var enableImageUpScaling:Boolean = false; //Sets whether images are resized larger to fit stage	
	static var leftAlignImages:Boolean = false; //Sets whether to left align the first image
	static var preloadAllImages:Boolean = true; //Sets whether to preload all the images automatically, or to load images as they are viewed
	static var unselectedBrightness:Number = -120; //Brightness applied to unselected images (-255 = black, 255 = white)
	static var initialBrightness:Number = -255; //Brightness applied to first image when loaded (-255 = black, 255 = white)
	static var useSmoothing:Boolean = true; //Whether to smooth resized images.
	
	//controls options
	static var enablePlayButton:Boolean = true; //Sets whether to enable the Play Button
	static var enableArrowButtons:Boolean = true; //Sets whether to enable the Next/Back Buttons
	static var hideControlsOnRollOut:Boolean = true; //Sets whether to hide buttons on mouse roll out
	static var controlsHPadding:Number = 0; //Horizontal padding between next/back buttons and stage edge in pixels
	static var controlsVPadding:Number = 10; //Vertical padding between play button and stage bottom in pixels
	
	//captions options
	static var showCaptions:Boolean = true; //Sets whether to show Image Captions
	static var showImageNumbers:Boolean = false; //Sets whether to show Image Numbers
	static var imageNumberFontSize:Number = 20; //Font size of caption text
	static var imageNumberColor:String = "#FFFFFF"; //Hex color value
	static var captionPadding:Number = 20; //Padding between captions and image edge in pixels				
		
	//data options
	static var XMLPath:String = "gallery.xml"; //Relative or absolute path to XML file
	
	//animation options
	static var slideAnimationLength:Number = 20; //Tween length in frames
	static var colorFadeAnimationLength:Number = 30; //Tween length in frames
					
}