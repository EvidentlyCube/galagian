package Functions {
	public function LineRect(x1:Number, y1:Number, x2:Number, y2:Number, x3:Number, y3:Number, wid:uint, hei:uint):Boolean {
		var inters:Boolean;
		var txter:String = Sign(x2 - x1).toString() + Sign(y2 - y1).toString();
		switch (txter) {
			case ("-1-1"):
				inters = LineLine(x1, y1, x2, y2, x3 + wid, y3, x3 + wid, y3 + hei);
				if (inters == false) {
					return LineLine(x1, y1, x2, y2, x3, y3 + hei, x3 + wid, y3 + hei);
				} else {
					return inters;
				}
				break;
			case ("-10"):
				return LineLine(x1, y1, x2, y2, x3 + wid, y3, x3 + wid, y3 + hei);
				break;
			case ("-11"):
				inters = LineLine(x1, y1, x2, y2, x3, y3, x3 + wid, y3);
				if (inters == false) {
					return LineLine(x1, y1, x2, y2, x3 + wid, y3, x3 + wid, y3 + hei);
				} else {
					return inters;
				}
				break;
			case ("0-1"):
				return LineLine(x1, y1, x2, y2, x3, y3 + hei, x3 + wid, y3 + hei);
				break;
			case ("01"):
				return LineLine(x1, y1, x2, y2, x3, y3, x3 + wid, y3);
				break;
			case ("1-1"):
				inters = LineLine(x1, y1, x2, y2, x3, y3 + hei, x3 + wid, y3 + hei);
				if (inters == false) {
					return LineLine(x1, y1, x2, y2, x3, y3, x3 + wid, y3 + hei);
				} else {
					return inters;
				}
				break;
			case ("10"):
				return LineLine(x1, y1, x2, y2, x3, y3, x3, y3 + hei);
				break;
			case ("11"):
				inters = LineLine(x1, y1, x2, y2, x3, y3, x3, y3 + hei);
				if (inters == false) {
					return LineLine(x1, y1, x2, y2, x3, y3 + hei, x3 + wid, y3);
				} else {
					return inters;
				}
				break;
			case "00":
				return false;
				break
		}
		return false;
	}

}