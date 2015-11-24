/****************************************************************************
* Copyright (C) 2008 Airtight Interactive. All Rights Reserved.
* Usage of this code is subject to the Terms of Use accompanying
* this product.
****************************************************************************/

import mx.utils.Delegate;

import com.airtightinteractive.apps.viewers.autoViewer.StageManager;
import com.airtightinteractive.apps.viewers.autoViewer.Options;

/**
 * Handles xml loading,parsing
 * 
 * @author Felix Turner
 */

class com.airtightinteractive.apps.viewers.autoViewer.XMLManager {
	
	private static var instance : XMLManager;
	
	private var xmlResults:XML;
	private var mStageManager:StageManager;
	
	//Results data
	public var mImageCount:Number;  
	public var aImageFileNames:Array;
	public var aImageWidths:Array;
	public var aImageHeights:Array;
	public var aImageCaptions:Array;			
	public var frameColor:Number = 0xFFFFFF;
	public var frameWidth:Number = 15;
	public var imagePadding:Number = 20;
	public var displayTime:Number = 6000;	
	public var enableRightClickOpen:Boolean = false; //Enables right click option to open image in a new browser window
	
	/**
	 * @return singleton instance of QueryManager
	 */
	public static function getInstance() : XMLManager {
		if (instance == null)
			instance = new XMLManager();
		return instance;
	}
		
	private function XMLManager() {	
		mStageManager = StageManager.getInstance();
		xmlResults = new XML();	
		xmlResults.ignoreWhite = true;		
		xmlResults.onLoad = Delegate.create(this, onXMLLoaded);		
	}
 	
	public function loadXML():Void{	
		
		var xmlURL = Options.XMLPath;
		//get xml url from flash vars
		if (_root.xmlURL != undefined){
			xmlURL = _root.xmlURL;
		}		
		xmlResults.load(xmlURL);				
	}	
	
	private function onXMLLoaded(success:Boolean):Void{
				
		mImageCount = 0; 
		aImageFileNames = [];
		aImageWidths = [];
		aImageHeights = [];
		aImageCaptions = [];	
		
		if (success){	
			var xmlRoot = xmlResults.firstChild;
			mImageCount = Number(xmlRoot.childNodes.length);
			
			//get gallery attributes
			var fc = Number(xmlRoot.attributes.frameColor);			
			if (isValidNumber(fc)) frameColor = fc;
						
			var fw = Number(xmlRoot.attributes.frameWidth);
			if (isValidNumber(fw)) frameWidth = fw;
			
			var ip = Number(xmlRoot.attributes.imagePadding);
			if (isValidNumber(ip)) imagePadding = ip;
			
			var dt = Number(xmlRoot.attributes.displayTime)*1000;		
			if (isValidNumber(dt)) displayTime = dt;
						
			enableRightClickOpen = getBoolean(xmlRoot.attributes.enableRightClickOpen);
			
			if (mImageCount < 1){				
				mStageManager.showNoImagesMessage();			
			}else{																
				for (var i:Number = 0;i<mImageCount;i++){											
					var resultNode:XMLNode = xmlRoot.childNodes[i];	
					aImageFileNames.push(resultNode.childNodes[0].firstChild.nodeValue);					
					aImageCaptions.push(resultNode.childNodes[1].firstChild.nodeValue);
					aImageWidths.push(Number(resultNode.childNodes[2].firstChild.nodeValue));	
					aImageHeights.push(Number(resultNode.childNodes[3].firstChild.nodeValue));																							
				}																
				//render results
				mStageManager.createImages();
			}
		}else{
			mStageManager.showErrorMessage();			
		}	
	}
	
	function isValidNumber(x:Number){		
		return !(isNaN(x) || x == undefined);		
	}
	
	function getBoolean(s:String):Boolean{		
		if (s.toLowerCase() == "true") return true;
		return false;
	}	
}
