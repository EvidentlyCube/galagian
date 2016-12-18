package bullets {
	import flash.display.Bitmap;

	import other.*;
	import Functions.*;

	import core.Galagian;
	import core.List;
	import core.Sfx;

	import flash.display.Sprite;

	

	
	public class TEBullet5 extends TObject {
		[Embed("../../src.assets/gfx/projectiles/shotbig.png")]
		private var g_shot:Class;
		public var spd:Number;

		public function TEBullet5(_x:Number, _y:Number, _spd:Number) {
			Sfx.sound("sh5");
			x = _x;
			y = _y;
			wid = 9;
			hei = 9;
			spd = _spd;
			var bitm:Bitmap = getBitmap(g_shot);
			gfx = new Sprite;
			gfx.addChild(bitm);
			bitm.x = -11;
			bitm.y = -7.5;
			gfx.rotation = 90;
			Galagian.layerMid.addChild(gfx);
			updategfx();
		}

		public function Update(myID:uint):void {
			if (Hit()) {
				Remove(myID);
				kill();
				return;
			}
			y += spd;
			updategfx();
			if (checkY()) {
				Remove(myID);
				kill()
			}
		}

		public function checkY():Boolean {
			if (y > 500) {
				return true;
			}
			return false;
		}

		public function Hit():Boolean {
			var enx:TPlayer = Galagian.Player;
			if (enx == null) {
				return false;
			}
			if (RectRect(x, y + spd, wid, hei - spd, enx.x, enx.y, enx.wid, enx.hei)) {
				enx.Hit();
				return true;
			}
			return false;
		}

		public function Remove(id:uint):void {
			List.BulletRem(id)
		}
	}

}