package bullets {
	import flash.display.Bitmap;

	import other.*;
	import Functions.*;

	import core.Galagian;
	import core.List;

	

	
	public class TPBullet2 extends TObject {
		[Embed("../../src.assets/gfx/projectiles/shotsmall.png")]
		private var g_shot:Class;
		public var mx:Number;
		public var my:Number;

		public function TPBullet2(_x:Number, _y:Number, _spd:Number, _dir:Number, _hp:uint = 1) {
			x = _x;
			y = _y;
			wid = 4;
			hei = 4;
			hp = _hp * 2;
			gfx.rotation = _dir;
			_dir = _dir * Math.PI / 180;
			mx = Math.cos(_dir) * _spd;
			my = Math.sin(_dir) * _spd;
			var bitm:Bitmap = getBitmap(g_shot);
			gfx.addChild(bitm);
			bitm.x = -8;
			bitm.y = -4;

			Galagian.layerMid.addChild(gfx);
			updategfx(-2, -2);
		}

		public function Update(myID:uint):void {
			x += mx;
			y += my;

			updategfx(-2, -2);
			if (Hit()) {
				Remove(myID);
				kill();
				return;
			}
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