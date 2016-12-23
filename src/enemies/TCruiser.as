package enemies {
	import bullets.TEBullet5;

	import other.*;
	import Functions.*;

	import core.Galagian;
	import core.Hud;
	import core.List;
	import core.Sfx;

	import particles.TExplosion;

	public class TCruiser extends TObject {
		[Embed("../../src.assets/gfx/enemies/cruiser.png")]
		private var g_ship:Class;
		public var movex:Number = 0;
		public var movey:Number = 0;
		public var tox:Number = 0;
		public var toy:Number = 0;

		public function TCruiser(_x:Number, _y:Number) {
			x = _x;
			y = _y;
			wid = 29;
			hei = 31;
			gfx = getBitmap(g_ship);
			Galagian.layerFore.addChild(gfx);
			hp = 16 * Galagian.diffHp;
			updategfx(-3, -2);
			tox = 50 + Math.random() * 400;
			toy = 50 + Math.random() * 150
		}

		public function Update(myID:uint):void {
			setWhiteBlink(false);
			movex = Math.min(3, Math.max(-3, movex + (Sign(tox - x) / 10)) * Galagian.diffSpd);
			movey = Math.min(3, Math.max(-3, movey + (Sign(toy - y) / 10)));
			x += movex;
			y += movey;
			if (Math.random() < 0.005) {
				tox = 50 + Math.random() * 400;
				toy = 50 + Math.random() * 150
			}
			if (Math.random() < 0.014 * Galagian.diffAtk) {
				List.BulletAdd(new TEBullet5(x + 11, y + 5, 5))
			}
			if (x > 500) {
				x = -wid
			}
			if (x < -wid) {
				x = 500
			}
			updategfx(-3, -2);
		}

		override public function kill():void {
			Sfx.sound("xp2");
			Hud.instance.addPnt(40);
			new TExplosion(x - 25, y - 25, 1, 0.3);
			TCrystal.give(x + 6, y + 8, 2);
			Galagian.layerFore.removeChild(gfx)
		}
	}

}