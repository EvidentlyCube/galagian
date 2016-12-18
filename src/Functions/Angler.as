// ActionScript file
package Functions {
	public function Angler(ang1:Number, ang2:Number):Number {
		ang1 = (ang2 - ang1) * 180 / Math.PI;
		if (ang1 >= 180) {
			ang1 -= 360;
		} else {
			if (ang1 <= -180) {
				ang1 += 360;
			}
		}
		return ang1 * Math.PI / 180
	}
}