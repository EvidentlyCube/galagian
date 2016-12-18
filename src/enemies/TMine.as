package enemies {
	import other.*;
	import Functions.*;

	import core.Galagian;
	import core.Hud;
	import core.Sfx;

	import particles.TExplosion;

	
	public class TMine extends TObject {
		[Embed("../../src.assets/gfx/enemies/mine0.png")]
		private var g_ship0:Class;
		[Embed("../../src.assets/gfx/enemies/mine1.png")]
		private var g_ship1:Class;
		[Embed("../../src.assets/gfx/enemies/mine2.png")]
		private var g_ship2:Class;
		public var movey:Number = 0;
		public var gfxes:Array = new Array(3);
		public var frame:uint = 0;
		public var tim:uint = 5;

		public function TMine(_x:Number, _y:Number) {
			x = _x;
			y = _y;
			wid = 17;
			hei = 17;
			gfxes[0] = getBitmap(g_ship0);
			gfxes[1] = getBitmap(g_ship1);
			gfxes[2] = getBitmap(g_ship2);
			Galagian.layerFore.addChild(gfxes[0]);
			Galagian.layerFore.addChild(gfxes[1]);
			Galagian.layerFore.addChild(gfxes[2]);
			gfxes[0].visible = gfxes[1].visible = gfxes[2].visible = false;
			gfx = gfxes[frame];
			gfx.visible = true;
			hp = 12 * Galagian.diffHp;
			movey = (Math.random() * 2 + 0.5) * Galagian.diffSpd;
			updategfx(-4, -4)
		}

		public function Update(myID:uint):void {
			gfx.blendMode = "normal";
			tim--;
			if (tim == 0) {
				tim = 4;
				frame++;
				if (frame > 2) {
					frame = 0
				}
				gfx.visible = false;
				gfx = gfxes[frame];
				gfx.visible = true
			}
			y += movey;
			var enx:TPlayer = Galagian.Player;
			if (y > 500) {
				y = -50;
				x = 15 + Math.random() * 450
			}
			updategfx(-4, -4);
			if (enx == null) {
				return
			}
			if (RectRect(x, y, wid, hei + movey, enx.x, enx.y, enx.wid, enx.hei)) {
				enx.Hit()
			}
		}

		override public function kill():void {
			Sfx.sound("xp2");
			Hud.instance.addPnt(15);
			new TExplosion(x - 16, y - 13, 1, 0.20);
			Galagian.layerFore.removeChild(gfxes[0]);
			Galagian.layerFore.removeChild(gfxes[1]);
			Galagian.layerFore.removeChild(gfxes[2])
		}
	}

}