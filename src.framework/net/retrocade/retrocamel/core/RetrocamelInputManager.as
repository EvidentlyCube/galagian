package net.retrocade.retrocamel.core {
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;

	import net.retrocade.signal.Signal;

	use namespace retrocamel_int;

	public class RetrocamelInputManager {
		/**
		 * X position of the mouse in stage coordinates
		 */
		private static var _mouseX:int = 0;

		/**
		 * Returns X position of the mouse in stage coordinates
		 */
		public static function get mouseX():int {
			return (_mouseX - RetrocamelDisplayManager.offsetX) / RetrocamelDisplayManager.scaleX;
		}


		/**
		 * Y position of the mouse in stage coordinates
		 */
		private static var _mouseY:int = 0;

		/**
		 * Returns Y position of the mouse in stage coordinates
		 */
		public static function get mouseY():int {
			return (_mouseY - RetrocamelDisplayManager.offsetY) / RetrocamelDisplayManager.scaleY;
		}


		private static var _keyDownSignal:Signal = new Signal(1);


		public static function get keyDownSignal():Signal {
			return _keyDownSignal;
		}



		internal static function initialize(stage:Stage):void {
			if (!stage) {
				throw new Error("You have to pass a valid Stage object!");
			}

			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}

		private static function onKeyDown(e:KeyboardEvent):void {
			_keyDownSignal.call(e.keyCode);

		}

		private static function onMouseMove(e:MouseEvent):void {
			_mouseX = e.stageX;
			_mouseY = e.stageY;
		}

		private static function onMouseDown(e:MouseEvent):void {
			_mouseX = e.stageX;
			_mouseY = e.stageY;
		}

		private static function onMouseUp(e:MouseEvent):void {
			_mouseX = e.stageX;
			_mouseY = e.stageY;
		}
	}
}