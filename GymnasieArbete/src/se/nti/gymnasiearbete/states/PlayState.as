package se.nti.gymnasiearbete.states 
{
	import flash.events.EventDispatcher;
	import se.nti.gymnasiearbete.core.Assets;
	import se.nti.gymnasiearbete.core.Game;
	import se.nti.gymnasiearbete.interfaces.IState;
	import se.nti.gymnasiearbete.managers.CollisionManager;
	import se.nti.gymnasiearbete.objects.Enemy;
	import se.nti.gymnasiearbete.objects.GameObject;
	import se.nti.gymnasiearbete.objects.Map;
	import se.nti.gymnasiearbete.objects.Player;
	import se.nti.gymnasiearbete.objects.Score;
	import se.nti.gymnasiearbete.objects.Wall;
	import se.nti.gymnasiearbete.objects.VisualObject;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import se.nti.gymnasiearbete.core.Input;
	import starling.text.TextField;
	
	/**
	 * ...
	 * @author Lucas Källberg
	 */
	public class PlayState extends Sprite implements IState
	{
		public var game:Game;
		private var collisionManager:CollisionManager;
		
		//public var gameObjects:Vector.<GameObject>;
		public var walls:Vector.<Wall>;
		public var scores:Vector.<Score>;
		public var player:Player;
		public var enemys:Vector.<Enemy>;
		public var playerScore:int;
		public var map:Map;
		private var playerScoreText:TextField;
		
		public function PlayState(game:Game) 
		{
			this.game = game;
			Input.start(Starling.current.nativeStage);
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void
		{
			walls = new Vector.<Wall>;
			scores = new Vector.<Score>;
			player = new Player(game, 64, 32 * 10);
			enemys = new Vector.<Enemy>;
			map = new Map(game);
			
			collisionManager = new CollisionManager(this);
			
			playerScoreText = new TextField(70, 20, "Score: ");
			playerScoreText.color = 0xffffff;
			
			playerScore = 0;
			
			enemys[0] = new Enemy(game, 0, 200);
			enemys[1] = new Enemy(game, 0, 200);
			enemys[2] = new Enemy(game, 0, 200);
			enemys[3] = new Enemy(game, 0, 200);
			
			enemys[0].changeForm();
			
			//TODO:: make this better
			for (var i:int = 0; i < map.scoresPos.length; i++) 
			{
				scores.push(new Score(game, map.scoresPos[i].x, map.scoresPos[i].y - 32));
			}
			
			draw();
			
		}
		
		private function draw():void
		{			
/*			for (var y:int = 0; y < 20; y++) 
			{
				for (var x:int = 0; x < 25; x++) 
				{
					switch (Assets.map[y][x]) 
					{
						case 1:
							walls.push(new Wall(game));
							walls[walls.length - 1].x = 32 * x;
							walls[walls.length - 1].y = 32 * y;
							game.addChild(walls[walls.length - 1]);
						break;
						
						case 0:
							var img:Image = new Image(Assets.gridText);
							img.x = 32 * x;
							img.y = 32 * y;
							game.addChild(img);
						break;
						
						case 2:
							scores.push(new Score(game));
							scores[scores.length - 1].x = 32 * x;
							scores[scores.length - 1].y = 32 * y;
							game.addChild(scores[scores.length - 1]);
						break;
						default:
					}
				}	
			}*/
			game.addChild(map);
			game.addChild(playerScoreText);
			game.addChild(player);
			
			for (var i:int = 0; i < enemys.length; i++) 
			{
				game.addChild(enemys[i]);				
			}
			
			for (var i:int = 0; i < scores.length; i++) 
			{
				game.addChild(scores[i]);
			}
			
		}
		
		public function update(e:EnterFrameEvent):void
		{
			player.update(e);
			for (var i:int = 0; i < enemys.length; i++) 
			{
				enemys[i].update(e);
			}
			collisionManager.update();
			playerScoreText.text = "Score: " + playerScore;
		}
		
		override public function dispose():void 
		{
			super.dispose();
			
			Input.end();
			
			game.removeChild(player);
			player.dispose();
			player = null;
			
			for (var i:int = 0; i < scores.length; i++) 
			{
				game.removeChild(scores[i]);
				scores[i].dispose();
				scores[i] = null;
			}
			
			for (var i:int = 0; i < walls.length; i++) 
			{
				walls[i].dispose()
				walls[i] = null;
			}
			
			for (var i:int = 0; i < enemys.length; i++) 
			{
				game.removeChild(enemys[i]);
				enemys[i].dispose();
				enemys[i] = null;
			}
			
			map.dispose();
			//map = null;
		}
	}
}