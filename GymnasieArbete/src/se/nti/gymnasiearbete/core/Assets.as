package se.nti.gymnasiearbete.core 
{
	import starling.textures.Texture;
	import starling.extensions.tmxmaps.TMXTileMap;
	import flash.display.Bitmap;
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
		
		[Embed(source="../../../../../resources/Wall.png")]
		private static const Wall:Class;
		//same here
		public static var WallText:Texture;
		
		[Embed(source="../../../../../resources/Score.png")]
		private static const Score:Class;
		
		public static var scoreText:Texture;
		
		[Embed(source = "../../../../../resources/Grid.png")]
		private static const Grid:Class;
		public static var gridText:Texture;
		
		[Embed(source="../../../../../resources/testKnokmap.tmx", mimeType="application/octet-stream")]
		private static var testMap:Class;

		[Embed(source="../../../../../resources/wood_large.png")]
		private static var wood_large_tileset:Class;
		
		[Embed(source="../../../../../resources/wood.gif")]
		private static var wood_back:Class;
		
		
		public static var mapTMX:TMXTileMap;
		
		public function Assets() 
		{
		
		}
		
		internal static function load():void
		{
			PlayerText = Texture.fromEmbeddedAsset(Player);
			WallText = Texture.fromEmbeddedAsset(Wall);
			scoreText = Texture.fromEmbeddedAsset(Score);
			gridText = Texture.fromEmbeddedAsset(Grid);
			
			var mapXML:XML = XML(new testMap());
			var tileset:Vector.<Bitmap> = new Vector.<Bitmap>;
			tileset.push(Bitmap(new wood_large_tileset()),Bitmap(new wood_back()), Bitmap(new Score()));
			
			mapTMX = TMXTileMap.createMap(mapXML, tileset);
			/*map = new Array	
			(
			new Array(0,0,0,0,0,0,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1),
			new Array	(0,0,0,0,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1),
			new Array	(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1),
			new Array	(1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1),
			new Array	(1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1),
			new Array	(1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1),
			new Array	(1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1),
			new Array	(1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1),
			new Array	(1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1),
			new Array	(0,0,0,0,0,0,0,0,0,0,2,2,2,2,2,2,2,2,2,2,2,2,0,0,0),
			new Array	(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
			new Array	(1,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,1),
			new Array	(1,1,0,0,0,0,0,0,2,2,2,2,2,0,0,0,0,0,0,0,0,0,0,1,1),
			new Array	(1,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,1),
			new Array	(1,1,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,1,1),
			new Array	(1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1),
			new Array	(1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1),
			new Array	(1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1),
			new Array	(1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1),
			new Array	(1,1,1,1,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1)
			);*/
		}
		
		internal static function unload():void
		{
			PlayerText.dispose();
			
			WallText.dispose();
			
			scoreText.dispose();
			
			gridText.dispose();
			
			mapTMX = null;
		}
		
	}

}