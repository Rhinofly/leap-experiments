package views
{
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import assets.CubeSide;
	
	import away3d.cameras.Camera3D;
	import away3d.containers.Scene3D;
	import away3d.containers.View3D;
	import away3d.controllers.FirstPersonController;
	import away3d.debug.AwayStats;
	import away3d.entities.Mesh;
	import away3d.materials.TextureMaterial;
	import away3d.primitives.CubeGeometry;
	import away3d.textures.BitmapCubeTexture;
	import away3d.textures.BitmapTexture;
	
	import controllers.LeapHandController;
	
	public class LandscapeViewController extends Sprite
	{
		private var _scene:Scene3D;
		private var _camera:Camera3D;
		private var _view:View3D;
		private var _awayStats:AwayStats;
		private var _controller:FirstPersonController;
		
		private var _material:TextureMaterial;
		
		public function LandscapeViewController()
		{
			addEventListener(Event.ADDED_TO_STAGE, _init);
		}
		
		private function _init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, _init);
			
			_initEngine();
			_initMaterials();
			_initObjects();
			_initEventHandlers();
		}
		
		private function _initEngine():void
		{
			_scene = new Scene3D();
			
			_camera = new Camera3D();
			_camera.moveTo(0, 0, -3000);
			
			_view = new View3D();
			_view.backgroundColor = 0xF5F5F5;
			_view.scene = _scene;
			_view.camera = _camera;
			addChild(_view);
			
			_controller = new FirstPersonController(_camera, 0, 0);
			
			addChild(_awayStats = new AwayStats(_view));
		}
		
		private function _initMaterials():void
		{
			var bmd:BitmapData = new CubeSide().bitmapData;
			
			_material = new TextureMaterial(new BitmapTexture(bmd), true, true);
		}
		
		private function _initObjects():void
		{
			var geometry:CubeGeometry = new CubeGeometry(150, 150, 150);
			geometry.tile6 = false;
			var cube:Mesh;
			
			for (var i:int = 0; i < 10; i++) 
			{
				for (var j:int = 0; j < 10; j++) 
				{
					for (var k:int = 0; k < 10; k++) 
					{
						cube = new Mesh(geometry, _material);
						cube.x = i * 400 - 2000;
						cube.y = j * 400 - 2000;
						cube.z = k * 400 - 2000;
						_view.scene.addChild(cube);
					}
				}
			}
		}
		
		private function _initEventHandlers():void
		{
			stage.addEventListener(Event.ENTER_FRAME, _enterFrameHandler);
			stage.addEventListener(Event.RESIZE, _resizeHandler);
			
			_resizeHandler();
		}

		private function _enterFrameHandler(event:Event):void
		{
			if (LeapHandController.instance.gotHand)
			{
				_controller.panAngle += -(LeapHandController.instance.roll / 50);
				_controller.incrementWalk(-(LeapHandController.instance.pitch / 2));
				_camera.y += (LeapHandController.instance.palmPosition.y - 500) / 10;
			}
			
			_view.render();
		}
		
		private function _resizeHandler(event:Event = null):void
		{
			_view.width = stage.stageWidth;
			_view.height = stage.stageHeight;
		}
	}
}