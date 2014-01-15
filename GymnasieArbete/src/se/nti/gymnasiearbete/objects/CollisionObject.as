package se.nti.gymnasiearbete.objects 
{
	import starling.events.Event;
	import flash.geom.Rectangle;
	import starling.textures.Texture;
	import se.nti.gymnasiearbete.core.Game;
	/**
	 * ...
	 * @author Lucas Källberg
	 */
	public class CollisionObject extends VisualObject
	{
		public var imgBounds:Rectangle;
		
		//public var width:Number;
		//public var height:Number;
		
		public function CollisionObject(game:Game, texture:Texture, x:Number = 0, y:Number = 0) 
		{
			super(game, texture, x, y);
		}
		
/*		public function CollisionObject(game:Game, texture:Texture, x:Number = 0, y:Number = 0, rectWidth:Number, rectHeight:Number) 
		{
			super(game, texture, x, y);
			this.width = rectWidth;
			this.height = rectHeight;
		}*/
		
		override protected function init(e:Event):void 
		{
			super.init(e);
			
			imgBounds = img.bounds;
		}
	}

}