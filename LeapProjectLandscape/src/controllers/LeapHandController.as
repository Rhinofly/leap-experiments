package controllers
{
	import com.leapmotion.leap.Controller;
	import com.leapmotion.leap.Frame;
	import com.leapmotion.leap.Hand;
	import com.leapmotion.leap.Vector3;
	import com.leapmotion.leap.events.LeapEvent;
	import com.leapmotion.leap.util.LeapMath;
	
	import flash.events.EventDispatcher;
	
	import mx.core.Singleton;
	
	public class LeapHandController extends EventDispatcher
	{
		static private var _instance:LeapHandController;		
		
		static public function get instance():LeapHandController
		{
			if (!_instance)
			{
				_instance = new LeapHandController(null);
			}
			
			return _instance; 
		}
		
		private var _controller:Controller;
		
		private var _frame:Frame;
		private var _hand:Hand;
		private var _normal:Vector3;
		private var _direction:Vector3;
		
		public var sphereRadius:Number = 0;
		public var palmPosition:Vector3 = new Vector3(0, 0, 0);
		
		public var pitch:Number = 0;
		public var roll:Number = 0;
		public var yaw:Number = 0;
		public var gotHand:Boolean;
		
		public function LeapHandController(singleton:Singleton)
		{
		}
		
		public function init(controller:Controller):void
		{
			if (_controller)
			{
				_controller.removeEventListener(LeapEvent.LEAPMOTION_FRAME, _frameHandler);
				_controller = null;
			}
			
			_controller = controller;
			_controller.addEventListener(LeapEvent.LEAPMOTION_FRAME, _frameHandler);
		}
		
		private function _frameHandler(event:LeapEvent):void
		{
			_frame = event.frame;
			
			gotHand = _frame.hands.length > 0;
			
			if (gotHand)
			{
				// Get the first hand
				_hand = _frame.hands[0];
				
				// Get the hand's sphere radius and palm position
				sphereRadius = _hand.sphereRadius;
				palmPosition = _hand.palmPosition;
				
				//trace("Hand sphere radius: " + sphereRadius + " mm, palm position: " + palmPosition);
				
				// Get the _hand's normal vector and direction
				_normal = _hand.palmNormal;
				_direction = _hand.direction;
				
				// Calculate the hand's pitch, roll, and yaw angles
				pitch = LeapMath.toDegrees(_direction.pitch);
				roll = LeapMath.toDegrees(_normal.roll);
				yaw = LeapMath.toDegrees(_direction.yaw);
				
				var updateEvent:LeapHandEvent = new LeapHandEvent(LeapHandEvent.UPDATE);
				updateEvent.sphereRadius = sphereRadius;
				updateEvent.palmPosition = palmPosition;
				updateEvent.pitch = pitch;
				updateEvent.roll = roll;
				updateEvent.yaw = yaw;
				
				dispatchEvent(updateEvent);
			}
		}
	}
}