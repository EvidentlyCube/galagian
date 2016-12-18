package enemies {
	import bullets.TEBullet2;

	import flash.display.Bitmap;

	import other.*;
	import Functions.*;

	import core.Galagian;
	import core.Hud;
	import core.List;
	import core.Sfx;

	import flash.display.Sprite;

	

	import particles.TExplosion;

	
	public class TCannon extends TObject {
		[Embed("../../src.assets/gfx/enemies/cannon-body.png")]
		private var g_ship:Class;
		[Embed("../../src.assets/gfx/enemies/cannon-barrel.png")]
		private var g_ship2:Class;
		public var tox:uint;
		public var toy:uint;
		public var hook:Boolean = false;
		public var movex:Number = 0;
		public var tur:Sprite = new Sprite;

		public function TCannon(_x:Number, _y:Number) {
			x = _x;
			y = _y;
			wid = 21;
			hei = 21;
			tox = 50 + Math.random() * 400;
			toy = 50 + Math.random() * 150;
			var bit:Bitmap = getBitmap(g_ship2);
			tur.addChild(bit);
			bit.x = -4.5;
			bit.y = -4.5;
			tur.x = 13;
			tur.y = 13;
			bit = getBitmap(g_ship);
			gfx.addChild(bit);

			gfx.addChild(tur);
			Galagian.layerFore.addChild(gfx);
			hp = 15 * Galagian.diffHp;
			updategfx(-2, -2)
		}

		public function Update(myID:uint):void {
			gfx.blendMode = "normal";
			if (!hook) {
				x += (tox - x) / 15;
				y += (toy - y) / 15;
				if (Distance2(x, y, tox, toy) < 1) {
					hook = true
				}
			} else {
				x = tox + Math.sin(movex) * 10;
				movex += 0.0785
			}
			var enx:TPlayer = Galagian.Player;
			if (enx != null) {
				var dir:Number = Math.atan2(enx.midy - y - 10, enx.midx - x - 10);
				tur.rotation = (dir * 180) / Math.PI;
				if (Math.random() < 0.011 * Galagian.diffAtk) {
					List.BulletAdd(new TEBullet2(x + 10 + Math.cos(dir) * 17, y + 10 + Math.sin(dir) * 17, 4))
				}
			}
			if (x > 500) {
				x = -wid
			}
			if (x < -wid) {
				x = 500
			}
			updategfx(-2, -2);
		}

		override public function kill():void {
			Sfx.sound("xp2");
			Hud.instance.addPnt(35);
			TCrystal.give(x + 6, y + 8, 2);
			new TExplosion(x - 15, y - 15, 1, 0.22);
			Galagian.layerFore.removeChild(gfx)
		}
	}
}