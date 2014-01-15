package se.nti.gymnasiearbete.core 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.KeyboardEvent;
	import flash.events.SoftKeyboardTrigger;
	
	/**
	 * ...
	 * @author Lucas Källberg
	 */
	public class Input extends Sprite 
	{
		public static const keysDown:Vector.<Boolean> = new Vector.<Boolean>(256);
		private static var active:Boolean = false;
		private static var dispatcher:EventDispatcher;
		
		public static function get isActive():Boolean
		{
			return active;
		}
		
		public function Input() 
		{
		}
		
		public static function start(_dispatcher:EventDispatcher):void
		{
			dispatcher = _dispatcher;
			dispatcher.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			dispatcher.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			active = true;
		}
		
		private static function keyDown(k:KeyboardEvent):void
		{
			keysDown[k.keyCode] = true;
			trace(k.keyCode);
		}
		
		private static function keyUp(k:KeyboardEvent):void
		{
			keysDown[k.keyCode] = false;
		}
		
		public static function end():void
		{
			dispatcher.removeEventListener(KeyboardEvent.KEY_UP, keyUp);
			dispatcher.removeEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			active = false;
		}
		
		public static const KEY_ESCAPE:uint = 27,
							KEY_ENTER:uint = 13,
							KEY_PAGEUP:uint = 33,
							KEY_PAGEDOWN:uint = 34,
							KEY_END:uint = 35,
							KEY_HOME:uint = 36,
							KEY_F1:uint = 112,
							KEY_F2:uint = 113,
							KEY_F3:uint = 114,
							KEY_F4:uint = 115,
							KEY_F5:uint = 116,
							KEY_F6:uint = 117,
							KEY_F7:uint = 118,
							KEY_F8:uint = 119,
							KEY_F9:uint = 120,
							KEY_F11:uint = 122,
							KEY_F12:uint = 123,
							KEY_1:uint = 49,
							KEY_2:uint = 50,
							KEY_3:uint = 51,
							KEY_4:uint = 52,
							KEY_A:uint = 65,
							KEY_D:uint = 68,
							KEY_H:uint = 72,
							KEY_S:uint = 83,
							KEY_T:uint = 84,
							KEY_W:uint = 87,
							KEY_SHIFT:uint = 16,
							KEY_CONTROL:uint = 17,
							KEY_UP:uint = 38,
							KEY_DOWN:uint = 40,
							KEY_LEFT:uint = 37,
							KEY_RIGHT:uint = 39,
							KEY_SPACE:uint = 32;
	}

}