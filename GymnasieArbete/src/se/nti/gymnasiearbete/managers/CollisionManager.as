package se.nti.gymnasiearbete.managers 
{
	import flash.geom.Rectangle;
	import se.nti.gymnasiearbete.states.PlayState;
	import starling.display.Sprite;
	import se.nti.gymnasiearbete.core.Game;
	import se.nti.gymnasiearbete.objects.Enemy;
	import se.nti.gymnasiearbete.objects.Player;
	import se.nti.gymnasiearbete.objects.Wall;
	/**
	 * ...
	 * @author Lucas Källberg
	 */
	public class CollisionManager extends Sprite
	{
		private var walls:Vector.<Wall>;
		private var enemys:Vector.<Enemy>;
		private var player:Player;
		private var play:PlayState;
		
		public function CollisionManager(play:PlayState) 
		{
			this.play = play;
			
			walls = play.walls;
			
			player = play.player;
		}
		
		private function playerToWalls():void
		{
			for (var i:int = 0; i < walls.length; i++) 
			{
				if (player.bounds.intersects(walls[i].bounds)) 
				{
					player.collideWall(player.bounds.intersection(walls[i].bounds));
				}
			}
		}
		
		public function update():void
		{
			playerToWalls();
		}
		
	}

}