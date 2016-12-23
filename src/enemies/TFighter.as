package enemies {
	import bullets.TEBullet1;

	import other.*;
	import Functions.*;

	import core.Galagian;
	import core.Hud;
	import core.List;
	import core.Sfx;

	import particles.TExplosion;

	
	public class TFighter extends TObject {
		[Embed("../../src.assets/gfx/enemies/fighter.png")]
		private var g_ship:Class;
		public var flyto:uint;
		public var movex:Number = 0;
		public var spd:Number;

		public function TFighter(_x:Number, _y:Number) {
			x = _x;
			y = _y;
			wid = 25;
			hei = 18;
			flyto = Math.random() * 300;
			gfx = getBitmap(g_ship);
			Galagian.layerFore.addChild(gfx);
			hp = 5 * Galagian.diffHp;
			spd = 1 + Math.random() * 4;
			updategfx()
		}

		public function Update(myID:uint):void {
			setWhiteBlink(false);
			var enx:TPlayer = Galagian.Player;
			if (enx != null) {
				movex = Math.min(spd, Math.max(-spd, movex + (Sign(enx.midx - x - 12.5) / 20) * Galagian.diffSpd))
			} else {
				movex *= 0.9
			}
			x += movex;
			if (Math.random() < 0.008 * Galagian.diffAtk) {
				List.BulletAdd(new TEBullet1(x + (Math.random() < 0.5 ? 2 : 21), y + 15, 4))
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
			updategfx();
		}

		override public function kill():void {
			Sfx.sound("xp2");
			Hud.instance.addPnt(5);
			TCrystal.give(x + 6, y + 5, 1);
			new TExplosion(x - 8, y - 8, 1, 0.18);
			Galagian.layerFore.removeChild(gfx)
		}
	}

}