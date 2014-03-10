package se.nti.gymnasiearbete.objects 
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import se.nti.gymnasiearbete.core.Assets;
	import se.nti.gymnasiearbete.core.Game;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.extensions.tmxmaps.TMXObject;
	import starling.extensions.tmxmaps.TMXTileMap;
	
	/**
	 * ...
	 * @author Lucas Källberg
	 */
	public class Map extends GameObject 
	{
		private var mapTmx:TMXTileMap;
		private var game:Game;
		
		public function Map(game:Game) 
		{
			super();
			this.game = game;
			mapTmx = Assets.mapTMX;
		}
		
		override protected function init(e:Event):void 
		{
			super.init(e);
			drawMap();
		}
		
		public function drawMap():void
		{
			for (var i:int = 0; i < mapTmx.layers.length; i++) 
			{
				game.addChild(mapTmx.layers[i].layerSprite);
			}
		}
		
		override public function dispose():void 
		{
			super.dispose();
			for (var i:int = 0; i < mapTmx.layers.length; i++) 
			{
				game.removeChild(mapTmx.layers[i].layerSprite);
			}
			
			mapTmx = null;
		}
		public function get mapObjects():Vector.<TMXObject>
		{
			var tmpObjects:Vector.<TMXObject> = new Vector.<TMXObject>;
			for (var i:int = 0; i < mapTmx.objectGroups.length; i++) 
			{
				tmpObjects.push(mapTmx.objectGroups[i]);
			}
			return tmpObjects;
		}
		
		public function get collisionRectangels():Vector.<Rectangle>
		{
			var tmpRectangles:Vector.<Rectangle> = new Vector.<Rectangle>;
			
			for (var i:int = 0; i < mapTmx.objectGroups.length; i++) 
			{
				if (mapTmx.objectGroups[i].name == "Collision Rect") 
				{
					for (var j:int = 0; j < mapTmx.objectGroups[i].objects.length; j++) 
					{
						tmpRectangles.push(new Rectangle());
						tmpRectangles[tmpRectangles.length - 1].width = mapTmx.objectGroups[i].objects[j].width;
						tmpRectangles[tmpRectangles.length - 1].height = mapTmx.objectGroups[i].objects[j].height;
						tmpRectangles[tmpRectangles.length - 1].x = mapTmx.objectGroups[i].objects[j].position.x;
						tmpRectangles[tmpRectangles.length - 1].y = mapTmx.objectGroups[i].objects[j].position.y;
					}					
				}
			}
			return tmpRectangles;
		}
		
		public function get scoresPos():Vector.<Point>
		{
		
			var tmpPoints:Vector.<Point> = new Vector.<Point>;
			
			for (var i:int = 0; i < mapTmx.objectGroups.length; i++) 
			{
				if (mapTmx.objectGroups[i].name == "Scores") 
				{
					for (var j:int = 0; j < mapTmx.objectGroups[i].objects.length; j++) 
					{
						tmpPoints.push(mapTmx.objectGroups[i].objects[j].position);	
					}					
				}
			}
			return tmpPoints;
		}
	}

}