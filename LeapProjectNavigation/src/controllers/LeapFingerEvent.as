package controllers
{
	import flash.events.Event;
	import flash.geom.Point;
	
	public class LeapFingerEvent extends Event
	{
		static public const UPDATE:String = "updateFinger"; 
		
		public var data:Vector.<Point>;
			
		public function LeapFingerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}