package se.nti.gymnasiearbete.objects 
{
	import se.nti.gymnasiearbete.core.Assets;
	import se.nti.gymnasiearbete.core.Game;
	/**
	 * ...
	 * @author Lucas Källberg
	 */
	public class Wall extends CollisionObject
	{
		
		public function Wall(game:Game, x:Number = 0, y:Number = 0)
		{
			super(game, Assets.WallText, x, y);
		}
		
		override public function get x():Number 
		{
			return img.x;
		}
		
		override public function set x(value:Number):void 
		{
			img.x = value;
		}
		
		override public function get y():Number 
		{
			return img.y;
		}
		
		override public function set y(value:Number):void 
		{
			img.y = value;
		}
	}

}