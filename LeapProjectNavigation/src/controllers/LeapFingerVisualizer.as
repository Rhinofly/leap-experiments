package controllers
{
	import com.gskinner.motion.GTween;
	import com.gskinner.motion.GTweener;
	import com.leapmotion.leap.CircleGesture;
	import com.leapmotion.leap.Controller;
	import com.leapmotion.leap.Gesture;
	import com.leapmotion.leap.KeyTapGesture;
	import com.leapmotion.leap.Pointable;
	import com.leapmotion.leap.ScreenTapGesture;
	import com.leapmotion.leap.SwipeGesture;
	import com.leapmotion.leap.Vector3;
	import com.leapmotion.leap.events.LeapEvent;
	import com.leapmotion.leap.util.LeapMath;
	
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	
	public class LeapFingerVisualizer extends Sprite
	{
		private static const RAD_TO_DEG:Number = 180 / Math.PI;
		
		private var _controller:Controller;
		
		private var _container:Sprite;
		private var _tapGesturesContainer:Sprite;
		private var _circleGesturesContainer:Sprite;
		private var _swipeGesturesContainer:Sprite;
		
		public function LeapFingerVisualizer(controller:Controller)
		{
			addEventListener(Event.ADDED_TO_STAGE, _addedToStageHandler);
			
			_controller = controller;
			_controller.addEventListener(LeapEvent.LEAPMOTION_FRAME, leapmotionFrameHandler);
			_controller.enableGesture(Gesture.TYPE_SWIPE);
			_controller.enableGesture(Gesture.TYPE_CIRCLE);
			_controller.enableGesture(Gesture.TYPE_SCREEN_TAP);
			_controller.enableGesture(Gesture.TYPE_KEY_TAP);
			
			_tapGesturesContainer = new Sprite();
			_tapGesturesContainer.mouseChildren = _tapGesturesContainer.mouseEnabled = false;
			addChild(_tapGesturesContainer);
			
			_circleGesturesContainer = new Sprite();
			_circleGesturesContainer.mouseChildren = _circleGesturesContainer.mouseEnabled = false;
			addChild(_circleGesturesContainer);
			
			_swipeGesturesContainer = new Sprite();
			_swipeGesturesContainer.mouseChildren = _swipeGesturesContainer.mouseEnabled = false;
			addChild(_swipeGesturesContainer);
			
			_container = new Sprite();
			_container.mouseChildren = _container.mouseEnabled = false;
			addChild(_container);
		}
		
		private function leapmotionFrameHandler(event:LeapEvent):void
		{
			var startPos:Vector3;
			var endPos:Vector3;
			var startPos2D:Point;
			var endPos2D:Point;
			_container.graphics.clear();
			
			for each (var pointable:Pointable in event.frame.pointables)
			{
				startPos = pointable.tipPosition;
				endPos = pointable.tipPosition.minus(pointable.direction.multiply(pointable.length));
				
				startPos2D = local3DToGlobal(toVector3D(startPos));
				endPos2D = local3DToGlobal(toVector3D(endPos));
				
				_container.graphics.beginFill(0xff0000);
				_container.graphics.lineStyle();
				_container.graphics.drawCircle(startPos2D.x, startPos2D.y, 6);
				_container.graphics.endFill();
				
				_container.graphics.lineStyle(1);
				_container.graphics.moveTo(startPos2D.x, startPos2D.y);
				_container.graphics.lineTo(endPos2D.x, endPos2D.y);
			}
			
			_circleGesturesContainer.removeChildren();
			_swipeGesturesContainer.graphics.clear();
			
			for each (var gesture:Gesture in event.frame.gestures())
			{
				var gestureVisualization:Shape;
				var pos2D:Point;
				var pos3D:Vector3D;
				
				if(gesture is CircleGesture)
				{
					var circleGesture:CircleGesture = gesture as CircleGesture;
					pos3D = toVector3D(circleGesture.center);
					
					gestureVisualization = new Shape();
					gestureVisualization.graphics.lineStyle(2, 0x00ff00);
					gestureVisualization.graphics.drawCircle(0, 0, circleGesture.radius);
					gestureVisualization.x = pos3D.x;
					gestureVisualization.y = pos3D.y;
					gestureVisualization.z = pos3D.z;
					gestureVisualization.rotationX = LeapMath.toDegrees(circleGesture.normal.pitch);
					gestureVisualization.rotationY = LeapMath.toDegrees(circleGesture.normal.yaw);
					gestureVisualization.rotationZ = LeapMath.toDegrees(circleGesture.normal.roll);
					_circleGesturesContainer.addChild(gestureVisualization);
				} else if(gesture is KeyTapGesture)
				{
					var keyTapGesture:KeyTapGesture = gesture as KeyTapGesture;
					pos2D = local3DToGlobal(toVector3D(keyTapGesture.position));
					
					gestureVisualization = new Shape();
					gestureVisualization.graphics.lineStyle(2, 0x0000ff);
					gestureVisualization.graphics.drawCircle(pos2D.x, pos2D.y, 30);
					_tapGesturesContainer.addChild(gestureVisualization);
					
					GTweener.to(gestureVisualization, 1, {alpha: 0}, {onComplete: _completeHandler});
				} else if(gesture is ScreenTapGesture)
				{
					var screenTapGesture:ScreenTapGesture = gesture as ScreenTapGesture;
					pos2D = local3DToGlobal(toVector3D(screenTapGesture.position));
					
					gestureVisualization = new Shape();
					gestureVisualization.graphics.lineStyle(2, 0x00ff00);
					gestureVisualization.graphics.drawCircle(pos2D.x, pos2D.y, 30);
					_tapGesturesContainer.addChild(gestureVisualization);
					
					GTweener.to(gestureVisualization, 1, {alpha: 0}, {onComplete: _completeHandler});
				} else if(gesture is SwipeGesture)
				{
					var swipeGesture:SwipeGesture = gesture as SwipeGesture;
					startPos = swipeGesture.startPosition;
					endPos = swipeGesture.position;
					
					startPos2D = local3DToGlobal(toVector3D(startPos));
					endPos2D = local3DToGlobal(toVector3D(endPos));
					
					_swipeGesturesContainer.graphics.lineStyle(1, 0xff00ff);
					_swipeGesturesContainer.graphics.moveTo(startPos2D.x, startPos2D.y);
					_swipeGesturesContainer.graphics.lineTo(endPos2D.x, endPos2D.y);
				}
			}
		}
		
		private function _completeHandler(tween:GTween):void
		{
			_tapGesturesContainer.removeChild(tween.target as DisplayObject);
		}
		
		private function toVector3D(vec3:Vector3):Vector3D
		{
			return new Vector3D(stage.stageWidth * .5 + vec3.x, stage.stageHeight - vec3.y, -vec3.z);
		}
		
		private function _addedToStageHandler(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, _addedToStageHandler);
			
			stage.addEventListener(Event.RESIZE, _resizeHandler);
			_resizeHandler();
		}
		
		private function _resizeHandler(event:Event = null):void
		{
			root.transform.perspectiveProjection.projectionCenter = new Point(stage.stageWidth * .5, stage.stageHeight * .5);
		}
	}
}