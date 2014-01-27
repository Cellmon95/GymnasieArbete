package se.nti.gymnasiearbete.core
{
	import flash.display.Sprite;
	import flash.events.Event;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author Lucas Källberg
	 */
	
	[SWF(width="800", height="640", frameRate="60", backgroundColor="#ffffff")]
	public class Main extends Sprite 
	{
		private var starling:Starling;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			starling = new Starling(Game, stage);
			//starling.showStats = true;
			starling.antiAliasing = 4;
			starling.start();
		}
		
	}
	
}