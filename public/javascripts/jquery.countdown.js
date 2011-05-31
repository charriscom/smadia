/*! jQuery Countdown Plugin
* Copyright Tom Ellis http://www.webmuse.co.uk
* Licensed under MIT License
* See http://www.webmuse.co.uk/license/
*/
(function($) {
   
	jQuery.fn.countdown = function( options ) {  
	
		var defaults = {
			date: (new Date()),
			updateTime: 1000,
			htmlTemplate: "<span class=\"num\">%{d}</span>d<span class=\"num\">%{h}</span>h<span class=\"num\">%{m}</span>m<span class=\"num\">%{s}</span>s",
			minus: false
		};
	 
		   
		var opts = $.extend( {}, defaults, options ),
			cancel = false,
			template = opts.htmlTemplate;
	   
		return this.each(function() {
			var intval = window.setInterval(function(){
				
				var TodaysDate = new Date(),
					CountdownDate = new Date( opts.date ),
					msPerDay = 24 * 60 * 60 * 1000,
					timeLeft = (CountdownDate.getTime() - TodaysDate.getTime()),
					e_daysLeft = timeLeft / msPerDay,
					daysLeft = Math.floor(e_daysLeft),
					e_hrsLeft = (e_daysLeft - daysLeft)*24, //Gets remainder and * 24
					hrsLeft = Math.floor(e_hrsLeft),
					minsLeft = Math.floor((e_hrsLeft - hrsLeft)*60),					
					e_minsleft = (e_hrsLeft - hrsLeft)*60, //Gets remainder and * 60
					secLeft = Math.floor((e_minsleft - minsLeft)*60),
					time = "";

				if ( TodaysDate <= CountdownDate || opts.minus ){
				   	
				   	time = template.replace(/%{d}/, daysLeft).replace(/%{h}/, hrsLeft).replace(/%{m}/, minsLeft).replace(/%{s}/, secLeft);
				} else {
		
					time = template.replace(/(%{d}|%{h}|%{m}|%{s})/g, "00");
					cancel = true;
				}
			   
				$("#"+opts.id).html( time );
			   
				if ( cancel ){
					cancel = false;
					clearInterval( intval );
				}       		
			
			}, opts.updateTime);

		});
	};
       
})(jQuery);