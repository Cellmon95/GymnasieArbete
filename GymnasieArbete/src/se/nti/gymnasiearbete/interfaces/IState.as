package se.nti.gymnasiearbete.interfaces 
{
	import starling.events.EnterFrameEvent;
	
	/**
	 * ...
	 * @author Lucas Källberg
	 */
	public interface IState
	{
		function update(e:EnterFrameEvent):void
		function dispose():void
	}
	
}