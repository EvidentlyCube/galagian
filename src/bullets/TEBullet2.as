package bullets {
	import flash.display.Bitmap;

	import other.*;
	import Functions.*;

	import core.Galagian;
	import core.List;
	import core.Sfx;

	import flash.display.Sprite;

	

	
	public class TEBullet2 extends TObject {
		[Embed("../../src.assets/gfx/projectiles/shotoval.png")]
		private var g_shot:Class;
		public var movex:Number;
		public var movey:Number;
		public var spd:Number;
		public var dir:Number;
		public var addx:Number;
		public var addy:Number;

		public function TEBullet2(_x:Number, _y:Number, _spd:Number) {
			Sfx.sound("sh5");
			x = _x;
			y = _y;
			spd = _spd;
			var enx:TPlayer = Galagian.Player;
			if (enx != null) {
				dir = Math.atan2(enx.midy - y, enx.midx - x)
			} else {
				dir = Math.atan2(10, 0)
			}
			var bitm:Bitmap = getBitmap(g_shot);
			gfx = new Sprite;
			gfx.addChild(bitm);
			bitm.x = -6;
			bitm.y = -8.5;
			gfx.rotation = dir;
			movex = Math.cos(dir) * (_spd + 5);
			movey = Math.sin(dir) * (_spd + 5);
			addx = Math.cos(dir + 90) * 2.5;
			addy = Math.sin(dir + 90) * 2.5;
			gfx.graphics.beginFill(0xFFFFFF);
			gfx.graphics.drawEllipse(0, 0, wid, hei);
			Galagian.layerMid.addChild(gfx);
			updategfx();
		}

		public function Update(myID:uint):void {
			if (Hit()) {
				Remove(myID);
				kill();
				return;
			}
			x += Math.cos(dir) * spd;
			y += Math.sin(dir) * spd;
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
			List.BulletRem(id)
		}
	}

}