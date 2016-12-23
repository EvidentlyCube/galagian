package enemies {
	import bullets.TEBullet5;

	import other.*;
	import core.Galagian;
	import core.Hud;
	import core.List;
	import core.Sfx;

	import particles.TExplosion;

	
	public class TCoreKid extends TObject {
		[Embed("../../src.assets/gfx/enemies/core-bit.png")]
		private var g_ship:Class;
		public var angle:Number;
		public var master:TCore;

		public function TCoreKid(_ang:Number, _mas:TCore) {
			master = _mas;
			angle = _ang;
			wid = 24;
			hei = 24;
			gfx = getBitmap(g_ship);
			Galagian.layerFore.addChild(gfx);
			hp = 20 * Galagian.diffHp;
			updategfx(-3, -3)
		}

		public function Update(myID:uint):void {
			setWhiteBlink(false);
			if (master.spd == 0) {
				kill();
				List.EnemyRem(myID)
			}
			angle += master.spd;
			var rang:Number = angle * Math.PI / 180;
			x = master.midx + Math.cos(rang) * 80 - 10;
			y = master.midy + Math.sin(rang) * 80 - 10;
			if (Math.random() < 0.01 * Galagian.diffAtk) {
				List.BulletAdd(new TEBullet5(x + 8, y, 7))
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
			updategfx(-3, -3);
		}

		override public function kill():void {
			Sfx.sound("xp2");
			Hud.instance.addPnt(50);
			TCrystal.give(x + 8, y + 8, 4);
			new TExplosion(x - 15, y - 15, 1, 0.22);
			Galagian.layerFore.removeChild(gfx)
		}
	}

}