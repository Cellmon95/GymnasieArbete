package se.nti.gymnasiearbete.objects 
{
	import se.nti.gymnasiearbete.core.Game;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author Lucas Källberg
	 */
	public class Character extends VisualObject
	{
		
		public function Character(game:Game, texture:Texture, x:Number = 0, y:Number = 0) 
		{
			super(game, texture, x, y)
		}
		
		override public function update(x:Number, y:Number):void 
		{
			this.x = x;
			this.y = y;
			
			move();
		}
		
		protected function move():void
		{
			img.x += x;
			img.y += y;
		}
	}

}