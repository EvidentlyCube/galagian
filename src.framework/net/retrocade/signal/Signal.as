package net.retrocade.signal {
	import net.retrocade.functions.printf;

	public class Signal {
		private var _callbacks:Array;
		private var _expectedArgumentCount:int;

		public function Signal(expectedArgumentCount:int) {
			_callbacks = [];
			_expectedArgumentCount = expectedArgumentCount;
		}

		public function add(callback:Function):void {
			if (callback.length !== 0 && callback.length !== _expectedArgumentCount) {
				throw new Error(printf("Registering callback with incorrect number of arguments, %% given, %% expected", callback.length, _expectedArgumentCount));
			}
			_callbacks.push(callback);
		}

		public function remove(callback:Function):void {
			var index:int = _callbacks.indexOf(callback);

			if (index !== -1) {
				_callbacks.splice(index, 1);
			}
		}

		public function call(...params):void {
			if (params.length !== _expectedArgumentCount) {
				throw new Error(printf("Tried to call signal with %% arguments, %% expected", params.length, _expectedArgumentCount))
			}
			for each(var callback:Function in _callbacks) {
				if (callback.length === 0) {
					callback();
				} else if (callback.length === params.length) {
					callback.apply(null, params);
				} else {
					throw new Error("Registered a callback with incorrect number of arguments");
				}
			}
		}
	}
}
