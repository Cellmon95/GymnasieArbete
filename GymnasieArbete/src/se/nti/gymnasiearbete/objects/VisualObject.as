package se.nti.gymnasiearbete.objects 
{
	import flash.display3D.textures.Texture;
	import se.nti.gymnasiearbete.core.Game;
	import se.nti.gymnasiearbete.interfaces.IDisposable;
	import starling.display.Image;
	/**
	 * ...
	 * @author Lucas Källberg
	 */
	public class VisualObject extends GameObject implements IDisposable
	{ 
		protected var game:Game;
		protected var img:Image;
		protected var texture:Texture;
		
		public var x:Number = 0;
		public var y:Number = 0;
		
		public function VisualObject(game:Game, texture:Texture, x:int = 0, y:int = 0) 
		{
			//initilaise the x and y in constructor instead of init
			//so i don't need to add any parameters to init(easier when i override)
			this.x = x;
			this.y = y; 
			
			init();
		}
		
		protected function init():void
		{			
			this.game = game;
			this.texture = texture;
			this.img = new Image(texture);
			
			img.x = x;
			img.y = y;
			game.addChild(img);
		}
		
		public function update():void
		{
			
		}
		
		public function dispose():void
		{
			img.dispose();
			texture.dispose()
		}
		
	}

}