package se.nti.gymnasiearbete.states 
{
	import flash.events.EventDispatcher;
	import se.nti.gymnasiearbete.core.Game;
	import se.nti.gymnasiearbete.interfaces.IState;
	import se.nti.gymnasiearbete.objects.Player;
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import se.nti.gymnasiearbete.core.Input;
	
	/**
	 * ...
	 * @author Lucas Källberg
	 */
	public class PlayState extends Sprite implements IState
	{
		private var game:Game;
		private var player:Player;
		
		public function PlayState(game:Game) 
		{
			this.game = game;
			Input.start(Starling.current.nativeStage);
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			player = new Player(game, 200);
			game.addChild(player);
		}
		
		public function update(e:EnterFrameEvent):void
		{
			player.update(e);
		}
		
		override public function dispose():void 
		{
			super.dispose();
			player.dispose();
			Input.end();
		}
		
	}

}