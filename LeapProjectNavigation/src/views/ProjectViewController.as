package views
{
	import feathers.layout.HorizontalLayout;
	import feathers.system.DeviceCapabilities;
	
	import models.ProjectModel;
	
	import starling.display.Sprite;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	public class ProjectViewController extends Sprite
	{
		private var _title:starling.text.TextField;
		private var _description:starling.text.TextField;
		private var _case:HorizontalScrollViewController;
		private var _conclusion:HorizontalScrollViewController;
		private var _data:ProjectModel;
		
		public function ProjectViewController()
		{
			_init();
		}
		

		private function _init():void
		{
			
		}
		
		private function _processData():void
		{
			_title = new TextField(DeviceCapabilities.screenPixelWidth, 80, _data.name, "Verdana", 48, 0x999999, true);
			_title.hAlign = HAlign.LEFT;
			_title.vAlign = VAlign.TOP;
			addChild(_title);
			
			_description = new TextField(DeviceCapabilities.screenPixelWidth / 2, 100, _data.description, "Verdana", 18, 0x666666, false);
			_description.hAlign = HAlign.LEFT
			_description.vAlign = VAlign.TOP;
			_description.y = _title.y + _title.height + 20;
			addChild(_description);
			
			_case = new HorizontalScrollViewController();
			_case.y = _description.y + _description.height + 20;
			_case.dataProvider = _data.caseImages;
			addChild(_case);

			_conclusion = new HorizontalScrollViewController();
			_conclusion.y = _case.y + _case.height + 20;
			_conclusion.dataProvider = _data.conclusionImages;
			addChild(_conclusion);
		}

		public function get dataProvider():ProjectModel
		{
			return _data;
		}

		public function set dataProvider(value:ProjectModel):void
		{
			_data = value;
			_processData();
		}
		
		override public function get width():Number
		{
			return DeviceCapabilities.screenPixelWidth;
		}

		override public function get height():Number
		{
			return DeviceCapabilities.screenPixelHeight;
		}
	}
}