package views
{
	import controllers.LeapSwipeController;
	import controllers.LeapSwipeEvent;
	
	import data.ProjectData;
	import data.VerticalLayoutSettings;
	
	import feathers.controls.ScrollContainer;
	import feathers.layout.VerticalLayout;
	import feathers.system.DeviceCapabilities;
	
	import models.ProjectModel;
	
	import starling.display.Sprite;
	
	public class VerticalScrollViewController extends Sprite
	{
		public var settings:VerticalLayoutSettings;
		
		private var _container:ScrollContainer;
		private var _swipeController:LeapSwipeController;
		
		public function VerticalScrollViewController()
		{
			_init()
		}
		
		private function _init():void
		{
			const layout:VerticalLayout = new VerticalLayout();
			layout.gap = 0;
			layout.paddingTop = 10;
			layout.paddingRight = 10;
			layout.paddingBottom = 10;
			layout.paddingLeft = 10;
			layout.verticalAlign = VerticalLayout.VERTICAL_ALIGN_TOP;
			layout.horizontalAlign = VerticalLayout.HORIZONTAL_ALIGN_LEFT;
			layout
			
			_container = new ScrollContainer();
			_container.layout = layout;
			_container.snapToPages = true;
			_container.snapScrollPositionsToPixels = true;
			_container.horizontalScrollPolicy = ScrollContainer.SCROLL_POLICY_OFF;
			_container.verticalScrollPolicy = ScrollContainer.SCROLL_POLICY_ON;
			_container.width = DeviceCapabilities.screenPixelWidth;
			_container.height = DeviceCapabilities.screenPixelHeight;
			addChild(_container);
			
			var view:ProjectViewController;
			var projects:Vector.<ProjectModel> = ProjectData.projects;
			
			for(var i:int = 0; i < projects.length; i++)
			{
				view = new ProjectViewController();
				view.dataProvider = projects[i];
				_container.addChild(view);
			}
			
			LeapSwipeController.instance.addEventListener(LeapSwipeEvent.UPDATE, _swipeUpdateHandler);
		}
		
		private function _swipeUpdateHandler(event:LeapSwipeEvent):void
		{
			switch(event.direction)
			{
				case LeapSwipeController.UP:
				{
					_container.scrollToPageIndex(0, _container.verticalPageIndex + 1, 1);
					break;
				}
				case LeapSwipeController.DOWN:
				{
					_container.scrollToPageIndex(0, _container.verticalPageIndex - 1, 1);
					break;
				}
			}
		}
	}
}