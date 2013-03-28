package views
{
	import starling.display.Sprite;
	
	public class MainViewController extends Sprite
	{
		private var _screen:VerticalScrollViewController;
		
		public function MainViewController()
		{
			_screen = new VerticalScrollViewController();
			addChild(_screen);
		}
	}
}