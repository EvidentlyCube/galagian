package bullets {
	import other.*;
	import Functions.*;

	import core.Galagian;
	import core.List;
	import core.Sfx;

	
	public class TEBullet4 extends TObject {
		[Embed("../../src.assets/gfx/flame/flame0.png")]
		private var g_shot0:Class;
		[Embed("../../src.assets/gfx/flame/flame1.png")]
		private var g_shot1:Class;
		[Embed("../../src.assets/gfx/flame/flame2.png")]
		private var g_shot2:Class;
		[Embed("../../src.assets/gfx/flame/flame3.png")]
		private var g_shot3:Class;
		[Embed("../../src.assets/gfx/flame/flame4.png")]
		private var g_shot4:Class;
		[Embed("../../src.assets/gfx/flame/flame5.png")]
		private var g_shot5:Class;
		public var movex:Number;
		public var movey:Number;
		public var dir:Number;
		public var rad:Number = 9;
		public var gfxes:Array = new Array(6);
		public var frame:uint = 0;
		public var tim:uint = 69;

		public function TEBullet4(_x:Number, _y:Number, _spd:Number, _dir:Number) {
			Sfx.sound("sh4");
			gfxes[0] = getBitmap(g_shot0);
			gfxes[1] = getBitmap(g_shot1);
			gfxes[2] = getBitmap(g_shot2);
			gfxes[3] = getBitmap(g_shot3);
			gfxes[4] = getBitmap(g_shot4);
			gfxes[5] = getBitmap(g_shot5);
			//gfx.blendMode=BlendMode.ADD;
			//gfx.rotation=Math.random()*360
			gfx.addChild(gfxes[0]);
			gfxes[0].x = -37.5;
			gfxes[0].y = -37.5;
			x = _x;
			y = _y;
			dir = _dir;
			var enx:TPlayer = Galagian.Player;
			movex = Math.cos(dir) * _spd;
			movey = Math.sin(dir) * _spd;
			Galagian.layerMid.addChild(gfx);
			updategfx();
		}

		public function Update(myID:uint):void {
			tim--;
			if (tim == 0) {
				tim = 3;
				gfx.removeChild(gfxes[frame]);
				frame++;
				gfx.addChild(gfxes[frame]);
				gfxes[frame].x = -37.5;
				gfxes[frame].y = -37.5
			}
			if (Hit() || rad > 25) {
				Remove(myID);
				kill();
				return;
			}
			rad += 0.2;
			gfx.scaleX = rad / 37.5;
			gfx.scaleY = rad / 37.5;

			x += movex;
			y += movey;
			updategfx();
			if (checkY()) {
				Remove(myID);
				kill()
			}
		}

		public function checkY():Boolean {
			if (y > 550) {
				return true;
			}
			return false;
		}

		public function Hit():Boolean {
			var enx:TPlayer = Galagian.Player;
			if (enx == null) {
				return false;
			}
			if (RectRect(x - rad / 2, y - rad / 2, rad, rad, enx.x, enx.y, enx.wid, enx.hei)) {
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