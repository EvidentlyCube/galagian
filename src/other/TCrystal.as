package other {
	import Functions.*;

	import core.Galagian;
	import core.Hud;
	import core.List;
	import core.Sfx;

	public class TCrystal extends TObject {
		[Embed("../../src.assets/gfx/bonus/crys0.png")]
		private var g00:Class;
		[Embed("../../src.assets/gfx/bonus/crys1.png")]
		private var g01:Class;
		public var siz:uint;
		public var spd:Number;
		public var dir:Number;
		public var dirpd:Number;

		public function TCrystal(_x:int, _y:int) {
			siz = Math.round(Math.random() * 0.8);
			x = _x;
			y = _y;
			dir = Math.random() * Math.PI * 2;
			dirpd = Math.random() * 6;
			spd = Math.random() + 0.5;
			wid = siz == 0 ? 8 : 12;
			hei = wid;
			gfx = siz == 1 ? getBitmap(g00) : getBitmap(g01);
			Galagian.layerMid.addChild(gfx);
			updategfx()
		}

		public function U(myID:uint):void {
			if (Galagian.shield) {
				var enx:TPlayer = Galagian.Player;
				if (enx != null) {
					x += Sign(enx.midx - x - 6)
				}
			}
			x += Math.cos(dir) * dirpd;
			y += spd + Math.sin(dir) * dirpd;
			dirpd *= 0.95;
			if (y > 505) {
				kill();
				List.EffectRem(myID);
				return
			}
			updategfx();
			enx = Galagian.Player;
			if (enx == null) {
				return;
			}
			if (RectRect(x, y, wid, hei, enx.x, enx.y, enx.wid, enx.hei)) {
				kill();
				List.EffectRem(myID);
				Hud.instance.addPnt(4 * (siz + 1), false);
				Sfx.sound("dmd")
			}

		}

		public static function give(x:uint, y:uint, am:uint = 1):void {
			for (var i:uint = 0; i < am; i++) {
				List.EffectAdd(new TCrystal(x, y))
			}
		}
	}
}