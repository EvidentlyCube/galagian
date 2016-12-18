package Functions {

	
	public function RectRect(x1:Number, y1:Number, w1:uint, h1:uint, x2:Number, y2:Number, w2:uint, h2:uint):Boolean {
		var ix:Number = x2 - x1;
		var iy:Number = y2 - y1;
		if (ix <= w1 && ix >= -w2 && iy <= h1 && iy >= -h2) {
			return true;
		}
		return false;
	}

}