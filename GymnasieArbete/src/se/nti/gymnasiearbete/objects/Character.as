package se.nti.gymnasiearbete.objects 
{
	import starling.events.Event;
	import se.nti.gymnasiearbete.core.Game;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author Lucas Källberg
	 */
	public class Character extends CollisionObject
	{
		protected var acc:Number;
		
		public function Character(game:Game, texture:Texture, x:Number = 0, y:Number = 0) 
		{
			super(game, texture, x, y)
		}
		
		override protected function init(e:Event):void 
		{
			super.init(e);
			
			img.pivotX = img.width / 2;
			img.pivotY = img.height / 2;
		}
	}

}