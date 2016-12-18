package bullets {
	import other.*;
	import Functions.*;

	import core.Galagian;
	import core.List;

	
	public class TPBullet4 extends TObject {
		public function TPBullet4(_x:Number, _y:Number) {
			x = _x - 1;
			y = 0;
			wid = 3;
			hei = _y;
			hp = 0.12;
			gfx.graphics.beginFill(0xFFFF00);
			gfx.graphics.drawRect(0, 0, wid, hei);
			gfx.graphics.endFill();
			Galagian.layerMid.addChild(gfx);
			updategfx();
			if (Flasher.flashering < 0.6) {
				Hit()
			}
		}

		public function Update(myID:uint):void {
			gfx.alpha -= 0.6;
			if (gfx.alpha <= 0) {
				Remove(myID);
				kill()
			}
		}

		public function Hit():void {
			for (var en:int = List.Enemies.length - 1; en >= 0; en--) {
				var enx:TObject = List.Enemies[en];
				if (RectRect(x, y, wid, hei, enx.x, enx.y, enx.wid, enx.hei)) {
					hp = List.Enemies[en].damage(hp, en, false)
				}
			}
		}

		public function Remove(id:uint):void {
			List.BulletRem(id)
		}
	}

}