package net.retrocade.retrocamel.display.layers {
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	/**
	 * A Layer which consists of Sprite object, classical display list
	 */
	public class RetrocamelLayerFlashSprite extends RetrocamelLayerFlash {

		/**
		 * The Sprite which makes this layer
		 */
		private var _layer:Sprite;

		/**
		 * Returns the display object of this layer
		 */
		override public function get layer():DisplayObject {
			return _layer;
		}

		/**
		 * Creates a new Sprite Layer and attaches it to the top of the Display tree
		 */
		public function RetrocamelLayerFlashSprite(addAt:Number = -1) {
			_layer = new Sprite;

			addLayer(addAt);
		}

		/**
		 * Adds a DisplayObject to this layer
		 * @param d DisplayObject to be added
		 */
		public function addChild(d:DisplayObject):void {
			_layer.addChild(d);
		}

		/**
		 * Removes all children from this layer
		 */
		override public function clear():void {
			var i:uint = _layer.numChildren;

			while (i--) {
				_layer.removeChildAt(i);
			}

			_layer.graphics.clear();
		}

		/**
		 * Removes an DisplayObject from this layer
		 * @param d The DisplayObject to be removed
		 */
		public function removeChild(d:DisplayObject):void {
			_layer.removeChild(d);
		}
	}
}