package se.nti.gymnasiearbete.states 
{
	import flash.text.engine.EastAsianJustifier;
	import se.nti.gymnasiearbete.core.Game;
	import se.nti.gymnasiearbete.interfaces.IState;
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import starling.text.TextField;
	
	/**
	 * ...
	 * @author Lucas Källberg
	 */
	public class GameOverState extends Sprite implements IState
	{
		private var game:Game;
		private var gameOverText:TextField;
		
		public function GameOverState(game:Game) 
		{
			this.game = game;
			gameOverText = new TextField(100, 50, "Game Over!");
			gameOverText.x = Starling.current.nativeStage.stageWidth  * 0.5;
			gameOverText.y = Starling.current.nativeStage.stageHeight * 0.5;
			addEventListener(Event.ADDED_TO_STAGE, draw);
		}
		
		private function draw(e:Event):void
		{
			game.addChild(gameOverText);
		}
		
		
		public function update(e:EnterFrameEvent):void
		{
			
		}
		
		override public function dispose():void 
		{
			super.dispose();
		}
		
	}

}