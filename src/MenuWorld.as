package
{
	import net.flashpunk.World;
	
	public class MenuWorld extends World
	{
		public function MenuWorld()
		{
			super();
		}
		
		override public function begin():void
		{
			add(new Level);
		}
	}
}