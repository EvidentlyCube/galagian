package core {
	import other.*;
	import flash.media.Sound;
	import flash.media.SoundChannel;

	public class Sfx {
		[Embed("../../src.music/musix.mp3")]
		private static var smus:Class;
		[Embed("../../src.assets/sfx/shot1.mp3")]
		private static var ssh1:Class;
		[Embed("../../src.assets/sfx/shot2.mp3")]
		private static var ssh2:Class;
		[Embed("../../src.assets/sfx/shot3.mp3")]
		private static var ssh3:Class;
		[Embed("../../src.assets/sfx/shot4.mp3")]
		private static var ssh4:Class;
		[Embed("../../src.assets/sfx/shot5.mp3")]
		private static var ssh5:Class;
		[Embed("../../src.assets/sfx/explo1.mp3")]
		private static var sxp1:Class;
		[Embed("../../src.assets/sfx/explo2.mp3")]
		private static var sxp2:Class;
		[Embed("../../src.assets/sfx/explo3.mp3")]
		private static var sxp3:Class;
		[Embed("../../src.assets/sfx/tick.mp3")]
		private static var stck:Class;
		[Embed("../../src.assets/sfx/diam.mp3")]
		private static var sdmd:Class;
		private static var mus:Sound;
		private static var sh1:Sound;
		private static var sh2:Sound;
		private static var sh3:Sound;
		private static var sh4:Sound;
		private static var sh5:Sound;
		private static var xp1:Sound;
		private static var xp2:Sound;
		private static var xp3:Sound;
		private static var tck:Sound;
		private static var dmd:Sound;
		public static var snd:uint = 1;
		private static var musch:SoundChannel;
		private static var snds:Array = new Array(10);

		{
			mus = new smus;
			sh1 = new ssh1;
			sh2 = new ssh2;
			sh3 = new ssh3;
			xp1 = new sxp1;
			xp2 = new sxp2;
			xp3 = new sxp3;
			tck = new stck;
			sh4 = new ssh4;
			sh5 = new ssh5;
			dmd = new sdmd;
			snds[0] = 0;
			snds[1] = 0;
			snds[2] = 0;
			snds[3] = 0;
			snds[4] = 0;
			snds[5] = 0;
			snds[6] = 0;
			snds[7] = 0;
			snds[8] = 0;
			snds[9] = 0;
			musique()
		}

		public static function musique():void {
			if (musch == null) {
				musch = mus.play(0, 1000)
			} else {
				musch.stop();
				musch = null
			}
		}

		public static function reset():void {
			snds[0] = 0;
			snds[1] = 0;
			snds[2] = 0;
			snds[3] = 0;
			snds[4] = 0;
			snds[5] = 0;
			snds[6] = Math.max(0, snds[6] - 1);
			snds[7] = 0;
			snds[8] = 0;
			snds[9] = 0
		}

		public static function sound(snd:String):void {
			if (Sfx.snd == 0) {
				return;
			}
			if (Flasher.flashering > 0.6 && snd != "xp3") {
				return;
			}
			switch (snd) {
				case("sh1"):
					if (snds[0] > 0) {
						return;
					}
					snds[0]++;
					sh1.play();
					break;
				case("sh2"):
					if (snds[1] > 1) {
						return;
					}
					snds[1]++;
					sh2.play();
					break;
				case("sh3"):
					if (snds[2] > 1) {
						return;
					}
					snds[2]++;
					sh3.play();
					break;
				case("xp1"):
					if (snds[3] > 1) {
						return;
					}
					snds[3]++;
					xp1.play();
					break;
				case("xp2"):
					if (snds[4] > 1) {
						return;
					}
					snds[4]++;
					xp2.play();
					break;
				case("xp3"):
					if (snds[5] > 1) {
						return;
					}
					snds[5]++;
					xp3.play();
					break;
				case("tck"):
					if (snds[6] > 0) {
						return;
					}
					snds[6] += 2;
					tck.play();
					break;
				case("sh4"):
					if (snds[7] > 0) {
						return;
					}
					snds[7]++;
					sh4.play();
					break;
				case("sh5"):
					if (snds[8] > 0) {
						return;
					}
					snds[8]++;
					sh5.play();
					break;
				case("dmd"):
					if (snds[9] > 0) {
						return;
					}
					snds[9]++;
					dmd.play();
					break;
			}
		}
	}
}