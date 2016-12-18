/**
 * Created with IntelliJ IDEA.
 * User: Ryc
 * Date: 19.05.13
 * Time: 12:33
 * To change this template use File | Settings | File Templates.
 */
package net.retrocade.functions {
	public function printf(string:String, ...params:Array):String {
		var matchCount:int = 0;

		return string.replace(/%%/g, function (match:String, index:int, fullString:String):String {
			if (params.length > matchCount) {
				matchCount++;
				return params[matchCount - 1] ? params[matchCount - 1].toString() : '';
			}

			return "%%";
		});
	}
}
