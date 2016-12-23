package enemies {
	import flash.display.Bitmap;

	import other.*;
	import Functions.*;

	import core.Galagian;
	import core.Hud;
	import core.Sfx;

	

	import particles.TExplosion;

	
	public class TBarrier extends TObject {
		[Embed("../../src.assets/gfx/enemies/barrier-node.png")]
		private var g_ship:Class;
		[Embed("../../src.assets/gfx/enemies/barrier-midsection.png")]
		private var g_ship2:Class;
		public var movey:Number = 0;
		public var barr1:Bitmap;

		public function TBarrier(_x:Number, _y:Number) {
			x = _x;
			y = _y;
			wid = 100;
			hei = 25;
			barr1 = getBitmap(g_ship2);
			barr1.x = 10;
			gfx.addChild(barr1);
			var bar:Bitmap = getBitmap(g_ship);
			gfx.addChild(bar);
			bar = getBitmap(g_ship);
			bar.x = 75;
			gfx.addChild(bar);
			Galagian.layerFore.addChild(gfx);
			hp = 50 * Galagian.diffHp;
			updategfx()
		}

		public function Update(myID:uint):void {
			setWhiteBlink(false);
			barr1.alpha = 0.8 + Math.random() / 2;
			var enx:TPlayer = Galagian.Player;
			if (enx != null) {
				if (RectRect(x, y, wid, hei + movey, enx.x, enx.y, enx.wid, enx.hei)) {
					enx.Hit();
				}
			}
			movey += 0.04;
			if (movey > 20) {
				movey = 20
			}
			y += movey;
			updategfx();
			if (y > 700) {
				y = -200
			}
		}

		override public function damage(dam:Number, id:uint, sound:Boolean = true):uint {
			movey = Math.max(-1, movey - 0.3);
			return super.damage(dam, id, sound);
		}

		override public function kill():void {
			Sfx.sound("xp2");
			Hud.instance.addPnt(70);
			TCrystal.give(x + 6, y + 8, 2);
			TCrystal.give(x + 80, y + 8, 2);
			new TExplosion(x - 25, y - 25, 1, 0.3);
			new TExplosion(x + 45, y - 25, 1, 0.3);
			Galagian.layerFore.removeChild(gfx)
		}
	}

}