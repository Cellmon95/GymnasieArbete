package se.nti.gymnasiearbete.objects 
{
	import starling.events.EnterFrameEvent;
	import starling.events.Event
	import starling.textures.Texture;
	import se.nti.gymnasiearbete.core.Game;
	import se.nti.gymnasiearbete.interfaces.IDisposable;
	import starling.display.Image;
	/**
	 * ...
	 * @author Lucas Källberg
	 */
	public class VisualObject extends GameObject
	{ 
		protected var game:Game;
		protected var img:Image;
		protected var texture:Texture;
		
		override public function get x():Number 
		{
			return img.x;
		}
		
		override public function set x(value:Number):void 
		{
			img.x = value;
		}
		
		override public function get y():Number 
		{
			return img.y;
		}
		
		override public function set y(value:Number):void 
		{
			img.y = value;
		}
		
		public function VisualObject(game:Game, texture:Texture, x:int = 0, y:int = 0) 
		{
			super();
			this.game = game;
			this.img = new Image(texture);
			this.x = x;
			this.y = y; 
		}
		
		override protected function init(e:Event):void
		{			
			/*img.x = x;
			img.y = y;*/
			game.addChild(img);
		}
		
		public function update(e:EnterFrameEvent):void
		{
			
		}
		
		override public function dispose():void 
		{
			super.dispose();
			img.removeFromParent(true);
			img.dispose();
			//this.removeFromParent(true);
		}
		
	}

}