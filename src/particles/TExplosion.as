package particles {
	import core.Galagian;
	import core.List;

	public class TExplosion {
		[Embed("../../src.assets/gfx/explosion/boom01.png")]
		private var b_00:Class;
		[Embed("../../src.assets/gfx/explosion/boom02.png")]
		private var b_01:Class;
		[Embed("../../src.assets/gfx/explosion/boom03.png")]
		private var b_02:Class;
		[Embed("../../src.assets/gfx/explosion/boom04.png")]
		private var b_03:Class;
		[Embed("../../src.assets/gfx/explosion/boom05.png")]
		private var b_04:Class;
		[Embed("../../src.assets/gfx/explosion/boom06.png")]
		private var b_05:Class;
		[Embed("../../src.assets/gfx/explosion/boom07.png")]
		private var b_06:Class;
		[Embed("../../src.assets/gfx/explosion/boom08.png")]
		private var b_07:Class;
		[Embed("../../src.assets/gfx/explosion/boom09.png")]
		private var b_08:Class;
		[Embed("../../src.assets/gfx/explosion/boom10.png")]
		private var b_09:Class;
		[Embed("../../src.assets/gfx/explosion/boom11.png")]
		private var b_10:Class;
		private var gfxes:Array = new Array(11);
		private var spd:uint;
		private var frame:uint;
		private var wait:uint;

		public function TExplosion(x:uint, y:uint, _spd:uint, scale:Number) {
			gfxes[0] = getBitmap(b_00);
			gfxes[1] = getBitmap(b_01);
			gfxes[2] = getBitmap(b_02);
			gfxes[3] = getBitmap(b_03);
			gfxes[4] = getBitmap(b_04);
			gfxes[5] = getBitmap(b_05);
			gfxes[6] = getBitmap(b_06);
			gfxes[7] = getBitmap(b_07);
			gfxes[8] = getBitmap(b_08);
			gfxes[9] = getBitmap(b_09);
			gfxes[10] = getBitmap(b_10);
			for (var i:uint = 0; i < 11; i++) {
				gfxes[i].x = x;
				gfxes[i].y = y;
				gfxes[i].scaleX = scale;
				gfxes[i].scaleY = scale
			}
			wait = spd = _spd;
			frame = 0;
			Galagian.layerFore.addChild(gfxes[frame]);
			List.EffectAdd(this)
		}

		public function U(myID:uint):void {
			if (wait > 0) {
				wait--;
			} else {
				wait = spd;
				Galagian.layerFore.removeChild(gfxes[frame]);
				frame++;
				if (frame == 11) {
					List.EffectRem(myID);
					return;
				}
				Galagian.layerFore.addChild(gfxes[frame])
			}
		}

		public function kill():void {
			Galagian.layerFore.removeChild(gfxes[frame])
		}
	}
}
