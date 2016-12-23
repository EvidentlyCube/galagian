package enemies {
	import bullets.TEBullet4;

	import other.*;
	import Functions.*;

	import core.Galagian;
	import core.Hud;
	import core.List;
	import core.Sfx;

	import particles.TExplosion;

	
	public class TFlamer extends TObject {
		[Embed("../../src.assets/gfx/enemies/flamer.png")]
		private var g_ship:Class;
		public var tox:uint;
		public var toy:uint;
		public var hook:uint = 0;
		public var dir:Number = 0;

		public function TFlamer(_x:Number, _y:Number) {
			x = _x;
			y = _y;
			wid = 29;
			hei = 29;
			tox = 50 + Math.random() * 400;
			toy = 250 + Math.random() * 100;
			gfx = getBitmap(g_ship);
			Galagian.layerFore.addChild(gfx);
			hp = 25 * Galagian.diffHp;
			updategfx(-3, -3)
		}

		public function Update(myID:uint):void {
			setWhiteBlink(false);
			if (hook == 0) {
				x += (tox - x) / 30;
				y += (toy - y) / 30;
				if (Distance2(x, y, tox, toy) < 400) {
					hook = 60 * Galagian.diffAtk;
					var enx:TPlayer = Galagian.Player;
					if (enx != null) {
						dir = Math.atan2(enx.y - y, enx.x - x)
					}
				}
			} else {
				if (hook % 8 == 0) {
					List.BulletAdd(new TEBullet4(x + 14, y + 15, 2 * Galagian.diffSpd, dir))
				}
				hook--;
				if (hook == 0) {
					tox = 50 + Math.random() * 400;
					toy = 250 + Math.random() * 100
				}
			}
			updategfx(-3, -3);
		}

		override public function kill():void {
			Sfx.sound("xp2");
			Hud.instance.addPnt(120);
			TCrystal.give(x + 12, y + 12, 3);
			new TExplosion(x - 25, y - 25, 1, 0.3);
			Galagian.layerFore.removeChild(gfx)
		}
	}

}