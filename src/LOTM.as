package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	public class LOTM extends Engine
	{
		public function LOTM()
		{
			super(640, 480, 60, false);
			FP.screen.scale = 2;
			FP.world = new MenuWorld;
		}
	}
}