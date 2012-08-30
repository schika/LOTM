package
{
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Player extends Entity
	{
		public var _v:Point = new Point;
		public function Player(x:Number=0, y:Number=0)
		{
			super(x, y);
			graphic = Image.createRect(8, 8, 0xff0000);
			setHitbox(8, 8);
		}
		
		override public function update():void
		{
			updateMovement();
			updateCollisions();
			FP.world.camera.x = Math.max(x - 320 / 3, 0);
			FP.world.camera.y = Math.max(y - 240 / 3, 0);
			super.update();
		}
		
		public function updateMovement():void
		{
			var movement:Point = new Point;
			if(Input.check(Key.A)) movement.x--;
			if(Input.check(Key.D)) movement.x++;
			if(Input.check(Key.W)) movement.y--;
			if(Input.check(Key.S)) movement.y++;
			
			_v.x = 100 * FP.elapsed * movement.x;
			_v.y = 100 * FP.elapsed * movement.y;
		}
		
		public function updateCollisions():void
		{
			x += _v.x;
			y += _v.y;
			
			if (collide("level", x, y))
			{
				x -= _v.x;
				y -= _v.y;
			}
		}
	}
}