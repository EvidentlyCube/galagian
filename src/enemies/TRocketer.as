package enemies {
	import bullets.TEBullet3;

	import other.*;
	import Functions.*;

	import core.Galagian;
	import core.Hud;
	import core.List;
	import core.Sfx;

	import particles.TExplosion;

	
	public class TRocketer extends TObject {
		[Embed("../../src.assets/gfx/enemies/rocketship.png")]
		private var g_ship:Class;
		public var movex:Number = 0;

		public function TRocketer(_x:Number, _y:Number) {
			x = _x;
			y = _y;
			wid = 82;
			hei = 26;
			gfx = getBitmap(g_ship);
			Galagian.layerFore.addChild(gfx);
			hp = 30 * Galagian.diffHp;
			updategfx(0, -22)
		}

		public function Update(myID:uint):void {
			gfx.blendMode = "normal";
			var enx:TPlayer = Galagian.Player;
			if (enx != null) {
				movex = Math.min(1, Math.max(-1, movex - (Sign(enx.midx - x - 40) / 300) * Galagian.diffSpd))
			}
			x += movex;
			if (Math.random() < 0.012 * Galagian.diffAtk) {
				List.BulletAdd(new TEBullet3(x + (Math.random() < 0.5 ? 31 : 51), y + 40, 2))
			}
			if (x > 500) {
				x = -wid
			}
			if (x < -wid) {
				x = 500
			}
			if (y < 30) {
				y++
			}
			updategfx(0, -22)
		}

		override public function kill():void {
			Sfx.sound("xp2");
			Hud.instance.addPnt(90);
			TCrystal.give(x + 35, y + 12, 4);
			new TExplosion(x - 50, y - 50, 1, 0.65);
			Galagian.layerFore.removeChild(gfx)
		}
	}

}