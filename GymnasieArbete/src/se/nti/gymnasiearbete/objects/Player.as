package se.nti.gymnasiearbete.objects 
{
	import flash.display.Stage;
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
			super(game, Assets.PlayerText, x, y);
			nativeStage = Starling.current.nativeStage;
			
			acc = 200;
		}
		
		override public function update(e:EnterFrameEvent):void 
		{
			if (Input.keysDown[Input.KEY_LEFT]) 
				img.x -= acc * e.passedTime;
			else if (Input.keysDown[Input.KEY_UP])
				img.y -= acc * e.passedTime;
			else if (Input.keysDown[Input.KEY_RIGHT])
				img.x += acc * e.passedTime;
			else if (Input.keysDown[Input.KEY_DOWN])
				img.y += acc * e.passedTime
		}
		
/*		private function move():void
		{
			
		}*/
		
	}

}