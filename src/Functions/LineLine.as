package Functions {

	
	public function LineLine(x1:Number, y1:Number, x2:Number, y2:Number, x3:Number, y3:Number, x4:Number, y4:Number):Boolean {
		var ua:Number = ((x4 - x3) * (y1 - y3) - (y4 - y3) * (x1 - x3)) / ((y4 - y3) * (x2 - x1) - (x4 - x3) * (y2 - y1));
		var ub:Number = ((x2 - x1) * (y1 - y3) - (y2 - y1) * (x1 - x3)) / ((y4 - y3) * (x2 - x1) - (x4 - x3) * (y2 - y1));

		if ((ua < 1 && ua > 0 && ub < 1 && ub > 0) || (ua == 0 && ub == 0)) {
			return true
		} else {
			return false
		}
	}

}