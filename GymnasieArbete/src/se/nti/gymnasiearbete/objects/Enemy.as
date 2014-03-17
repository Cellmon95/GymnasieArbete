package se.nti.gymnasiearbete.objects 
{
	import flash.events.TimerEvent;
	import flash.net.drm.DRMVoucherDownloadContext;
	import flash.utils.Timer;
	import se.nti.gymnasiearbete.core.Assets;
	import se.nti.gymnasiearbete.core.Game;
	import starling.core.Starling;
	import starling.events.EnterFrameEvent;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author Lucas Källberg
	 */
	public class Enemy extends Character 
	{
		
		private static var timer:Timer;
		private static var _chased:Boolean;
		
		
		public static function get chased():Boolean
		{
			return _chased;
		}
		
		
		public function Enemy(game:Game, x:Number = 0, y:Number = 0) 
		{
			super(game, Assets.PlayerText, x, y);
			accX = 200;
			accY = 0;
		}
		
		private function brain(e:EnterFrameEvent):void
		{
				if (direction == DIR_UP || direction == DIR_DOWN)
				{
					if (Math.random() * 60 <1) //&& place_free(x-4,y))
					{ accX += 200; accY = 0; direction = DIR_RIGHT }
					if (Math.random() * 60 <1) //&& place_free(x+4,y))
					{ accX -= 200; accY = 0; direction = DIR_LEFT }
				}
				else
				{
					if (Math.random() * 60 <1) //&& place_free(x,y-4))
					{ accY -= 200; accX = 0; direction = DIR_UP }
					if (Math.random() * 60 <1)// && place_free(x,y+4))
					{ accY += 200; accX = 0; direction = DIR_DOWN }
				}

		}
		
		public static function changeForm():void
		{
			timer = new Timer(10000, 0);
			timer.addEventListener(TimerEvent.TIMER, onTimerComplete);
			timer.start();
			_chased = true;
		}
		
		private static function onTimerComplete(t:TimerEvent):void
		{
			timer.stop();
			timer.removeEventListener(TimerEvent.TIMER, onTimerComplete);
			_chased = false;
		}
		
		override public function update(e:EnterFrameEvent):void 
		{
			brain(e);
			
			x += accX * e.passedTime;
			y += accY * e.passedTime;
			
			img.x = x;
			img.y = y;
		}
		
	}

}