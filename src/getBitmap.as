package {
	import flash.display.Bitmap;

	public function getBitmap(c:Class):Bitmap {
		var ba:Bitmap = new c();
		ba.smoothing = true;

		return ba;
	}
}
