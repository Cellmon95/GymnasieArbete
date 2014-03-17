package se.nti.gymnasiearbete.objects 
{
	import se.nti.gymnasiearbete.core.Assets;
	import se.nti.gymnasiearbete.core.Game;
	/**
	 * ...
	 * @author Lucas Källberg
	 */
	public class SuperScore extends CollisionObject 
	{
		
		public function SuperScore(game:Game, x:Number = 0, y:Number = 0) 
		{
			super(game, Assets.scoreText, x, y); 
		}
		
	}

}