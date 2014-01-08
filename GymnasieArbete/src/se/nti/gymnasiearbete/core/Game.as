package se.nti.gymnasiearbete.core 
{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	
	/**
	 * ...
	 * @author Lucas Källberg
	 */
	public class Game extends Sprite 
	{
		private var currentTime:Number;
		private var currentFrame:int;
		private var lastTime:Number;
		private var timer:Timer;
		
		public function Game() 
		{
			currentTime = 0;
			lastTime = 0;
			
			timer = new Timer(16.6, 0);
			timer.start();
			timer.addEventListener(TimerEvent.TIMER, tick);
			addEventListener(EnterFrameEvent.ENTER_FRAME, frameEnterd);
			

		}
		
		private function frameEnterd():void
		{
			lastTime += 16.6;
			trace(getDeltaTime());
		}
		
		private function tick(t:TimerEvent):void
		{
			currentTime += 16.6;
		}
		
		private function getDeltaTime():Number
		{
			var tmp:Number = new Number((currentTime - lastTime) / 1000);
			//trace(tmp);
			if (tmp < 1) 
				tmp = 1;
			return tmp;
		}
	}

}