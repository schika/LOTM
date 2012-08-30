package
{
	import flash.geom.Point;
	import flash.utils.ByteArray;
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	
	public class DecoLevel extends Entity
	{
		public var _tiles:Tilemap;
		public var LevelData:XML;
		
		public function DecoLevel(xml:Class)
		{
			_tiles = new Tilemap(Assets.DECO_PACK, 640, 480, 8, 8);
			graphic = _tiles;
			layer = 1;
			
			type = "decolevel";
			
			loadLevel(xml);
		}
		
		public function loadLevel(xml:Class):void
		{
			var rawData:ByteArray = new xml;
			var dataString:String = rawData.readUTFBytes(rawData.length);
			LevelData = new XML(dataString);
			
			var dataList:XMLList;
			var dataElement:XML;
			
			dataList = LevelData.decorations.tile;
			for each(dataElement in dataList)
			{
				_tiles.setTile(int(dataElement.@x)/8, 
					int(dataElement.@y)/8, 
					int(dataElement.@ty)/8 * 32 + int(dataElement.@tx)/8);
			}
		}
	}
}