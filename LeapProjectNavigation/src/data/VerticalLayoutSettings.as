package data
{
	import feathers.layout.VerticalLayout;

	public class VerticalLayoutSettings extends VerticalLayout
	{
		public function VerticalLayoutSettings()
		{
			//horizontalAlign = VerticalLayout.HORIZONTAL_ALIGN_LEFT;
			gap = 10;
			paddingTop = 10;
			paddingRight = 10;
			paddingBottom = 10;
			paddingLeft = 10;
			verticalAlign = VerticalLayout.VERTICAL_ALIGN_TOP;
			
			/*
			const layout:VerticalLayout = new VerticalLayout();
			layout.gap = 10;
			layout.paddingTop = 10;
			layout.paddingRight = 10;
			layout.paddingBottom = 10;
			layout.paddingLeft = 10;
			layout.verticalAlign = VerticalLayout.VERTICAL_ALIGN_TOP;
			*/
		}
	}
}
