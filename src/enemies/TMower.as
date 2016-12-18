package enemies {
	import flash.display.Bitmap;

	import other.*;
	import Functions.*;

	import core.Galagian;
	import core.Hud;
	import core.Sfx;

	

	import particles.TExplosion;

	
	public class TMower extends TObject {
		[Embed("../../src.assets/gfx/enemies/mower0.png")]
		private var g_ship:Class;
		public var movex:Number = 0;
		public var movey:Number = 0;
		public var mode:uint = 0;
		public var spd:uint;
		public var hi:uint;
		public var lo:uint;

		public function TMower(_x:Number, _y:Number) {
			x = _x;
			y = _y;
			wid = 39;
			hei = 39;
			var bitm:Bitmap = getBitmap(g_ship);
			bitm.x = -22.5;
			bitm.y = -22.5;
			gfx.addChild(bitm);
			Galagian.layerFore.addChild(gfx);
			hp = 25 * Galagian.diffHp;
			spd = 2 + Math.random() * 4;
			hi = 50 - Math.random() * 20;
			lo = 370 - Math.random() * 30;
			movex = 0;
			movey = 0;
			updategfx(19.5, 19.5)
		}

		public function Update(myID:uint):void {
			gfx.blendMode = "normal";
			gfx.rotation -= 10 + y / 40;
			var enx:TPlayer = Galagian.Player;
			if (enx != null) {
				movex = Math.min(spd, Math.max(-spd, movex + (Sign(enx.midx - x - 20) / 25) * Galagian.diffSpd));
				switch (mode) {
					case (0):
						movey += 0.2 + Math.random() / 10;
						if (movey > 10) {
							movey = 10
						}
						if (y > lo) {
							mode = 1
						}
						break;
					case (1):
						movey -= 0.5;
						if (movey < -4) {
							movey = -4
						}
						if (y < hi) {
							mode = 0
						}
				}
				if (RectRect(x, y, wid, hei, enx.x, enx.y, enx.wid, enx.hei)) {
					enx.Hit()
				}
			} else {
				if (y > 500) {
					y = -hei
				}
				movex *= 0.9
			}
			x += movex;
			y += movey;
			if (x > 500) {
				x = -wid
			}
			if (x < -wid) {
				x = 500
			}
			if (y > 500) {
				y = -hei
			}
			updategfx(19.5, 19.5)
		}

		override public function kill():void {
			Sfx.sound("xp2");
			Hud.instance.addPnt(140);
			TCrystal.give(x + 15, y + 15, 5);
			Galagian.layerFore.removeChild(gfx);
			new TExplosion(x - 40, y - 30, 1, 0.5)
		}
	}

}