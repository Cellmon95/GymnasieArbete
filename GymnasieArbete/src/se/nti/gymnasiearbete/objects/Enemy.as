package se.nti.gymnasiearbete.objects 
{
	import se.nti.gymnasiearbete.core.Game;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author Lucas Källberg
	 */
	public class Enemy extends Character 
	{
		
		public function Enemy(game:Game, texture:Texture, x:Number = 0, y:Number = 0) 
		{
			super(game, texture, x, y);
		}
		
	}

}