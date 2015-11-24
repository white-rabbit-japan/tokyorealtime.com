window.addEvent('domready', function() {

    /* initial setup for mp3 player */
    AudioPlayer.setup("/player.swf", { 
        transparentpagebg: "yes",
        width: 250,
        initialvolume: 90,
        noinfo: "yes"
    });         

    // init shadowbox links
    var options = {
         // handleLgImages:     true,
         loadingImage:"/img/loading.gif",
         animSequence:"sync",
         counterType:"skip"
     };
     Shadowbox.init(options);

     // init thumbnail tooltips w/ mootools tips (style w/ css/tooltips.css)
     var Tips1 = new Tips($$('.tooltip'));

     // init slideshow (autoviewer_tokyo.swf has Bryant font on caption and autoplay=true,showimagenumber=false)
     swfobject.embedSWF("autoviewer_tokyo.swf", "slideshow", "100%", "420", "8.0.0", "expressInstall.swf", {file:'audio/pepless1.mp3'}, {bgcolor:'0x000000'});

     // add divs for audio players then convert to mp3 player swf w/ swfobject 
     $$('.player').each(function (el,i) {
		var audioEl = el.getFirst(); // get the a element inside player div
		var mp3 = audioEl.href; // get mp3 from plain ol' a href
		audioEl.innerHTML = ''; // clear out link to mp3
		var tmpId = 'audio'+(i+1);
		var tmpDiv = new Element('div', {'id': tmpId}).injectInside(el); // tmp div for swfobject to turn into flash mp3 player
		AudioPlayer.embed(tmpId, {soundFile: mp3});
     });

     // add events slider toggler divs
     $$('a.toggler').each( function(el) {
         var slider = new Fx.Slide(el.id + '-target'); 
         slider.hide();
         el.onclick = function() {
             this.toggleClass('active');
             slider.toggle();
             return false;
         }
     });
     
     // hijack form for validation
     $$('form.mailing-list').each(function(el) {
         el.onsubmit = function() {
             return checkForm(el);
         }
     });             
     
     // clear email form field on click
     $$('input.yremail').each(function(el) {
         el.addEvent('focus', function() {
             if(this.value=='Join our mailing list!') {
                 this.value = '';
             }
         });
         el.addEvent('blur', function() {
             if(this.value=='') {
                 this.value = 'Join our mailing list!';
             }
         });
     });             

});


/* Nate's mootools functions for generic form validation */

// Tries to get field name from <label>, resorts to capitalized version of field name
function getFieldName(field) {
    if ($(field.id+'-label')) {
        var fieldStr = $(field.id+'-label').innerHTML;
        // strip out <input /> tags (if the <input> is inside the <label> as it is in comments.php)
        fieldStr = fieldStr.replace(/<input[^>]+\/?>/g,'');
        // strip out <span>foo</span> fields and whatnot, such as (required) (not shown) in comments form
        fieldStr = fieldStr.replace(/<span[^>]+>[^<]+<\/span>/g,'');
        // strip out all remaining tags in label, but leave content (such as <a href="#terms">terms</a>)
        fieldStr = fieldStr.replace(/<[^>]+>/g,'').trim();
    } else {
        // use field's name if <label> can't be found
        var fieldStr = field.name.replace(/-/g,' ').trim().capitalize();
    }
    return fieldStr;
}

function isEmail(str) {
       var isEmail  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	return isEmail.test(str);
}

/*  Simple form validator -- checks for inputs with class 'required' -- also validates field 'email' if present */

function checkForm(formToCheck) {
	var errorReturn = '';
	var focusAfter = '';

	var reqFields = $(formToCheck).getElements('.required');
	reqFields.forEach(function(field){
        if (field.type=='checkbox' && !field.checked) {
			focusAfter = (focusAfter == '') ? field : focusAfter; // Set focus to first error after check
			errorReturn += 'Please check ' + getFieldName(field) + ".\n";
        } else if (field.value.trim() == '') {
			focusAfter = (focusAfter == '') ? field : focusAfter; // Set focus to first error after check
			errorReturn += 'Please enter a value for ' + getFieldName(field) + ".\n";
		}
	});	
       
	var emailFields = $(formToCheck).getElements('.isEmail');
	emailFields.forEach(function(field){
   		if (!isEmail(field.value))
   		{
   			focusAfter = (focusAfter == '') ? field : focusAfter;
   			errorReturn += 'Please enter a valid email.'; // ' for ' + getFieldName(field) + ".\n";
   		}
    });	
	
	if (errorReturn != '')
	{
        alert(errorReturn);
		focusAfter.focus();
		return false;
	} else {
		return true;
	}
}
