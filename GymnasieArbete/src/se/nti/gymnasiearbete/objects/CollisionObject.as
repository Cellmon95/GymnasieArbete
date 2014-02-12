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
		public var custBounds:Rectangle;
		
		override public function get bounds():flash.geom.Rectangle 
		{
			if (custBounds != null) 
			{
				return custBounds;
			}
			else
			{
				return img.bounds;
			}
		}
		
		//public var width:Number;
		//public var height:Number;
		
		public function CollisionObject(game:Game, texture:Texture, x:Number = 0, y:Number = 0, custBounds:Rectangle = null) 
		{
			super(game, texture, x, y);
			this.custBounds = custBounds;
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
			
			if (custBounds != null) 
			{
				custBounds.x += x;//- 16;
				custBounds.y += y;// - 16;	
			}
		}
	}
}