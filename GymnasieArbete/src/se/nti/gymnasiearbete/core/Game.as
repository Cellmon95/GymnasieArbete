package se.nti.gymnasiearbete.core 
{
	import se.nti.gymnasiearbete.interfaces.IState;
	import se.nti.gymnasiearbete.states.GameOverState;
	import se.nti.gymnasiearbete.states.MenuState;
	import se.nti.gymnasiearbete.states.PlayState;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.textures.Texture;
	
	/**
	 * ...
	 * @author Lucas Källberg
	 */
	public class Game extends Sprite 
	{
		private var currentState:IState;
		
		public static const MENU_STATE:int = 0;
		public static const PLAY_STATE:int = 1;
		public static const GAME_OVER_STATE:int = 2;
		
		public function Game() 
		{
			Assets.load();
			changeState(PLAY_STATE);
			addEventListener(EnterFrameEvent.ENTER_FRAME, update);
		}
		
		public function changeState(state:int):void
		{
			if (currentState != null) 
			{
				currentState.dispose();
				currentState = null;
			}
			switch (state) 
			{
				case MENU_STATE:
					currentState = new MenuState(this);
				break;
				
				case PLAY_STATE:
					currentState = new PlayState(this);
				break;
				
				case GAME_OVER_STATE:
					currentState = new GameOverState(this);
				break;
				
				default:
				throw new Error("I have no idea how this happend.");
			}
			
			addChild(currentState as Sprite);
		}
		
		private function update(e:EnterFrameEvent):void
		{
			currentState.update(e);
		}
	}

}