package enemies {
	import flash.display.Bitmap;

	import other.*;
	import Functions.*;

	import core.Galagian;
	import core.Hud;
	import core.List;
	import core.Weapon;
	import core.Sfx;

	

	import particles.TExplosion;

	
	public class TAsteroid extends TObject {
		[Embed("../../src.assets/gfx/enemies/asteroid.png")]
		private var g_ship:Class;
		public var movex:Number;
		public var movey:Number;
		public var rotspd:Number;
		public static var howMany:uint = 0;

		public function TAsteroid() {
			howMany++;
			x = 50 + Math.random() * 400;
			y = -100;
			wid = 42;
			hei = 42;

			movex = Math.random() / 10 - 0.05;
			movey = 1 + Math.random() * 3;
			rotspd = Math.random() * 40 - 20;

			var gix:Bitmap = getBitmap(g_ship);
			gix.x = -25;
			gix.y = -25;
			gfx.addChild(gix);
			Galagian.layerFore.addChild(gfx);

			hp = 7 * (Weapon.instance.weaplev + 1);
			updategfx(21, 21)
		}

		public function Update(myID:uint):void {
			setWhiteBlink(false);
			x += movex;
			y += movey;
			gfx.rotation += rotspd;
			var enx:TPlayer = Galagian.Player;
			if (enx != null) {
				if (RectRect(x, y, wid, hei, enx.x, enx.y, enx.wid, enx.hei)) {
					enx.Hit();
				}
			}
			if (y > 600) {
				kill();
				List.EnemyRem(myID)
			}
			updategfx(21, 21);
		}

		override public function kill():void {
			howMany--;
			Sfx.sound("xp2");
			Hud.instance.addPnt(15);
			TCrystal.give(x + 18, y + 18, 20);
			new TExplosion(x - 60, y - 50, 1, 0.5);
			Galagian.layerFore.removeChild(gfx)
		}
	}

}