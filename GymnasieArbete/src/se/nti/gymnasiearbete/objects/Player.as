package se.nti.gymnasiearbete.objects 
{
	import flash.display.Stage;
	import flash.geom.Rectangle;
	import se.nti.gymnasiearbete.core.Game;
	import se.nti.gymnasiearbete.core.Input;
	import starling.core.Starling;
	import starling.events.EnterFrameEvent;
	import starling.textures.Texture;
	import se.nti.gymnasiearbete.core.Assets;
	/**
	 * ...
	 * @author Lucas Källberg
	 */
	public class Player extends Character 
	{
		private var nativeStage:Stage;
		private var direction:int;
		private var lastTime:Number;
		
		private static var DIR_LEFT:int = 0;
		private static var DIR_UP:int = 1;
		private static var DIR_RIGHT:int = 2;
		private static var DIR_DOWN:int = 3;
		
		public function Player(game:Game, x:Number = 0, y:Number = 0) 
		{
			super(game, Assets.PlayerText, x, y);
			nativeStage = Starling.current.nativeStage;
			
			acc = 200;
		}
		
		override public function update(e:EnterFrameEvent):void 
		{
			if (Input.keysDown[Input.KEY_LEFT])
			{
				img.x -= acc * e.passedTime;
				direction = DIR_LEFT;
			}
			
			else if (Input.keysDown[Input.KEY_UP])
			{
				img.y -= acc * e.passedTime;
				direction = DIR_UP;
			}
			else if (Input.keysDown[Input.KEY_RIGHT])
			{
				img.x += acc * e.passedTime; direction = DIR_RIGHT;
				direction = DIR_RIGHT;
			}
			else if (Input.keysDown[Input.KEY_DOWN])
			{
				img.y += acc * e.passedTime
				direction = DIR_DOWN;
			}
				
			lastTime = e.passedTime;
		}
		
		public function collideWall(pen:Rectangle):void
		{
			switch (direction) 
			{
				
				case DIR_UP:
					img.y += pen.height;
				break;
				
				case DIR_RIGHT:
					img.x -= pen.width;
				break;
				
				case DIR_DOWN:
					img.y -= pen.height;
				break;
				
				case DIR_LEFT:
					img.x += pen.width;
				break;
				default:
			}
		}
		
/*		private function move():void
		{
			
		}*/
		
	}

}