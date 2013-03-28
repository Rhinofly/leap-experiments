package data
{
	import feathers.layout.HorizontalLayout;

	public class HorizontalLayoutSettings extends HorizontalLayout
	{
		public function HorizontalLayoutSettings()
		{
			horizontalAlign = HorizontalLayout.HORIZONTAL_ALIGN_LEFT;
			//verticalAlign = HorizontalLayout.VERTICAL_ALIGN_TOP;
			gap = 10;
			paddingTop = 10;
			paddingRight = 10;
			paddingBottom = 10;
			paddingLeft = 10;
			
			/*
			const layout:HorizontalLayout = new HorizontalLayout();
			layout.gap = 10;
			layout.paddingTop = 10;
			layout.paddingRight = 10;
			layout.paddingBottom = 10;
			layout.paddingLeft = 10;
			layout.horizontalAlign = HorizontalLayout.VERTICAL_ALIGN_TOP
			*/
		}
	}
}
