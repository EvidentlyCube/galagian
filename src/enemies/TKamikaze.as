package enemies {
	import other.*;
	import Functions.*;

	import core.Galagian;
	import core.Hud;
	import core.Sfx;

	import particles.TExplosion;

	
	public class TKamikaze extends TObject {
		[Embed("../../src.assets/gfx/enemies/kamikaze.png")]
		private var g_ship:Class;
		public var flyto:uint;
		public var movex:Number = 0;
		public var fall:Number = 0;
		public var spd:Number;

		public function TKamikaze(_x:Number, _y:Number) {
			x = _x;
			y = _y;
			wid = 17;
			hei = 19;
			flyto = 20 + Math.random() * 180;
			gfx = getBitmap(g_ship);
			Galagian.layerFore.addChild(gfx);
			hp = 5 * Galagian.diffHp;
			spd = 1 + Math.random() * 2;
			updategfx(-4, -2)
		}

		public function Update(myID:uint):void {
			setWhiteBlink(false);
			var enx:TPlayer;
			if (fall == 0) {
				enx = Galagian.Player;
				if (enx != null) {
					movex = Math.min(spd, Math.max(-spd, movex + (Sign(enx.midx - x - 8) / 40) * Galagian.diffSpd))
				} else {
					movex *= 0.9
				}
				x += movex;
				if (Math.random() < 0.006 * Galagian.diffAtk && y > 0) {
					fall = 1
				}
				if (x > 500) {
					x = -wid
				}
				if (x < -wid) {
					x = 500
				}
				if (y < flyto) {
					y++
				}
			} else {
				movex *= 0.9;
				fall += 0.1;
				enx = Galagian.Player;
				if (enx != null) {
					if (RectRect(x, y, wid, hei + fall, enx.x, enx.y, enx.wid, enx.hei)) {
						enx.Hit();
					}
				}
				x += movex;
				y += fall;
				if (y > 500) {
					y = -50 - Math.random() * 10;
					fall = 0;
					flyto = 20 + Math.random() * 180
				}
			}
			updategfx(-4, -2);
		}

		override public function kill():void {
			Sfx.sound("xp2");
			Hud.instance.addPnt(6);
			TCrystal.give(x + 6, y + 8, 1);
			new TExplosion(x - 13, y - 10, 1, 0.2);
			Galagian.layerFore.removeChild(gfx)
		}
	}

}