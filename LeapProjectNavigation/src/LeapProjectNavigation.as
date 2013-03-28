package
{
	import com.leapmotion.leap.LeapMotion;
	import com.leapmotion.leap.events.LeapEvent;
	
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.ui.ContextMenu;
	
	import controllers.LeapFingerController;
	import controllers.LeapFingerVisualizer;
	import controllers.LeapSwipeController;
	
	import feathers.system.DeviceCapabilities;
	
	import starling.core.Starling;
	
	import views.MainViewController;
	
	[SWF(width="1280",height="720",frameRate="60",backgroundColor="#F5F5F5")]
	public class LeapProjectNavigation extends MovieClip
	{
		static public var leap:LeapMotion;
		
		private var _fingerVisualizer:LeapFingerVisualizer;
		
		private var _starling:Starling;
		
		public function LeapProjectNavigation()
		{
			var menu:ContextMenu = new ContextMenu();
			menu.hideBuiltInItems();
			contextMenu = menu;
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			//pretends to be an iPhone Retina screen
			DeviceCapabilities.dpi = 326;
			DeviceCapabilities.screenPixelWidth = stage.stageWidth;
			DeviceCapabilities.screenPixelHeight = stage.stageHeight;
			
			Starling.handleLostContext = true;
			Starling.multitouchEnabled = true;
			
			leap = new LeapMotion();
			leap.controller.addEventListener(LeapEvent.LEAPMOTION_CONNECTED, _connectedHandler);
		}
		
		private function _connectedHandler(event:LeapEvent):void
		{
			leap.controller.removeEventListener(LeapEvent.LEAPMOTION_CONNECTED, _connectedHandler);
			
			LeapSwipeController.instance.init(leap.controller);
			LeapFingerController.instance.init(this, leap.controller);
			
			_fingerVisualizer = new LeapFingerVisualizer(leap.controller);
			addChild(_fingerVisualizer);
			
			_starling = new Starling(MainViewController, stage);
			_starling.start();
		}
	}
}