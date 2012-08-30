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
			var decolevel1:DecoLevel = DecoLevel(add(new DecoLevel(LEVEL1_DATA)));
			var DataList:XMLList;
			var DataElement:XML;
			
			DataList = level1.LevelData.objects.lader;
			for each(DataElement in DataList)
				add(new Lader(DataElement.@x, DataElement.@y));
			
			DataList = level1.LevelData.objects.playerStart;
			for each(DataElement in DataList)
				add(new Player(DataElement.@x, DataElement.@y));
		}
	}
}