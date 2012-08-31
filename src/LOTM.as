package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import mochi.as3.*;
	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	
	import splash.Splash;
	
	public class LOTM extends Engine
	{
		[SWF(width = '640', height = '480')]
		[Frame(factoryClass="Preload")]
		public function LOTM()
		{
			super(640, 480, 30, false);
		}
		
		override public function init():void 
		{
			var s:Splash = new Splash;
			FP.world.add(s);
			s.start(splashComplete);
		}
		
		public function splashComplete():void
		{
			FP.screen.scale = 2;
			FP.world = new MenuWorld;
			trace("Complate");
		}
		
		public function onConnectError(status:String):void 
		{
			trace("Error Connecting");
		}
		
	}
}