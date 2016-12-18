package core {
	import bullets.TPBullet1;
	import bullets.TPBullet2;
	import bullets.TPBullet3;
	import bullets.TPBullet4;

	import core.preloader.IWeapon;

	import other.TPlayer;

	public class Weapon implements IWeapon{
		private static var _instance:Weapon = new Weapon();

		public static function get instance():Weapon{
			return _instance;
		}
		
		public var weaplev:uint;
		public var autofire:uint = 0;
		public var autofire2:uint = 0;
		public var isDown:Boolean = false;
		public var p:TPlayer;

		public function Weapon() {
			weaplev = 0
		}

		public function mouseDownHandler(e:*):void {
			isDown = true
		}

		public function mouseUpHandler(e:*):void {
			autofire = 0;
			isDown = false
		}

		public function update():void {
			if (weaplev > 13) {
				weaplev = 13
			}
			p = Galagian.Player;
			autofire -= autofire == 0 ? 0 : 1;
			autofire2 -= autofire2 == 0 ? 0 : 1;
			if (p == null || !isDown) {
				return;
			}

			Fire()
		}

		public function Fire():void {
			switch (weaplev) {
				case(0):
					if (autofire == 0) {
						Sfx.sound("sh1");
						List.BulletAdd(new TPBullet1(p.x + 9, p.y, 10));
						autofire = 8
					}
					break;
				case(1):
					if (autofire == 0) {
						Sfx.sound("sh1");
						List.BulletAdd(new TPBullet1(p.x + 6, p.y, 10));
						List.BulletAdd(new TPBullet1(p.x + 14, p.y, 10));
						autofire = 8
					}
					break;
				case(2):
					if (autofire == 0) {
						Sfx.sound("sh1");
						List.BulletAdd(new TPBullet2(p.x + 6, p.y + 8, 10, -100));
						List.BulletAdd(new TPBullet1(p.x + 9, p.y, 10));
						List.BulletAdd(new TPBullet2(p.x + 14, p.y + 8, 10, -80));
						autofire = 8
					}
					break;
				case(3):
					if (autofire == 0) {
						Sfx.sound("sh1");
						List.BulletAdd(new TPBullet1(p.x - 8, p.y + 2, 10));
						List.BulletAdd(new TPBullet1(p.x + 2, p.y, 10));
						List.BulletAdd(new TPBullet1(p.x + 12, p.y, 10));
						List.BulletAdd(new TPBullet1(p.x + 22, p.y + 2, 10));
						autofire = 8
					}
					break;
				case(4):
					if (autofire == 0) {
						Sfx.sound("sh1");
						List.BulletAdd(new TPBullet1(p.x - 8, p.y + 2, 10));
						List.BulletAdd(new TPBullet1(p.x + 2, p.y, 10));
						List.BulletAdd(new TPBullet1(p.x + 12, p.y, 10));
						List.BulletAdd(new TPBullet1(p.x + 22, p.y + 2, 10));
						autofire = 8
					}
					if (autofire2 == 0) {
						Sfx.sound("sh2");
						List.BulletAdd(new TPBullet3(p.x + 9, p.y));
						autofire2 = 18
					}
					break;
				case(5):
					if (autofire == 0) {
						Sfx.sound("sh1");
						List.BulletAdd(new TPBullet1(p.x - 8, p.y + 2, 10));
						List.BulletAdd(new TPBullet1(p.x + 2, p.y, 10));
						List.BulletAdd(new TPBullet1(p.x + 12, p.y, 10));
						List.BulletAdd(new TPBullet1(p.x + 22, p.y + 2, 10));
						autofire = 8
					}
					if (autofire2 == 0) {
						Sfx.sound("sh2");
						List.BulletAdd(new TPBullet3(p.x + 2, p.y + 8));
						List.BulletAdd(new TPBullet3(p.x + 16, p.y + 8));
						autofire2 = 18
					}
					break;
				case(6):
					if (autofire == 0) {
						Sfx.sound("sh1");
						List.BulletAdd(new TPBullet2(p.x + 6, p.y + 8, 10, -110));
						List.BulletAdd(new TPBullet2(p.x + 6, p.y + 6, 10, -100));
						List.BulletAdd(new TPBullet1(p.x + 9, p.y, 10));
						List.BulletAdd(new TPBullet2(p.x + 14, p.y + 6, 10, -80));
						List.BulletAdd(new TPBullet2(p.x + 14, p.y + 8, 10, -70));
						autofire = 8
					}
					if (autofire2 == 0) {
						Sfx.sound("sh2");
						List.BulletAdd(new TPBullet3(p.x + 2, p.y + 8));
						List.BulletAdd(new TPBullet3(p.x + 16, p.y + 8));
						autofire2 = 18
					}
					break;
				case(7):
					if (autofire == 0) {
						Sfx.sound("sh1");
						List.BulletAdd(new TPBullet2(p.x + 6, p.y + 8, 10, -110));
						List.BulletAdd(new TPBullet2(p.x + 6, p.y + 6, 10, -100));
						List.BulletAdd(new TPBullet1(p.x + 5, p.y, 10));
						List.BulletAdd(new TPBullet1(p.x + 13, p.y, 10));
						List.BulletAdd(new TPBullet2(p.x + 14, p.y + 6, 10, -80));
						List.BulletAdd(new TPBullet2(p.x + 14, p.y + 8, 10, -70));
						autofire = 8
					}
					if (autofire2 == 0) {
						Sfx.sound("sh2");
						List.BulletAdd(new TPBullet3(p.x + 2, p.y + 8));
						List.BulletAdd(new TPBullet3(p.x + 16, p.y + 8));
						autofire2 = 18
					}
					break;
				case(8):
					if (autofire == 0) {
						Sfx.sound("sh1");
						List.BulletAdd(new TPBullet2(p.x + 6, p.y + 8, 10, -110));
						List.BulletAdd(new TPBullet2(p.x + 6, p.y + 6, 10, -100));
						List.BulletAdd(new TPBullet1(p.x + 5, p.y, 10));
						List.BulletAdd(new TPBullet1(p.x + 13, p.y, 10));
						List.BulletAdd(new TPBullet2(p.x + 14, p.y + 6, 10, -80));
						List.BulletAdd(new TPBullet2(p.x + 14, p.y + 8, 10, -70));
						autofire = 8
					}
					if (autofire2 == 0) {
						Sfx.sound("sh2");
						List.BulletAdd(new TPBullet3(p.x + 7, p.y, 3));
						autofire2 = 18
					}
					break;
				case(9):
					if (autofire == 0) {
						Sfx.sound("sh1");
						List.BulletAdd(new TPBullet2(p.x + 6, p.y + 8, 10, -110));
						List.BulletAdd(new TPBullet2(p.x + 6, p.y + 6, 10, -100));
						List.BulletAdd(new TPBullet1(p.x + 5, p.y, 10));
						List.BulletAdd(new TPBullet1(p.x + 13, p.y, 10));
						List.BulletAdd(new TPBullet2(p.x + 14, p.y + 6, 10, -80));
						List.BulletAdd(new TPBullet2(p.x + 14, p.y + 8, 10, -70));
						autofire = 8
					}
					if (autofire2 == 0) {
						Sfx.sound("sh2");
						List.BulletAdd(new TPBullet3(p.x, p.y + 8, 3));
						List.BulletAdd(new TPBullet3(p.x + 14, p.y + 8, 3));
						autofire2 = 18
					}
					break;
				case(10):
					if (autofire == 0) {
						Sfx.sound("sh1");
						List.BulletAdd(new TPBullet2(p.x + 6, p.y + 8, 10, -110));
						List.BulletAdd(new TPBullet2(p.x + 6, p.y + 6, 10, -100));
						List.BulletAdd(new TPBullet1(p.x + 2, p.y + 2, 10));
						List.BulletAdd(new TPBullet1(p.x + 9, p.y, 10));
						List.BulletAdd(new TPBullet1(p.x + 16, p.y + 2, 10));
						List.BulletAdd(new TPBullet2(p.x + 14, p.y + 6, 10, -80));
						List.BulletAdd(new TPBullet2(p.x + 14, p.y + 8, 10, -70));
						autofire = 8
					}
					List.BulletAdd(new TPBullet4(p.x + 9, p.y));
					break;
				case(11):
					if (autofire == 0) {
						Sfx.sound("sh1");
						List.BulletAdd(new TPBullet2(p.x + 6, p.y + 8, 10, -110));
						List.BulletAdd(new TPBullet2(p.x + 6, p.y + 6, 10, -100));
						List.BulletAdd(new TPBullet1(p.x - 8, p.y + 2, 10));
						List.BulletAdd(new TPBullet1(p.x + 2, p.y, 10));
						List.BulletAdd(new TPBullet1(p.x + 12, p.y, 10));
						List.BulletAdd(new TPBullet1(p.x + 22, p.y + 2, 10));
						List.BulletAdd(new TPBullet2(p.x + 14, p.y + 6, 10, -80));
						List.BulletAdd(new TPBullet2(p.x + 14, p.y + 8, 10, -70));
						autofire = 8
					}
					List.BulletAdd(new TPBullet4(p.x + 9, p.y));
					break;
				case(12):
					if (autofire == 0) {
						Sfx.sound("sh1");
						List.BulletAdd(new TPBullet2(p.x + 6, p.y + 8, 10, -110));
						List.BulletAdd(new TPBullet2(p.x + 6, p.y + 6, 10, -105));
						List.BulletAdd(new TPBullet2(p.x + 6, p.y + 6, 10, -100));
						List.BulletAdd(new TPBullet2(p.x + 6, p.y + 6, 10, -95));
						List.BulletAdd(new TPBullet1(p.x + 9, p.y, 10));
						List.BulletAdd(new TPBullet2(p.x + 14, p.y + 6, 10, -85));
						List.BulletAdd(new TPBullet2(p.x + 14, p.y + 6, 10, -80));
						List.BulletAdd(new TPBullet2(p.x + 14, p.y + 6, 10, -75));
						List.BulletAdd(new TPBullet2(p.x + 14, p.y + 8, 10, -70));
						autofire = 8
					}
					List.BulletAdd(new TPBullet4(p.x + 9, p.y));
					break;
				case(13):
					if (autofire == 0) {
						Sfx.sound("sh1");
						List.BulletAdd(new TPBullet2(p.x + 6, p.y + 8, 10, -110));
						List.BulletAdd(new TPBullet2(p.x + 6, p.y + 6, 10, -105));
						List.BulletAdd(new TPBullet2(p.x + 6, p.y + 6, 10, -100));
						List.BulletAdd(new TPBullet2(p.x + 6, p.y + 6, 10, -95));
						List.BulletAdd(new TPBullet1(p.x + 9, p.y, 10));
						List.BulletAdd(new TPBullet2(p.x + 14, p.y + 6, 10, -85));
						List.BulletAdd(new TPBullet2(p.x + 14, p.y + 6, 10, -80));
						List.BulletAdd(new TPBullet2(p.x + 14, p.y + 6, 10, -75));
						List.BulletAdd(new TPBullet2(p.x + 14, p.y + 8, 10, -70));
						autofire = 8
					}
					if (autofire2 == 0) {
						Sfx.sound("sh2");
						List.BulletAdd(new TPBullet3(p.x + 1, p.y + 8));
						List.BulletAdd(new TPBullet3(p.x + 15, p.y + 8));
						autofire2 = 18
					}
					List.BulletAdd(new TPBullet4(p.x + 7, p.y + 8));
					List.BulletAdd(new TPBullet4(p.x + 11, p.y + 8));
					break
			}
		}
	}
}