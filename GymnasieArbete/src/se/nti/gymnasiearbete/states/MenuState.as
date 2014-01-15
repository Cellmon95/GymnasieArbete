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
	public class MenuState extends Sprite implements IState
	{
		
		public function MenuState(game:Game) 
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