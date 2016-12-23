package enemies {
	import other.*;
	import Functions.*;

	import core.Galagian;
	import core.Hud;
	import core.Sfx;

	import particles.TExplosion;

	
	public class TShieldShip extends TObject {
		[Embed("../../src.assets/gfx/enemies/shieldship.png")]
		private var g_ship:Class;
		public var movex:Number = 0;

		public function TShieldShip(_x:Number, _y:Number) {
			x = _x;
			y = _y;
			wid = 114;
			hei = 89;
			gfx = getBitmap(g_ship);
			Galagian.layerFore.addChild(gfx);
			hp = 100 * Galagian.diffHp;
			updategfx(-3, -3)
		}

		public function Update(myID:uint):void {
			setWhiteBlink(false);
			x += movex;
			if (y < 280) {
				y += Galagian.diffSpd * Galagian.diffAtk
			}
			var enx:TPlayer = Galagian.Player;
			if (enx != null) {
				if (RectRect(x, y, wid, hei, enx.x, enx.y, enx.wid, enx.hei)) {
					enx.Hit();
				}
			}
			updategfx(-3, -3);
		}

		override public function kill():void {
			Sfx.sound("xp2");
			Hud.instance.addPnt(30);
			new TExplosion(x - 60, y - 50, 1, 0.8);
			TCrystal.give(x + 55, y + 40, 2);
			Galagian.layerFore.removeChild(gfx)
		}
	}

}