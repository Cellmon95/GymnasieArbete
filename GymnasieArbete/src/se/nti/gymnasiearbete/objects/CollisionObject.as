package se.nti.gymnasiearbete.objects 
{
	import starling.display.Quad;
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
		private var custBoundsView:Quad;
		private var boundsStartX:Number;
		private var boundsStartY:Number;
		
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
		
		public function CollisionObject(game:Game, texture:Texture, x:Number = 0, y:Number = 0, custBounds:Rectangle = null, showBounds:Boolean = false) 
		{
			super(game, texture, x, y);

			this.custBounds = custBounds;
			if (showBounds) 
			{
				custBoundsView = new Quad(custBounds.width, custBounds.height, 0x00000);

			}

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
				boundsStartX = custBounds.x;
				boundsStartY = custBounds.y;
				custBounds.x += x;//- 16;
				custBounds.y += y;// - 16;	
			}
			if (custBoundsView != null)
			{
				custBoundsView.x = custBounds.x;
				custBoundsView.y = custBounds.y;
				custBoundsView.alpha = 0.5;
				game.addChild(custBoundsView)
			}
		}
		
		override public function get x():Number 
		{
			return super.x;
		}
		
		override public function set x(value:Number):void 
		{
			if (custBounds != null) 
			{
				custBounds.x = value + boundsStartX;
				if (custBoundsView != null) 
				{
					custBoundsView.x = value + boundsStartX;
				}
			}
			super.x = value;
		}
		
		override public function get y():Number 
		{
			return super.y;
		}
		
		override public function set y(value:Number):void 
		{
			if (custBounds != null)
			{
				custBounds.y = value + boundsStartY;
				if (custBoundsView != null) 
				{
					custBoundsView.y = value + boundsStartY;
				}
			}
			super.y = value;
		}
	}
}