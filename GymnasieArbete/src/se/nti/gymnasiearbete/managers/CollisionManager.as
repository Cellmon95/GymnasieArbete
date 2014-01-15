package se.nti.gymnasiearbete.managers 
{
	import se.nti.gymnasiearbete.core.Game;
	import se.nti.gymnasiearbete.objects.Enemy;
	import se.nti.gymnasiearbete.objects.Player;
	import se.nti.gymnasiearbete.objects.Wall;
	/**
	 * ...
	 * @author Lucas Källberg
	 */
	public class CollisionManager
	{
		private var walls:Vector.<Wall>;
		private var enemys:Vector.<Enemy>;
		private var player:Player;
		private var game:Game;
		
		public function CollisionManager(game:Game) 
		{
			this.game = game;
			
			
		}
		
	}

}