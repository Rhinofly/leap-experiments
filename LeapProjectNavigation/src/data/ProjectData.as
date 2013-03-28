package data
{
	import flash.display.Bitmap;
	
	import assets.EmbeddedAssets;
	
	import models.ProjectModel;

	public class ProjectData
	{
		public function ProjectData()
		{
		}
		
		static private var _projects:Vector.<ProjectModel>;
		
		static public function get projects():Vector.<ProjectModel>
		{
			if (_projects) return _projects;
			
			_projects = new Vector.<ProjectModel>;
			
			var project:ProjectModel = new ProjectModel();
			project.name = "Wij zijn Rhinofly!";
			project.description = "Bedenkers en makers die geloven in de combinatie concepts & codes. Op zoek naar de grenzen van interactieve communicatie van web, mobile en social. Bekijk het in onze ‘work&play’ video.";
			
			project.caseImages = new Vector.<Bitmap>;
			project.caseImages.push(new EmbeddedAssets.project1_1_1() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project1_1_2() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project1_1_3() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project1_1_4() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project1_1_5() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project1_1_6() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project1_1_7() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project1_1_8() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project1_1_9() as Bitmap);
			
			project.conclusionImages = new Vector.<Bitmap>;
			project.conclusionImages.push(new EmbeddedAssets.project1_2_1() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_2() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_3() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_4() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_5() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_6() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_7() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_8() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_9() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_10() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_11() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_12() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_13() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_14() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_15() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_16() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_17() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_18() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_19() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_20() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_21() as Bitmap);
			
			_projects.push(project);
			
			project = new ProjectModel();
			project.name = "Wij zijn Rhinofly!";
			project.description = "Bedenkers en makers die geloven in de combinatie concepts & codes. Op zoek naar de grenzen van interactieve communicatie van web, mobile en social. Bekijk het in onze ‘work&play’ video.";
			
			project.caseImages = new Vector.<Bitmap>;
			project.caseImages.push(new EmbeddedAssets.project2_1_1() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project2_1_2() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project2_1_3() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project2_1_4() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project2_1_5() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project2_1_6() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project2_1_7() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project2_1_8() as Bitmap);
			
			project.conclusionImages = new Vector.<Bitmap>;
			project.conclusionImages.push(new EmbeddedAssets.project1_2_1() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_2() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_3() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_4() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_5() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_6() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_7() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_8() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_9() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_10() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_11() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_12() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_13() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_14() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_15() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_16() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_17() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_18() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_19() as Bitmap);
			
			_projects.push(project);
			
			project = new ProjectModel();
			project.name = "Wij zijn Rhinofly!";
			project.description = "Bedenkers en makers die geloven in de combinatie concepts & codes. Op zoek naar de grenzen van interactieve communicatie van web, mobile en social. Bekijk het in onze ‘work&play’ video.";
			
			project.caseImages = new Vector.<Bitmap>;
			project.caseImages.push(new EmbeddedAssets.project1_1_1() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project1_1_2() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project1_1_3() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project1_1_4() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project1_1_5() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project1_1_6() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project1_1_7() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project1_1_8() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project1_1_9() as Bitmap);
			
			project.conclusionImages = new Vector.<Bitmap>;
			project.conclusionImages.push(new EmbeddedAssets.project1_2_1() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_2() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_3() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_4() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_5() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_6() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_7() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_8() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_9() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_10() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_11() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_12() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_13() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_14() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_15() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_16() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_17() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_18() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_19() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_20() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_21() as Bitmap);
			
			_projects.push(project);
			
			project = new ProjectModel();
			project.name = "Wij zijn Rhinofly!";
			project.description = "Bedenkers en makers die geloven in de combinatie concepts & codes. Op zoek naar de grenzen van interactieve communicatie van web, mobile en social. Bekijk het in onze ‘work&play’ video.";
			
			project.caseImages = new Vector.<Bitmap>;
			project.caseImages.push(new EmbeddedAssets.project2_1_1() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project2_1_2() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project2_1_3() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project2_1_4() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project2_1_5() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project2_1_6() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project2_1_7() as Bitmap);
			project.caseImages.push(new EmbeddedAssets.project2_1_8() as Bitmap);
			
			project.conclusionImages = new Vector.<Bitmap>;
			project.conclusionImages.push(new EmbeddedAssets.project1_2_1() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_2() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_3() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_4() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_5() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_6() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_7() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_8() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_9() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_10() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_11() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_12() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_13() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_14() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_15() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_16() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_17() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_18() as Bitmap);
			project.conclusionImages.push(new EmbeddedAssets.project1_2_19() as Bitmap);
			
			_projects.push(project);
			
			return _projects;
		}
	}
}