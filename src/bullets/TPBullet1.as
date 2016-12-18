package bullets {
	import flash.display.Bitmap;

	import other.*;
	import Functions.*;

	import core.Galagian;
	import core.List;

	

	
	public class TPBullet1 extends TObject {
		[Embed("../../src.assets/gfx/projectiles/shotsmall.png")]
		private var g_shot:Class;
		public var spd:Number;

		public function TPBullet1(_x:Number, _y:Number, _spd:Number, _hp:uint = 1) {
			x = _x;
			y = _y;
			wid = 4;
			hei = 4;
			hp = _hp;
			spd = -_spd;
			var bitm:Bitmap = getBitmap(g_shot);
			gfx.addChild(bitm);
			bitm.x = -6;
			bitm.y = -4;
			gfx.rotation = -90;
			Galagian.layerMid.addChild(gfx);
			updategfx();
		}

		public function Update(myID:uint):void {
			y += spd;
			if (Hit()) {
				Remove(myID);
				kill();
				return;
			}
			updategfx();
			if (checkY()) {
				Remove(myID);
				kill()
			}
		}

		public function checkY():Boolean {
			if (y + hei < 0) {
				return true;
			}
			return false;
		}

		public function Hit():Boolean {
			for (var en:int = List.Enemies.length - 1; en >= 0; en--) {
				var enx:TObject = List.Enemies[en];
				if (RectRect(x, y, wid, hei, enx.x, enx.y, enx.wid, enx.hei)) {
					hp = List.Enemies[en].damage(hp, en);
					if (hp == 0) {
						return true;
					}
				}
			}
			return false;
		}

		public function Remove(id:uint):void {
			List.BulletRem(id)
		}
	}

}