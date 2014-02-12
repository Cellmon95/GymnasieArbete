package se.nti.gymnasiearbete.objects 
{
	import flash.geom.Rectangle;
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
			super(game, Assets.WallText, x, y, new Rectangle(0, 5, 32, 22));
		}
		

	}

}