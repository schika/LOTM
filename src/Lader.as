package
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.graphics.Image;
	
	public class Lader extends Entity
	{
		[Embed(source = "../data/lader.png")]
		private const img:Class;
		public function Lader(x:Number=0, y:Number=0)
		{
			super(x, y);
			this.graphic = new Image(img);
			setHitbox(16, 8);
			type = "lader";
		}
	}
}