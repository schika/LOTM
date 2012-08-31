package
{
	
	import net.flashpunk.utils.Preloader;
	
	public class Preload extends Preloader
	{
		public function Preload()
		{
			mainClass = LOTM;
			minTime = 60;
			super();
		}
		
		public function onConnectError(status:*):void
		{
			trace(status);
		}
	}
}