package se.nti.gymnasiearbete.states 
{
	import flash.events.EventDispatcher;
	import se.nti.gymnasiearbete.core.Assets;
	import se.nti.gymnasiearbete.core.Game;
	import se.nti.gymnasiearbete.interfaces.IState;
	import se.nti.gymnasiearbete.managers.CollisionManager;
	import se.nti.gymnasiearbete.objects.GameObject;
	import se.nti.gymnasiearbete.objects.Player;
	import se.nti.gymnasiearbete.objects.Wall;
	import se.nti.gymnasiearbete.objects.VisualObject;
	import starling.core.Starling;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import se.nti.gymnasiearbete.core.Input;
	
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
		public var player:Player;
		
		public function PlayState(game:Game) 
		{
			this.game = game;
			Input.start(Starling.current.nativeStage);
			init();
			addEventListener(Event.ADDED_TO_STAGE, draw);
		}
		
		private function init():void
		{
			/*gameObjects = new Vector.<GameObject>;
			//player = new Player(game, 200);
			//wall = new Wall(game, 200, 300);
			
			gameObjects.push(new Player(game, 200));
			gameObjects.push(new Wall(game, 200, 300));*/
			
			walls = new Vector.<Wall>;
			player = new Player(game);
			
			collisionManager = new CollisionManager(this);
		}
		
		private function draw(e:Event):void
		{
			/*for (var i:int = 0; i < gameObjects.length; i++) 
			{
				if (typeof(gameObjects[i]) == typeof(VisualObject))
				game.addChild(gameObjects[i]);
			}*/
			
			game.addChild(player);
			
			for (var y:int = 0; y < 20; y++) 
			{
				for (var x:int = 0; x < 25; x++) 
				{
					switch (Assets.map[y][x]) 
					{
						case 1:
							walls.push(new Wall(game));
							walls[walls.length - 1].x = 32 * x;
							walls[walls.length - 1].y = 32 * y;
							addChild(walls[walls.length - 1]);
						break;
						
						case 0:
						break;
						default:
					}
				}
			}
		}
		
		public function update(e:EnterFrameEvent):void
		{
/*			var tmp:VisualObject;
			
			for (var i:int = 0; i < gameObjects.length; i++) 
			{
				if (typeof(gameObjects[i]) == typeof(VisualObject)) 
				tmp = gameObjects[i] as VisualObject;
				tmp.update(e)
			}*/
			player.update(e);
			collisionManager.update();
		}
		
		override public function dispose():void 
		{
			super.dispose();
/*			for (var i:int = 0; i < gameObjects.length; i++) 
			{
				gameObjects[i].dispose();
			}*/
			Input.end();
		}
	}
}