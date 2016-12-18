package net.retrocade.retrocamel.display.layers {
	import flash.display.DisplayObject;

	public class RetrocamelLayerFlash extends RetrocamelLayer {
		public function get layer():DisplayObject {
			throw new TypeError("rLayerFlash::layer() has to be overriden");
		}
	}
}