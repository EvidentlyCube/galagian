package net.retrocade.retrocamel.core {

	import flash.display.DisplayObjectContainer;
	import flash.display.Stage;
	import flash.events.Event;

	import net.retrocade.retrocamel.interfaces.IRetrocamelSettings;

	use namespace retrocamel_int;

	/**
	 * ...
	 * @author Maurycy Zarzycki
	 */
	public class RetrocamelCore {
		/**
		 * The settings object
		 */
		retrocamel_int static var settings:IRetrocamelSettings;

		/**
		 * Initialzes the whole game
		 */
		public static function initFlash(stage:Stage, main:DisplayObjectContainer, settingsInstance:IRetrocamelSettings):void {
			settings = settingsInstance;

			stage.frameRate = 60;

			RetrocamelInputManager.initialize(stage);
			RetrocamelDisplayManager.initializeFlash(main, stage);

			stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}


		private static function onEnterFrame(e:Event = null):void {
			onEnterFrameSub();
		}

		private static function onEnterFrameSub():void {
			if (RetrocamelDisplayManager.flashStage.focus && !RetrocamelDisplayManager.flashStage.focus.stage) {
				RetrocamelDisplayManager.flashStage.focus = null;
			}
		}
	}
}