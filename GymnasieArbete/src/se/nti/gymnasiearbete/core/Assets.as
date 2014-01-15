package se.nti.gymnasiearbete.core 
{
	import starling.textures.Texture;
	/**
	 * ...
	 * @author Lucas Källberg
	 */
	public class Assets 
	{
		[Embed(source="../../../../../resources/Player.png")]
		private static const Player:Class;
		//i have made this public just temporary so i can test the programm. Will implement a better solution later.
		public static var PlayerText:Texture;
		
		
		public function Assets() 
		{
		
		}
		
		internal static function load():void
		{
			PlayerText = Texture.fromEmbeddedAsset(Player);
		}
		
	}

}