package enemies {
	import bullets.TEBullet1;

	import other.*;
	import core.Galagian;
	import core.Hud;
	import core.List;
	import core.Sfx;

	import particles.TExplosion;

	
	public class TBoarder extends TObject {
		[Embed("../../src.assets/gfx/enemies/boarder.png")]
		private var g_ship:Class;
		public var movex:Number = 0;
		public var movey:Number = 0;

		public function TBoarder(_x:Number, _y:Number) {
			x = _x;
			y = _y;
			wid = 23;
			hei = 18;
			gfx = getBitmap(g_ship);
			Galagian.layerFore.addChild(gfx);
			hp = 6 * Galagian.diffHp;
			movex = (Math.random() * 4 - 2) * Galagian.diffSpd;
			movey = (Math.random() * 2 + 0.5) * Galagian.diffSpd;
			updategfx(-1, -1)
		}

		public function Update(myID:uint):void {
			setWhiteBlink(false);
			x += movex;
			y += movey;
			if (Math.random() < 0.009 * Galagian.diffAtk) {
				List.BulletAdd(new TEBullet1(x + 7, y + 18, 4))
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
			updategfx(-1, -1);
		}

		override public function kill():void {
			Sfx.sound("xp2");
			Hud.instance.addPnt(8);
			TCrystal.give(x + 6, y + 6, 2);
			new TExplosion(x - 13, y - 10, 1, 0.2);
			Galagian.layerFore.removeChild(gfx)
		}
	}

}