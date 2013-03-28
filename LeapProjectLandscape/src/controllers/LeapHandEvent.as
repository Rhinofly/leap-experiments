package controllers
{
	import com.leapmotion.leap.Vector3;
	
	import flash.events.Event;
	
	public class LeapHandEvent extends Event
	{
		static public const UPDATE:String = "updateHand";
		
		public var sphereRadius:Number;
		public var palmPosition:Vector3;
		
		public var pitch:Number;
		public var roll:Number;
		public var yaw:Number;
		
		public function LeapHandEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}