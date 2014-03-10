package se.nti.gymnasiearbete.objects 
{
	import flash.geom.Rectangle;
	import se.nti.gymnasiearbete.core.Assets;
	import se.nti.gymnasiearbete.core.Game;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author Lucas Källberg
	 */
	public class Score extends CollisionObject 
	{
		
		public function Score(game:Game, x:int = 0, y:int = 0) 
		{
			super(game, Assets.scoreText, x, y, new Rectangle(16, 16, 3, 3), true);
		}
	}
}