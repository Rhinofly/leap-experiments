package controllers
{
	import com.leapmotion.leap.Controller;
	import com.leapmotion.leap.Frame;
	import com.leapmotion.leap.Pointable;
	import com.leapmotion.leap.Vector3;
	import com.leapmotion.leap.events.LeapEvent;
	
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.events.EventDispatcher;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	
	public class LeapFingerController extends EventDispatcher
	{
		static private var _instance:LeapFingerController;		
		
		static public function get instance():LeapFingerController
		{
			if (!_instance)
			{
				_instance = new LeapFingerController(null);
			}
			
			return _instance; 
		}
		
		private var _stage:DisplayObject;
		private var _controller:Controller;
		
		public var fingers:Vector.<Point> = new Vector.<Point>;
		
		public function LeapFingerController(singleton:Singleton)
		{
		}
		
		public function init(stage:DisplayObject, controller:Controller):void
		{
			_stage = stage;
			
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
			var frame:Frame = event.frame;
			
			if (frame.pointables.length < 1) return;
			
			 //Remove all fingers from vector
			fingers.splice(0, fingers.length);
			
			var startPos:Vector3;
			var startPos2D:Point;
			//var endPos:Vector3;
			//var endPos2D:Point;
			
			for each (var pointable:Pointable in frame.pointables)
			{
				startPos = pointable.tipPosition;
				startPos2D = _stage.local3DToGlobal(toVector3D(startPos));
				
				fingers.push(startPos2D);
				
				//maybe implement the endpostion for a later stage.
				//endPos = pointable.tipPosition.minus(pointable.direction.multiply(pointable.length));
				//endPos2D = _stage.local3DToGlobal(toVector3D(endPos));
			}
			
			var fingerEvent:LeapFingerEvent = new LeapFingerEvent(LeapFingerEvent.UPDATE);
			fingerEvent.data = fingers;
			
			dispatchEvent(fingerEvent);
			
		}
		
		private function toVector3D(vec3:Vector3):Vector3D
		{
			return new Vector3D(_stage.width * .5 + vec3.x, _stage.height - vec3.y, -vec3.z);
		}
	}
}

class Singleton
{
}