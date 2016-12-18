package bullets {
	import flash.display.Bitmap;

	import other.*;
	import Functions.*;

	import core.Galagian;
	import core.Gfx;
	import core.List;
	import core.Sfx;

	import flash.display.Sprite;

	

	import particles.TExplosion;

	
	public class TEBullet7 extends TObject {
		public var movex:Number;
		public var movey:Number;
		public var addx:Number;
		public var addy:Number;
		public var dir:Number;
		public var life:uint;
		public var spd:Number;

		public function TEBullet7(_x:Number, _y:Number, _spd:Number) {
			Sfx.sound("sh3");
			x = _x;
			y = _y;
			spd = _spd * Galagian.diffSpd;
			life = 100 + Math.random() * 400 * Galagian.diffAtk;
			var enx:TPlayer = Galagian.Player;
			if (enx != null) {
				dir = Math.atan2(enx.midy - y, enx.midx - x)
			} else {
				dir = Math.atan2(10, 0)
			}
			var bitm:Bitmap = getBitmap(Gfx.projectileRocket);
			gfx = new Sprite;
			gfx.addChild(bitm);
			bitm.x = -1;
			bitm.y = -3.5;
			gfx.rotation = dir * 180 / Math.PI;
			movex = Math.cos(dir) * (spd + 10);
			movey = Math.sin(dir) * (spd + 10);
			addx = Math.cos(dir + 90) * 2.5;
			addy = Math.sin(dir + 90) * 2.5;
			Galagian.layerMid.addChild(gfx);
			updategfx();
		}

		public function Update(myID:uint):void {
			life--;
			if (life == 0) {
				Remove(myID);
				kill();
				return;
			}
			if (Hit()) {
				Remove(myID);
				kill();
				return;
			}
			x += Math.cos(dir) * spd;
			y += Math.sin(dir) * spd;
			var enx:TPlayer = Galagian.Player;
			if (enx != null) {
				var newdir:Number = Math.atan2(enx.midy - y, enx.midx - x);
				newdir = Sign(Angler(dir, newdir)) * 0.04;
				dir += newdir;
				movex = Math.cos(dir) * (spd + 10);
				movey = Math.sin(dir) * (spd + 10);
				addx = Math.cos(dir + 90) * 2.5;
				addy = Math.sin(dir + 90) * 2.5
			}
			gfx.rotation = dir * 180 / Math.PI;
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
			if (LineRect(x + addx, y + addy, x + addx + movex, y + addy + movey, enx.x, enx.y, enx.wid, enx.hei) ||
				LineRect(x - addx, y - addy, x - addx + movex, y - addy + movey, enx.x, enx.y, enx.wid, enx.hei)) {
				enx.Hit();
				return true;
			}
			return false;
		}

		public function Remove(id:uint):void {
			new TExplosion(x - 15 + Math.cos(dir) * 5, y - 10 + Math.sin(dir) * 5, 1, 0.15);
			List.BulletRem(id)
		}
	}

}