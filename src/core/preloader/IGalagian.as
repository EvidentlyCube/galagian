package core.preloader {
	import flash.events.KeyboardEvent;

	public interface IGalagian {
		function get hud():IHud;
		function get weapon():IWeapon;

		function keyDownHandler(e:KeyboardEvent):void;
		function keyUpHandler(e:KeyboardEvent):void;
		function mouseClickHandler(e:*):void;
	}
}
