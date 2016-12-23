package enemies {
	import bullets.TEBullet6;
	import bullets.TEBullet7;

	import other.*;
	import core.Galagian;
	import core.Hud;
	import core.List;
	import core.Sfx;

	import particles.TExplosion;

	
	public class TCore extends TObject {
		[Embed("../../src.assets/gfx/enemies/core.png")]
		private var g_ship:Class;
		public var movex:int;
		public var spd:Number;
		public var midx:uint;
		public var midy:uint;

		public function TCore(_x:Number, _y:Number) {
			List.EnemyAdd(new TCoreKid(0, this));
			List.EnemyAdd(new TCoreKid(90, this));
			List.EnemyAdd(new TCoreKid(180, this));
			List.EnemyAdd(new TCoreKid(270, this));
			x = _x;
			y = _y;
			midx = x + wid / 2;
			midy = y + hei / 2;
			wid = 103;
			hei = 93;
			gfx = getBitmap(g_ship);
			Galagian.layerFore.addChild(gfx);
			hp = 100 * Galagian.diffHp;
			movex = Math.random() > 0.5 ? 1 : -1;
			spd = (0.3 + Math.random() * 10) * (Math.random() > 0.5 ? 1 : -1);
			updategfx(-3, -7)
		}

		public function Update(myID:uint):void {
			setWhiteBlink(false);
			midx = x + wid / 2;
			midy = y + hei / 2;
			if (x < 80) {
				movex = 1
			} else if (x > 320) {
				movex = -1
			}
			x += movex * 0.1;
			if (Math.random() < 0.04 * Galagian.diffAtk) {
				List.BulletAdd(new TEBullet6(x + 50, y + 50, 8))
			}
			if (Math.random() < 0.005 * Galagian.diffAtk) {
				List.BulletAdd(new TEBullet7(x + 50, y + 50, 4))
			}
			if (x > 500) {
				x = -wid
			}
			if (x < -wid) {
				x = 500
			}
			if (y < 30) {
				y += 0.2
			}
			updategfx(-3, -7);
		}

		override public function kill():void {
			Sfx.sound("xp3");
			TCrystal.give(x + 50, y + 45, 20);
			Hud.instance.addPnt(500);
			new Flasher();
			Galagian.layerFore.removeChild(gfx);
			new TExplosion(x - 70, y - 70, 2, 1);
			spd = 0
		}
	}

}