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

		
		public function Player(game:Game, x:Number = 0, y:Number = 0) 
		{
			super(game, Assets.PlayerText, 0, 0, new Rectangle(-20, -20, 40, 40), false);
			nativeStage = Starling.current.nativeStage;
			
			accX = 0;
			accY = 0;
		}
		
		override public function update(e:EnterFrameEvent):void 
		{
			move(e);
		}
		
		
		private function move(e:EnterFrameEvent):void 
		{
			if (Input.keysDown[Input.KEY_LEFT])
			{
				//img.x -= accX * e.passedTime;
				accX = -200;
				accY = 0;
				direction = DIR_LEFT;
			}
			
			else if (Input.keysDown[Input.KEY_UP])
			{
				//img.y -= accY * e.passedTime;
				accY = -200;
				accX = 0;
				direction = DIR_UP;
			}
			else if (Input.keysDown[Input.KEY_RIGHT])
			{
				//img.x += accX * e.passedTime;
				accX = 200;
				accY = 0;
				direction = DIR_RIGHT;
			}
			else if (Input.keysDown[Input.KEY_DOWN])
			{
				//img.y += accY * e.passedTime;
				accY = 200;
				accX = 0;
				direction = DIR_DOWN;
			}
			this.x += accX * e.passedTime;
			this.y += accY * e.passedTime;
			/*else
			{
				switch (direction) 
				{
					case DIR_DOWN:
						if (Math.round(img.y - 16) % 8 != 0 ) 
						{
							img.y += accY * e.passedTime;
						}
					break;
					
					case DIR_LEFT:
						if (int(img.x - 16) % 8 != 0 ) 
						{
							img.x -= accY * e.passedTime;;
						}
					break;
					
					case DIR_UP:
						if (int(img.y - 16) % 8 != 0 ) 
						{
							img.y -= accY * e.passedTime;;
						}
					break;
					
					case DIR_RIGHT:
						if (Math.round(img.x - 16) % 8 != 0 ) 
						{
							img.x += accY * e.passedTime;;
						}
					break;
					
					default:
				}
			}*/
		}
	}
}