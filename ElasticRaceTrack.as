package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.getTimer;



	public class ElasticRaceTrack extends Sprite
	{
		private var frame:uint = 1;
		private var enterTime:Number = 0;
		private var exitTime:Number = 0;
		private var afterRenderTime:Number = 0;



		public function ElasticRaceTrack()
		{
			trace("Constructor  :: ", "start");
			super();

			stage.frameRate = 5;

			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			addEventListener(Event.EXIT_FRAME, onExitFrame);
			addEventListener(Event.RENDER, onRender);

			trace("Constructor  :: ", "end");
		}



		//  runs when the movie enters a new frame 	
		public function onEnterFrame(e:Event):void
		{
			afterRenderTime = getTimer();
			trace("             :: ", "frame - " + frame + " | render duration - " + (afterRenderTime - exitTime) + " ms");
			trace("             :: ", "frame - " + frame + " | total duration - " + (afterRenderTime - enterTime) + " ms");
			trace("             :: ", "frame - " + frame + " | actualFrameRate: " + actualFrameRate.toPrecision(2) + " fps");

			trace("\n\n"); // blank lines
			trace("onEnterFrame :: ", "frame - " + ++frame);
			enterTime = afterRenderTime


			// a lot to execute
			//runLongLoop(100000000);


			// a lot to draw
			addCircles(1000);


			// triger render event
			stage.invalidate();
		}



		public function onExitFrame(e:Event):void
		{
			exitTime = getTimer();
			trace("onExitFrame  :: ", "frame - " + frame + " | execute duration - " + (exitTime - enterTime) + " ms");
		}



		public function onRender(e:Event):void
		{
			trace("onRender     :: ", "frame - " + frame);
		}



		// frame rate based on one frame's time taken
		public function get actualFrameRate():Number
		{
			return 1000 / (afterRenderTime - enterTime)
		}



		public function runLongLoop(n:int):void
		{
			for (var i:int = 0; i < n; i++)
			{
			}
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

	}
}



//--------------------------------------------------------------------------
//
//  ** Helpful links **  
//  http://www.craftymind.com/2008/04/18/updated-elastic-racetrack-for-flash-9-and-avm2/
//  http://www.onflex.org/ted/2005/07/flash-player-mental-model-elastic.php
//  http://onflash.org/ted/2008/04/flash-player-mental-model-elastic.php 
//
//--------------------------------------------------------------------------

