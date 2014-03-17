package se.nti.gymnasiearbete.managers 
{
	import flash.geom.Rectangle;
	import se.nti.gymnasiearbete.objects.Score;
	import se.nti.gymnasiearbete.states.PlayState;
	import starling.display.Sprite;
	import se.nti.gymnasiearbete.core.Game;
	import se.nti.gymnasiearbete.objects.Enemy;
	import se.nti.gymnasiearbete.objects.Player;
	import se.nti.gymnasiearbete.objects.Wall;
	import starling.extensions.tmxmaps.TMXObject;
	/**
	 * ...
	 * @author Lucas Källberg
	 */
	public class CollisionManager extends Sprite
	{
		private var walls:Vector.<Rectangle>;
		private var scores:Vector.<Score>;
		private var player:Player;
		private var play:PlayState;
		private var enemys:Vector.<Enemy>;
		
		public function CollisionManager(play:PlayState) 
		{
			this.play = play;
			
			walls = play.map.collisionRectangels;
			scores = play.scores;
			
			player = play.player;
			enemys = play.enemys;
			
		}
		
		
		private function characterToWalls():void
		{
			for (var i:int = 0; i < walls.length; i++) 
			{
				if (player.bounds.intersects(walls[i])) 
				{
					player.collideWall(player.bounds.intersection(walls[i]));
				}
				
				for (var j:int = 0; j < enemys.length; j++) 
				{
					if (enemys[j].bounds.intersects(walls[i])) 
					{
						enemys[j].collideWall(enemys[j].bounds.intersection(walls[i]));
					}					
				}
			}
		}
		
		private function playerToScore():void
		{
			for (var i:int = 0; i < scores.length; i++) 
			{
					if (player.bounds.intersects(scores[i].bounds))
					{
						var tmp:Score = scores[i];
						scores.splice(i, 1);
						
						tmp.removeFromParent(true);
						tmp.dispose();
						tmp = null;
						play.playerScore++;
						trace(play.playerScore);
					}
			}
		}
		
		private function playerToEnemys():void
		{
			for (var i:int = 0; i < enemys.length; i++) 
			{
				if (player.bounds.intersects(enemys[i].bounds)) 
				{
					if (Enemy.chased) 
					{
						var tmpEnemy:Enemy = enemys[i];
						enemys.splice(i, 1);
						tmpEnemy.dispose();
						tmpEnemy = null;
						
						play.playerScore += 50;
					}
					
					else
					{
						play.game.changeState(Game.GAME_OVER_STATE);
						break;	
					}
				}
			}
		}
		
		public function update():void
		{
			characterToWalls();
			playerToScore();
			playerToEnemys();
		}
		
	}

}