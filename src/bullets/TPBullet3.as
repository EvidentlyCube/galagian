package bullets {
	import other.*;
	import Functions.*;

	import core.Galagian;
	import core.List;

	
	public class TPBullet3 extends TObject {
		public function TPBullet3(_x:Number, _y:Number, _hp:uint = 1) {
			x = _x;
			y = 0;
			wid = _hp * 2;
			hei = _y;
			hp = _hp;
			gfx.graphics.beginFill(0xFFFFFF);
			gfx.graphics.drawRect(0, 0, wid, hei);
			gfx.graphics.endFill();
			Galagian.layerMid.addChild(gfx);
			updategfx();
			if (Flasher.flashering < 0.6) {
				Hit()
			}
		}

		public function Update(myID:uint):void {
			gfx.alpha -= 0.2;
			if (gfx.alpha < 0) {
				Remove(myID);
				kill()
			}
		}

		public function Hit():void {
			for (var en:int = List.Enemies.length - 1; en >= 0; en--) {
				var enx:TObject = List.Enemies[en];
				if (RectRect(x, y, wid, hei, enx.x, enx.y, enx.wid, enx.hei)) {
					hp = List.Enemies[en].damage(hp, en)
				}
			}
		}

		public function Remove(id:uint):void {
			List.BulletRem(id)
		}
	}

}