package
{

	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.utils.getTimer;


	public class MarshalledSlices extends Sprite
	{
		public function MarshalledSlices()
		{
			trace("Constructor :: ", "start");
			super();


			stage.frameRate = 1;

			// add event listeners	
			addEventListener(Event.ENTER_FRAME, onEnterFrame)
			addEventListener(Event.RENDER, onRender);

			// setup timer for every 1 ms
			timer=new Timer(1);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();

			trace("Constructor :: ", "end");
		}

		private var frame:uint=0;
		private var timer:Timer;

		public function onEnterFrame(e:Event):void
		{
			trace("onEnterFrame :: ", "frame - " + ++frame);
		}


		public function onRender(e:Event):void
		{
			trace("onRender");
		}


		public function onTimer(te:TimerEvent):void
		{
			trace("onTimer" + getTimer());
			
			runLongLoop(100000000);

			stage.invalidate();
		}
		
		public function addCircles(n:int):void
		{
			for (var i:int = 0; i < n; i++)
			{
				var s:Sprite = new Sprite();
				s.graphics.beginFill(0x0000FF, 0.2);
				var sx:Number = Math.random() * 500;
				var sy:Number = Math.random() * 500;
				var sr:Number = Math.random() * 20;
				s.graphics.drawCircle(sx, sy, sr);
				addChild(s);
			}
		}

		
		public function runLongLoop(n:int):void
		{
			for (var i:int = 0; i < n; i++)
			{
			}
		}
		
	}
}



//--------------------------------------------------------------------------
//
//  ** Notes **
//  1. Note the time difference between each Timer event .... 
//     it is not 1ms sec .. its the length of the marshaled slice
//
//  2. Note what happens when you do a long operation in the timer handler, the length of that slice increases
//
//
//  ** Helpful links **  
//  http://www.craftymind.com/2008/04/18/updated-elastic-racetrack-for-flash-9-and-avm2/
//  
//--------------------------------------------------------------------------

