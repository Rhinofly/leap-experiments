package
{
	import com.leapmotion.leap.LeapMotion;
	import com.leapmotion.leap.events.LeapEvent;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.ui.ContextMenu;
	
	import controllers.LeapHandController;
	
	import views.LandscapeViewController;
	
	[SWF(width="1280", height="720", frameRate="60", backgroundColor="#F5F5F5")]
	public class LeapProjectLandscape extends Sprite
	{
		static public var leap:LeapMotion;
		
		private var _landscape:LandscapeViewController;
		
		public function LeapProjectLandscape()
		{
			var menu:ContextMenu = new ContextMenu();
			menu.hideBuiltInItems();
			contextMenu = menu;
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			leap = new LeapMotion();
			leap.controller.addEventListener(LeapEvent.LEAPMOTION_CONNECTED, _connectedHandler);
		}
		
		private function _connectedHandler(event:LeapEvent):void
		{
			leap.controller.removeEventListener(LeapEvent.LEAPMOTION_CONNECTED, _connectedHandler);
			
			LeapHandController.instance.init(leap.controller);
			
			_landscape = new LandscapeViewController();
			addChild(_landscape);
		}
	}
}