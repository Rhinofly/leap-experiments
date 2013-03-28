package controllers
{
	import com.leapmotion.leap.Controller;
	import com.leapmotion.leap.Gesture;
	import com.leapmotion.leap.SwipeGesture;
	import com.leapmotion.leap.events.LeapEvent;
	
	import flash.events.EventDispatcher;
	import flash.utils.getTimer;
	
	public class LeapSwipeController extends EventDispatcher
	{
		static private var _instance:LeapSwipeController;		
		
		static public function get instance():LeapSwipeController
		{
			if (!_instance)
			{
				_instance = new LeapSwipeController(null);
			}
			
			return _instance; 
		}
		
		static public const UP:String = "up";
		static public const DOWN:String = "down";
		static public const LEFT:String = "left";
		static public const RIGHT:String = "right";
		
		static public var swipeInterval:int = 1000;
		static public var swipeSpeed:int = 1000;
		
		private var _now:int;
		private var _lastSwipe:int
		
		private var _gestures:Vector.<Gesture>;
		private var _gesture:Gesture;
		private var _swipe:SwipeGesture;
		
		private var _controller:Controller;
		
		public function LeapSwipeController(singleton:Singleton)
		{
		}
		
		public function init(controller:Controller):void
		{
			if (_controller)
			{
				_controller.removeEventListener(LeapEvent.LEAPMOTION_FRAME, _frameHandler);
				_controller.enableGesture(Gesture.TYPE_SWIPE, false);
				_controller = null;
			}
			
			_controller = controller;
			_controller.addEventListener(LeapEvent.LEAPMOTION_FRAME, _frameHandler);
			_controller.enableGesture(Gesture.TYPE_SWIPE);
		}
		
		private function _frameHandler(event:LeapEvent):void
		{
			_now = getTimer();
			
			if (_now - _lastSwipe > swipeInterval)
			{
				_gestures = event.frame.gestures();
				
				for each(_gesture in _gestures)
				{
					if (_gesture is SwipeGesture)
					{
						_swipe = _gesture as SwipeGesture;
						
						if (_swipe.speed > swipeSpeed)
						{
							var swipeEvent:LeapSwipeEvent = new LeapSwipeEvent(LeapSwipeEvent.UPDATE);
							
							if (Math.abs(_swipe.direction.x) > Math.abs(_swipe.direction.y))
							{
								if (_swipe.direction.x > 0)
								{
									swipeEvent.direction = RIGHT;
								}
								else
								{
									// left
									swipeEvent.direction = LEFT;
								}
							} else
							{
								if (_swipe.direction.y > 0)
								{
									// up
									swipeEvent.direction = UP;
								}
								else
								{
									// down
									swipeEvent.direction = DOWN;
								}
							}
							
							dispatchEvent(swipeEvent);
							
							_lastSwipe = _now;
							break;
						}
					}
				}
			}
		}
	}
}

class Singleton
{
}