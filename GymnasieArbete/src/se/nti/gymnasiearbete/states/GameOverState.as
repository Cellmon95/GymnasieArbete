package se.nti.gymnasiearbete.states 
{
	import se.nti.gymnasiearbete.core.Game;
	import se.nti.gymnasiearbete.interfaces.IState;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	
	/**
	 * ...
	 * @author Lucas Källberg
	 */
	public class GameOverState extends Sprite implements IState
	{
		
		public function GameOverState(game:Game) 
		{
			
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