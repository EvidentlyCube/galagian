package other {
	import core.Galagian;
	import core.Hud;
	import core.List;
	import core.Sfx;

	import flash.display.Sprite;

	public class Flasher {
		public var gfx:Sprite = new Sprite;
		public static var flashering:Number = 0;

		public function Flasher() {
			if (Hud.instance.lives < 0) {
				return;
			}
			Sfx.sound("xp3");
			gfx.graphics.beginFill(0xFFFFFF);
			gfx.graphics.drawRect(0, 0, 500, 500);
			gfx.graphics.endFill();
			gfx.alpha = 1.3;
			Galagian.layerHud.addChild(gfx);
			List.EffectAdd(this);
			TPlayer.reappear = 200
		}

		public function U(myID:uint):void {
			gfx.alpha -= 0.005;
			flashering = gfx.alpha;
			if (gfx.alpha > 0.6) {
				while (List.Bullets.length > 0) {
					List.Bullets.pop().kill()
				}
			}
			if (gfx.alpha < 0) {
				Galagian.layerHud.removeChild(gfx);
				List.EffectRem(myID)
			}
		}

		public function kill():void {
			Galagian.layerHud.removeChild(gfx)
		}
	}
}