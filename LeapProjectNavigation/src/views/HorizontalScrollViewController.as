package views
{
	import flash.display.Bitmap;
	import flash.geom.Point;
	
	import controllers.LeapFingerController;
	import controllers.LeapSwipeController;
	import controllers.LeapSwipeEvent;
	
	import data.HorizontalLayoutSettings;
	
	import feathers.controls.ScrollContainer;
	import feathers.layout.HorizontalLayout;
	import feathers.system.DeviceCapabilities;
	
	import oak.math.Random;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;

	public class HorizontalScrollViewController extends Sprite
	{
		public var settings:HorizontalLayoutSettings;
		
		private var _container:ScrollContainer;
		private var _data:Vector.<Bitmap>;
		
		public function HorizontalScrollViewController()
		{
			_init()
		}

		private function _init():void
		{
			const layout:HorizontalLayout = new HorizontalLayout();
			layout.gap = 10;
			layout.paddingTop = 10;
			layout.paddingRight = 0;
			layout.paddingBottom = 10;
			layout.paddingLeft = 0;
			layout.horizontalAlign = HorizontalLayout.VERTICAL_ALIGN_BOTTOM

			_container = new ScrollContainer();
			_container.layout = layout;
			_container.horizontalScrollPolicy = ScrollContainer.SCROLL_POLICY_ON;
			_container.verticalScrollPolicy = ScrollContainer.SCROLL_POLICY_OFF;
			_container.snapScrollPositionsToPixels = true;
			_container.width = DeviceCapabilities.screenPixelWidth - 20;
			addChild(_container);
		}
		
		private function _processData():void
		{
			var image:Image;
			var maxheight:int;
			
			for(var i:int = 0; i < _data.length; i++)
			{
				image = new Image(Texture.fromBitmap(_data[i]));
				image.scaleX = image.scaleY = Random.float(.3, .8);
				_container.addChild(image);
				
				if (image.height > maxheight) maxheight = image.height;
			}
			
			_container.height = maxheight;
			
			LeapSwipeController.instance.addEventListener(LeapSwipeEvent.UPDATE, _swipeUpdateHandler);
		}
		
		private function _swipeUpdateHandler(event:LeapSwipeEvent):void
		{
			/*
			var hit:Boolean;
			var finger:Point;
			var fingers:Vector.<Point> = LeapFingerController.instance.fingers;
			
			for (var i:int = 0; i < fingers.length; i++) 
			{
				finger = fingers[i];
				
				trace(x, width, y, height, finger);
				
				if (finger && finger.x > x && finger.x < (x + width) && finger.y > y && finger.y < (y + height))
				{
					hit = true;
					
					trace("got hit");
					
					break;
				}
			}
			
			if (!hit) return;
			*/
			switch(event.direction)
			{
				case LeapSwipeController.LEFT:
				{
					_container.scrollToPosition(_container.horizontalScrollPosition + 1000, 0, 1);
					break;
				}
				case LeapSwipeController.RIGHT:
				{
					_container.scrollToPosition(_container.horizontalScrollPosition - 1000, 0, 1);
					break;
				}
			}
		}
		
		public function get dataProvider():Vector.<Bitmap>
		{
			return _data;
		}
		
		public function set dataProvider(value:Vector.<Bitmap>):void
		{
			_data = value;
			_processData();
		}
	}
}
