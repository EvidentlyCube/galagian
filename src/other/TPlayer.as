package other {
	import Functions.*;

	import core.Galagian;
	import core.Gfx;
	import core.Hud;

	import flash.display.Bitmap;


	import particles.TExplosion;

	public class TPlayer extends TObject {
		private static const MIN_X:uint = 5;
		private static const MAX_X:uint = 475;
		private static const MIN_Y:uint = 5;
		private static const MAX_Y:uint = 475;
		public var midx:Number;
		public var midy:Number;
		public var gfxes:Array = new Array(5);
		public var fram:Number;
		public static var shield:Bitmap;
		public static var reappear:uint = 0;

		public function TPlayer(_x:uint, _y:uint) {
			reappear = 200;
			x = _x;
			y = _y;
			wid = 20;
			hei = 16;
			shield = getBitmap(Gfx.playerShield);
			shield.blendMode = "add";
			gfxes[0] = getBitmap(Gfx.playerShipLeftMuch);
			gfxes[1] = getBitmap(Gfx.playerShipLeftSlight);
			gfxes[2] = getBitmap(Gfx.playerShipNeutral);
			gfxes[3] = getBitmap(Gfx.playerShipRightSlight);
			gfxes[4] = getBitmap(Gfx.playerShitRightMuch);
			Galagian.layerFore.addChild(gfxes[0]);
			Galagian.layerFore.addChild(gfxes[1]);
			Galagian.layerFore.addChild(gfxes[2]);
			Galagian.layerFore.addChild(gfxes[3]);
			Galagian.layerFore.addChild(gfxes[4]);
			Galagian.layerFore.addChild(shield);
			shield.visible = false;
			gfxes[0].visible = false;
			gfxes[1].visible = false;
			gfxes[2].visible = false;
			gfxes[3].visible = false;
			gfxes[4].visible = false;
			updategfx(-4, -7)
		}

		public function Update(mx:uint, my:uint):void {
			// --------------------------------------------------- MOVE
			shield.x = x - 7;
			shield.y = y - 9;
			var aimx:Number = mx - wid / 2;
			var aimy:Number = my - hei / 2;
			if (aimy > MAX_Y) {
				aimy = MAX_Y;
			}
			if (aimy < MIN_Y) {
				aimy = MIN_Y;
			}
			if (aimx < MIN_X) {
				aimx = MIN_X;
			}
			if (aimx > MAX_X) {
				aimx = MAX_X;
			}
			if (Distance2(aimx, aimy, x, y) > 400) {
				var dir:Number = Math.atan2(aimy - y, aimx - x);
				aimx = Math.cos(dir) * 20;
				aimy = Math.sin(dir) * 20
			} else {
				aimx -= x;
				aimy -= y
			}
			if (aimx > 10) {
				fram = 4
			} else if (aimx > 0) {
				if (fram < 3) {
					fram = 3
				}
			} else if (aimx < -10) {
				fram = 0
			} else if (aimx < 0) {
				if (fram > 1) {
					fram = 1
				}
			}
			if (fram > 2) {
				fram -= 0.1
			} else {
				fram += 0.1
			}
			flip(Math.round(fram));
			x += aimx;
			y += aimy;

			midx = x + wid / 2;
			midy = y + hei / 2;
			if (reappear > 0) {
				gfx.visible = Math.floor(reappear / 2) % 2;
				reappear--;
			}
			updategfx(-2, -7)


		}

		public function flip(gief:uint):void {
			gfx.visible = false;
			gfx = gfxes[gief];
			gfx.visible = true
		}

		public function Hit():void {
			if ((Galagian.shield && Hud.instance.shield) || reappear > 0) {
				return;
			}
			kill()
		}

		override public function kill():void {
			new TExplosion(x - 110, y - 90, 2, 1);
			Hud.instance.lives--;
			Hud.instance.updLives();
			new Flasher();
			Galagian.layerFore.removeChild(shield);
			Galagian.layerFore.removeChild(gfxes[0]);
			Galagian.layerFore.removeChild(gfxes[1]);
			Galagian.layerFore.removeChild(gfxes[2]);
			Galagian.layerFore.removeChild(gfxes[3]);
			Galagian.layerFore.removeChild(gfxes[4]);
			Hud.instance.shield = 120;
			Galagian.Player = new TPlayer(0, 0)
		}
	}

}