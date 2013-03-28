package controllers
{
	import flash.events.Event;
	
	public class LeapSwipeEvent extends Event
	{
		static public const UPDATE:String = "updateSwipe";
		
		public var direction:String;
		
		public function LeapSwipeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}