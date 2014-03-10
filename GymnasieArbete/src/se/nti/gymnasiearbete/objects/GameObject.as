package se.nti.gymnasiearbete.objects 
{
	import starling.display.Sprite;
	import starling.events.Event;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	/**
	 * @author Lucas Källberg
	 */
	public class GameObject extends Sprite
	{
		//Don't know if i should use this class at all.
		public function get Collisionable():Boolean
		{
			return false;
		}
		
		public function GameObject() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		protected function init(e:Event):void
		{
			
		}
		
		public function getClass():Class 
		{
		   return Class(getDefinitionByName(getQualifiedClassName(this)));
		}
		
		public function getObject():Object
		{
			return this;
		}	
	}
}