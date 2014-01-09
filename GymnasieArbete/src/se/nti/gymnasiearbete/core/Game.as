package se.nti.gymnasiearbete.core 
{
	import starling.display.Image;
	import starling.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.textures.Texture;
	
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
		
		[Embed(source="../../../../../resources/ball_basketball.png")]
		private static var ball_basketball:Class;
		
		private var text:Texture;
		private var img:Vector.<Image>;
		
		public function Game() 
		{
			currentTime = 0;
			text = Texture.fromEmbeddedAsset(Game.ball_basketball);
			img = new Vector.<Image>;
			
			addEventListener(EnterFrameEvent.ENTER_FRAME, frameEnterd);
			
			for (var i:int = 0; i < 5000; i++) 
			{
				img[i] = new Image(text);
				img[i].y = (Math.random() * 600) + 10;
				img[i].x = (Math.random() * 790) + 50;
				addChild(img[i]);
			}
			

			

		}
		
		private function frameEnterd(e:EnterFrameEvent):void
		{
			for (var i:int = 0; i < 5000; i++) 
			{
				img[i].x += 200 * e.passedTime; //(* (currentTime / 1000);
				
				if (img[i].x > 900) 
				{
					img[i].x = -100;
					img[i].y = (Math.random() * 600) + 10;
				}
			}
				//currentTime = 0;
		}
	}

}