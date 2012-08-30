package {
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Player extends Entity {
		private var power:Number = 0.2; //скорость
		private var jumpPower:Number = 3; //сила прыжка
		private var hFriction:Number = 0.95; //трение по горизонтали
		private var vFriction:Number = 0.99; //трение по вертикали
		private var xSpeed:Number = 0; //текушая скорость по горизонтали
		private var ySpeed:Number = 0; //текущая скорость по вертикали
		private var gravity:Number = 0.2; //сила гравитации
		[Embed(source='../data/player.png')] //добавляем изображение игрока
		private const PLAYER:Class;
		
		public function Player(X:Number = 0, Y:Number = 0){
			graphic = new Image(PLAYER); //экземпляр класса ThePlayer графически будет выглядеть как картинка player.png
			setHitbox(8, 16); //определяем хитбокс, нужен для определения столкновений объектов.
			x = X;
			y = Y;
		}
		
		override public function update():void { //переопределяем функцию update(), вызывается каждый кадр
			var pressed:Boolean = false; //с помощью этой переменной будем узнавать когда нужные нам клавиши нажаты (сейчас false -не нажаты)
			if (Input.check(Key.A)){ //если нажата клавиша "стрелка влево"
				xSpeed = -power; //уменьшаем текущую скорость по х
				pressed = true; //true - нажата
			}
			if (Input.check(Key.D)){ //если нажата клавиша "стрелка вправо"
				xSpeed = power; //увеличиваем текущую скорость по х
				pressed = true; //true - нажата
			}
			if (collide("lader", x, y)) {
				ySpeed = 0;
				if(Input.check(Key.W) && !collide("level", x, y - 1)){
					y -= 0.5;
				} else if(Input.check(Key.S) && !collide("level", x, y + 1)){
					y += 0.5;
				}
			} else if (collide("level", x, y + 1)){ //если произошло столкновение с любым из объектов группы"wall"
				ySpeed = 0; //обнуляем вертикальную скорость
				if (Input.check(Key.W)){ //если нажата клавиша "стрелка вверх"
					ySpeed -= jumpPower; //уменьшаем вертикальную скорость(прыжок вверх)
				}
			} else {
				ySpeed += gravity; //иначе увеличиваем вертикальную скорость(прыжок вниз)
			}
			if (Math.abs(xSpeed) < 1 && !pressed){ //если горизонтальная скорость очень маленькая 
				xSpeed = 0; //обнуляем ее
			}
			xSpeed *= hFriction; //уменьшаем горизонтальную скорость из-за силы трения
			ySpeed *= vFriction; //уменьшаем вертикальную скорость из-за силы трения
			adjustXPosition(); //функции проверяющие столкновения по осям x и y
			adjustYPosition();
		}
		
		private function adjustXPosition():void {
			for (var i:int=0; i<Math.abs(xSpeed); i++) { //перебираем все значение от 0 до текущей скорости по оси x
				if (! collide("level",x+FP.sign(xSpeed),y)) { //Если перемещяя игрока на 1 пиксель (FP.sign возвращает 1 если число положительное,) 
					x+=FP.sign(xSpeed); //и -1 если отрицательное) игрок не сталкивается с стеной, то перемещаем игрока в этом направлении на 1 px
				} else { //иначе
					xSpeed=0; //не перемещаем
					break;
				}
			}
		}
		private function adjustYPosition():void {
			for (var i:int=0; i<Math.abs(ySpeed); i++) { //здесь все аналогично
				if (! collide("level",x,y+FP.sign(ySpeed))) {
					y+=FP.sign(ySpeed);
				} else {
					ySpeed=0;
					break;
				}
			}
		}
	}
}