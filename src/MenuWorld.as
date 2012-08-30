package
{
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	
	public class MenuWorld extends World
	{
		[Embed(source = "../data/levels/level1.oel", mimeType="application/octet-stream")]
		private const LEVEL1_DATA:Class;
		public function MenuWorld()
		{
			super();
		}
		
		override public function begin():void
		{
			var level1:Level = Level(add(new Level(LEVEL1_DATA)));
			var DataList:XMLList;
			var DataElement:XML;
			
			DataList = level1.LevelData.objects.playerStart;
			for each(DataElement in DataList)
				add(new Player(DataElement.@x, DataElement.@y));
			
			var light:Sprite = new Sprite;
			light.graphics.clear();
			light.graphics.beginFill(0xffffff, 100);
			light.graphics.moveTo(10, 10);
			for (var i:int=0; i<=60; i+=(60/20)) {
				var ray_angle:Number = to_radians((to_degrees(0)-90-(60/2)+i));
				for (var j:int=1; j<=20; j++) {
					if (level1.collidePoint(10+(60/20*j)*Math.cos(ray_angle), 10+(60/20*j)*Math.sin(ray_angle),
						10+(60/20*j)*Math.cos(ray_angle), 10+(60/20*j)*Math.sin(ray_angle))) {
						break;
					}
				}
				light.graphics.lineTo(10+(60/20*j)*Math.cos(ray_angle), 10+(60/20*j)*Math.sin(ray_angle));
			}
			light.graphics.lineTo(10, 10);
			light.graphics.endFill();
			var bitmapData:BitmapData = new BitmapData(light.width, light.height, true, 0x00FFFFFF);
			bitmapData.draw(light);
			var lighting:Entity = new Entity(0, 0);
			lighting.graphic.render(bitmapData, new Point, new Point);
			add(lighting);
		}
		
		public function to_radians(n:Number):Number {
			return (n*0.0174532925);
		}
		public function to_degrees(n:Number):Number {
			return (n*57.2957795);
		}
	}
}