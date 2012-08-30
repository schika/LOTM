package
{
	import flash.utils.ByteArray;
	
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	
	public class Level extends Entity
	{
		public var _tiles:Tilemap;
		public var _grid:Grid;
		public var LevelData:XML;
		
		public function Level(xml:Class)
		{
			_tiles = new Tilemap(Assets.JUNGLE_PACK, 640, 480, 8, 8);
			graphic = _tiles;
			layer = 1;
			
			_grid = new Grid(640, 480, 8, 8, 0, 0);
			mask = _grid;
			
			type = "level";
			
			loadLevel(xml);
		}
		
		public function loadLevel(xml:Class):void
		{
			var rawData:ByteArray = new xml;
			var dataString:String = rawData.readUTFBytes(rawData.length);
			LevelData = new XML(dataString);
			
			var dataList:XMLList;
			var dataElement:XML;
			
			dataList = LevelData.map.tile;
			for each(dataElement in dataList)
			{
				_tiles.setTile(int(dataElement.@x)/8, 
					int(dataElement.@y)/8, 
					int(dataElement.@ty)/8 * 8 + int(dataElement.@tx)/8);
				_grid.setTile(int(dataElement.@x)/8, 
					int(dataElement.@y)/8,
					true);
			}
			
			dataList = LevelData.map.rect;
			for each(dataElement in dataList)
			{
				_tiles.setRect(int(dataElement.@x)/8, 
					int(dataElement.@y)/8,
					int(dataElement.@w)/8,
					int(dataElement.@h)/8,
					int(dataElement.@ty)/8 * 8 + int(dataElement.@tx)/8);
				_grid.setRect(int(dataElement.@x)/8, 
					int(dataElement.@y)/8,
					int(dataElement.@w)/8,
					int(dataElement.@h)/8,
					true);
			}
			
		}
	}
}