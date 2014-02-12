package se.nti.gymnasiearbete.objects 
{
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import se.nti.gymnasiearbete.core.Game;
	import starling.textures.Texture;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Lucas Källberg
	 */
	public class Character extends CollisionObject
	{
		protected var accX:Number;
		protected var accY:Number;
		
		protected var direction:int;
		private var lastTime:Number;
		protected var _colliding:Boolean;
		
		protected static const DIR_LEFT:int = 0;
		protected static const DIR_UP:int = 1;
		protected static const DIR_RIGHT:int = 2;
		protected static const DIR_DOWN:int = 3;
		
		public function set colliding(value:Boolean):void
		{
			_colliding = value;
		}
		
		public function get colliding():Boolean
		{
			return _colliding;
		}
		
		public function Character(game:Game, texture:Texture, x:Number = 0, y:Number = 0) 
		{
			super(game, texture, x, y)
			colliding = false;
		}
		
		override protected function init(e:Event):void 
		{
			super.init(e);
			
			img.pivotX = img.width / 2;
			img.pivotY = img.height / 2;
		}
		
		public function collideWall(pen:Rectangle):void
		{
			switch (direction) 
			{
				
				case DIR_UP:
					img.y += pen.height;
				break;
				
				case DIR_RIGHT:
					img.x -= pen.width;
				break;
				
				case DIR_DOWN:
					img.y -= pen.height;
				break;
				
				case DIR_LEFT:
					img.x += pen.width;
				break;
				default:
			}
		}
		

	}

}