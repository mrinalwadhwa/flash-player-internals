package
{

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.utils.getTimer;


	public class FrameRates extends Sprite
	{
		public function FrameRates()
		{
			trace("Constructor :: ", "start");
			super();

			/*
			   set framerate (valid values 0.01 to 1000)
			   
			   framerate = 0.01 // lowest
			   framerate = 0.9 // this give me 1 consistant in Safari
			   framerate = 1 // this in some frames gives 2
			   framerate = 5
			   framerate = 24
			   framerate = 60
			   framerate = 120
			   framerate = 1000 // highest
		
			 */
			stage.frameRate=24;

			// add event listeners	
			addEventListener(Event.ENTER_FRAME, onEnterFrame)

			// setup timer
			timer=new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();

			trace("Constructor :: ", "end");
		}
		private var frame:uint=0;
		private var second:uint=1; // we're already in second 1

		private var timer:Timer;

		//  runs when the movie enters a new frame 	
		/**
		 * 
		 * @param e
		 * 
		 * 
		 */
		public function onEnterFrame(e:Event):void
		{
			trace("onEnterFrame :: ", "frame - " + ++frame);
		}

		/**
		 * 
		 * @param te
		 * 
		 * 
		 */
		public function onTimer(te:TimerEvent):void
		{
			trace("\n\n\n");
			trace("onTimer :: ", "second - " + ++second);

			// reset frame number
			frame=0;
		}
		
	}
}

//---------------------------------------------------------------------------------------
//
// 	** NOTES **
//
//	1. Player tries its best to maintain the targetted framRate, but no garuntees
//  2. The rate can also go over what you asked for 
//  3. Tinic says "the actual frame rate will sway between -10 to +5 frames/sec from the actual selected frame rate" 
//  4. Browsers cause reduced framerates if Tab is not in focus or Browser is minimized 
//  		> On OSX - Safari cuts it down to 0 when minimized, Firefoxt doesnt
//			> On Tab out of focus its about 10 on both Safari and Firefox					   
//  
//
//  ** Helpful Links **
//  
//  http://www.kaourantin.net/2006/05/frame-rates-in-flash-player.html
//
//---------------------------------------------------------------------------------------



