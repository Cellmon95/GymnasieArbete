package se.nti.gymnasiearbete.objects 
{
	import flash.display3D.textures.Texture;
	import se.nti.gymnasiearbete.core.Game;
	/**
	 * ...
	 * @author Lucas Källberg
	 */
	public class Wall extends CollisionObject
	{
		
		public function Wall(game:Game, texture:Texture, x = 0, y = 0)
		{
			super(game, texture, x, y);
		}
		
	}

}