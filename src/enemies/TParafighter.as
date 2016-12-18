package enemies {
	import bullets.TEBullet5;

	import other.*;
	import core.Galagian;
	import core.Hud;
	import core.List;
	import core.Sfx;

	import particles.TExplosion;

	
	public class TParafighter extends TObject {
		[Embed("../../src.assets/gfx/enemies/parafighter.png")]
		private var g_ship:Class;
		public var movex:Number = 0;
		public var movey:Number = 0;

		public function TParafighter(_x:Number, _y:Number) {
			x = _x;
			y = _y;
			wid = 26;
			hei = 26;
			gfx = getBitmap(g_ship);
			Galagian.layerFore.addChild(gfx);
			hp = 19 * Galagian.diffHp;
			movex = (Math.random() * 6 - 2) * Galagian.diffSpd;
			movey = (Math.random() * 4 + 0.5) * Galagian.diffSpd;
			updategfx(-1)
		}

		public function Update(myID:uint):void {
			gfx.blendMode = "normal";
			x += movex;
			y += movey;
			if (Math.random() < 0.002) {
				movex *= -1
			}
			if (Math.random() < 0.014 * Galagian.diffAtk) {
				List.BulletAdd(new TEBullet5(x + 10, y, 8))
			}
			if (x > 500) {
				x = -wid
			}
			if (x < -wid) {
				x = 500
			}
			if (y > 500) {
				y = -hei
			}
			updategfx(-1);
		}

		override public function kill():void {
			Sfx.sound("xp2");
			Hud.instance.addPnt(45);
			TCrystal.give(x + 10, y + 10, 2);
			new TExplosion(x - 25, y - 25, 1, 0.3);
			Galagian.layerFore.removeChild(gfx)
		}
	}

}