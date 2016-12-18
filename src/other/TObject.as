﻿package other {
	import core.Galagian;
	import core.List;
	import core.Sfx;

	import flash.display.Sprite;

	
	public class TObject {
		public var x:Number;
		public var y:Number;
		public var wid:uint;
		public var hei:uint;
		public var gfx:* = new Sprite;
		public var hp:Number;

		public function TObject() {

		}

		protected function updategfx(mox:int = 0, moy:int = 0):void {
			gfx.x = x + mox - 2;
			gfx.y = y + moy - 2
		}

		public function damage(dam:Number, id:uint, sound:Boolean = true):uint {
			if (sound) {
				Sfx.sound("tck")
			}
			gfx.blendMode = "erase";
			if (hp > dam) {
				hp -= dam;
				return 0
			} else {
				dam -= hp;
				hp = 0;
				kill();
				List.EnemyRem(id);
				return dam
			}
		}

		public function kill():void {
			Galagian.layerMid.removeChild(gfx)
		}
	}

}