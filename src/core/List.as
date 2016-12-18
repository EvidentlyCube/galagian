package  core {
	import other.*;

	
	public class List {
		public static var Bullets:Array = [];
		public static var Enemies:Array = [];
		public static var Effects:Array = [];

		public function List() {
		}

		public static function BulletAdd(x:TObject):void {
			Bullets.push(x)
		}

		public static function BulletRem(id:uint):void {
			Bullets.splice(id, 1)
		}

		public static function EnemyAdd(x:TObject):void {
			Enemies.push(x)
		}

		public static function EnemyRem(id:uint):void {
			Enemies.splice(id, 1)
		}

		public static function EffectAdd(x:*):void {
			Effects.push(x)
		}

		public static function EffectRem(id:uint):void {
			Effects.splice(id, 1)
		}
	}

}