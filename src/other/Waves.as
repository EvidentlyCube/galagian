package other {
	import core.Galagian;
	import core.Hud;
	import core.List;
	import core.Weapon;

	import enemies.TBarrier;

	import enemies.TBoarder;
	import enemies.TCannon;

	import enemies.TCore;
	import enemies.TCruiser;
	import enemies.TFighter;
	import enemies.TFlamer;
	import enemies.TKamikaze;
	import enemies.TMine;
	import enemies.TMower;
	import enemies.TParafighter;
	import enemies.TRocketer;

	import enemies.TShieldShip;

	import flash.net.SharedObject;

	public class Waves {
		public function Waves() {
		}

		public static var chl:uint = 1;

		public static function Give(no:uint):void {
			if (Hud.instance.messer == 0 && Galagian.gameOverContainer.alpha == 0 && Galagian.titleScreenBitmap.alpha == 0) {
				var so:SharedObject = SharedObject.getLocal("Galagian_Data");
				var ga:Number = Galagian.diffHp;
				so.data.dH = ga;

				var ga2:Number = Galagian.diffAtk;
				so.data.dA = ga2;

				var ga3:Number = Galagian.diffSpd;
				so.data.dS = ga3;

				var ga4:uint = Hud.instance.wavs - 1;
				so.data.wav = ga4;

				var ga5:uint = Weapon.instance.weaplev;
				so.data.wea = ga5;

				var ga6:uint = Waves.chl;
				so.data.chl = ga6;

				var ga7:Boolean = Galagian.isEasyMode;
				so.data.e = ga7

			}
			var noer:String = no.toString();
			while (noer.length < 3) {
				noer = "0" + noer
			}
			var chler:String = chl.toString();
			if (chler.length < 2) {
				chler = "0" + chler
			}
			var txter:String;
			switch (no % 44) {
				case(1):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Wave: " + noer + "\n Introducing Fighters \n Just gettin' warmed up");
						return;
					}
					sFig(5);
					break;
				case(2):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Wave: " + noer + "\n Introducing Boarders");
						return;
					}
					sFig(8);
					sBoa(1);
					break;
				case(3):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Wave: " + noer + "\n Introducing Kamikazes \n Their touch is deadly...");
						return;
					}
					sFig(8);
					sBoa(4);
					sKam(1);
					break;
				case(4):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Wave: " + noer);
						return;
					}
					sFig(6);
					sBoa(5);
					sKam(5);
					break;
				case(5):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Wave: " + noer + "\n Challenge no. " + chler);
						chl++;
						return;
					}
					sFig(15);
					Galagian.diffAtk += 1;	//2
					break;
				case(6):
					if (Hud.instance.messer == 0) {
						Weapon.instance.weaplev++;
						txter = Weapon.instance.weaplev < 14 ? "\n -- WEAPON LEVEL UPGRADED --" : "";
						Hud.instance.setMes("Wave: " + noer + "\n Introducing Cannons \n\n -- EXTRA LIFE ACQUIRED -- " + txter);

						Hud.instance.lives++;
						Hud.instance.updLives();
						return;
					}

					Galagian.diffAtk -= 1;	//1
					sCan(1);
					sFig(4);
					sBoa(2);
					sKam(5);
					break;
				case(7):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Wave: " + noer);
						return;
					}
					sCan(4);
					sKam(8);
					break;
				case(8):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Wave: " + noer + "\n Introducing Mines \n Their touch is deadly...");
						return;
					}
					sCan(1);
					sMin(4);
					sKam(2);
					sFig(5);
					sBoa(3);
					break;
				case(9):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Wave: " + noer + "\n Challenge no. " + chler);
						chl++;
						return;
					}
					Galagian.diffAtk += 19;	//20
					sKam(30);
					break;
				case(10):
					if (Hud.instance.messer == 0) {
						Weapon.instance.weaplev++;
						txter = Weapon.instance.weaplev < 14 ? "\n -- WEAPON LEVEL UPGRADED --" : "";
						Hud.instance.setMes("Wave: " + noer + "\n" + txter);
						return;
					}
					Galagian.diffAtk -= 19;	//1
					sCan(5);
					sMin(5);
					sKam(5);
					sFig(8);
					sBoa(8);
					break;
				case(11):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Wave: " + noer + "\n Introducing Cruisers \n\n -- EXTRA LIFE ACQUIRED -- ");
						Hud.instance.lives++;
						Hud.instance.updLives();
						return;
					}
					sFig(5);
					sCru(4);
					sCan(2);
					sBoa(10);
					sKam(2);
					break;
				case(12):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Wave: " + noer);
						return;
					}
					sCru(10);
					sKam(10);
					sCan(4);
					break;
				case(13):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Wave: " + noer + "\n Introducing Parafighters");
						return;
					}
					sCru(2);
					sPar(4);
					sCan(3);
					sMin(2);
					sKam(4);
					break;
				case(14):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Wave: " + noer + "\n Challenge no. " + chler);
						chl++;
						return;
					}
					Galagian.diffHp += 1;	//3
					sCru(4);
					sPar(4);
					break;
				case(15):
					if (Hud.instance.messer == 0) {
						Weapon.instance.weaplev++;
						txter = Weapon.instance.weaplev < 14 ? "\n -- WEAPON LEVEL UPGRADED --" : "";
						Hud.instance.setMes("Wave: " + noer + "\n" + txter);
						return;
					}
					Galagian.diffHp -= 1;	//1
					sMin(20);
					sPar(4);
					sCan(10);
					break;
				case(16):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Wave: " + noer + "\n Introducing Flamers \n They will burn you up to the pieces \n\n -- EXTRA LIFE ACQUIRED -- ");
						Hud.instance.lives++;
						Hud.instance.updLives();
						return;
					}
					sFla(1);
					sCan(10);
					break;
				case(17):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Wave: " + noer);
						return;
					}
					sFla(2);
					sCan(4);
					sMin(5);
					sBoa(20);
					break;
				case(18):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Wave: " + noer);
						return;
					}
					sFla(3);
					sFig(15);
					sCru(4);
					break;
				case(19):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Wave: " + noer + " Challenge no. " + chler);
						chl++;
						return;
					}
					Galagian.diffHp += 2;	//2
					sFla(10);
					sCan(1);
					break;
				case(20):
					if (Hud.instance.messer == 0) {
						Weapon.instance.weaplev++;
						txter = Weapon.instance.weaplev < 14 ? "\n -- WEAPON LEVEL UPGRADED --" : "";
						Hud.instance.setMes("Wave: " + noer + "\n Deja vu... ? \n" + txter);
						return;
					}
					Galagian.diffHp -= 2;	//1
					sFla(4);
					sKam(40);
					break;
				case(21):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Wave: " + noer + "\n Challenge no. " + chler + " \n\n Introducing Barriers \n Their touch is deadly... \n\n -- EXTRA LIFE ACQUIRED -- ");
						Hud.instance.lives++;
						chl++;
						Hud.instance.updLives();
						return;
					}
					Galagian.diffHp += 1;	//2
					sBar(4);
					break;
				case(22):
					if (Hud.instance.messer == 0) {
						Weapon.instance.weaplev++;
						txter = Weapon.instance.weaplev < 14 ? "\n -- WEAPON LEVEL UPGRADED --" : "";
						Hud.instance.setMes("Wave: " + noer + "\n" + txter);
						return;
					}
					Galagian.diffHp -= 1;	//1
					sBar(2);
					sFla(4);
					sCan(2);
					break;
				case(23):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Wave: " + noer);
						return;
					}
					sBar(2);
					sFla(2);
					sCan(6);
					sCru(4);
					sPar(2);
					sKam(8);
					break;
				case(24):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Wave: " + noer + "\n Challenge no, " + chler + "\n\n Introducing Shield Ships \n Their touch is deadly...");
						chl++;
						return;
					}
					Galagian.diffSpd += 1;	//2
					sFla(6);
					sShi(5);
					break;
				case(25):
					if (Hud.instance.messer == 0) {
						Weapon.instance.weaplev++;
						txter = Weapon.instance.weaplev < 14 ? "\n -- WEAPON LEVEL UPGRADED --" : "";
						Hud.instance.setMes("Wave: " + noer + "\n" + txter);
						return;
					}
					Galagian.diffSpd -= 1;	//1
					List.EnemyAdd(new TShieldShip(0, -50));
					List.EnemyAdd(new TShieldShip(80, -50));
					List.EnemyAdd(new TShieldShip(160, -50));
					List.EnemyAdd(new TShieldShip(240, -50));
					List.EnemyAdd(new TShieldShip(320, -50));
					List.EnemyAdd(new TShieldShip(400, -50));
					sKam(30);
					sBar(1);
					sFig(30);
					break;
				case(26):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Wave: " + noer + "\n Challenge no. " + chler + " \n\n -- EXTRA LIFE ACQUIRED -- ");
						Hud.instance.lives++;
						Hud.instance.updLives();
						return;
					}
					Galagian.diffSpd += 1;	//2
					List.EnemyAdd(new TShieldShip(0, -50));
					List.EnemyAdd(new TShieldShip(80, -50));
					List.EnemyAdd(new TShieldShip(160, -50));
					List.EnemyAdd(new TShieldShip(240, -50));
					List.EnemyAdd(new TShieldShip(320, -50));
					List.EnemyAdd(new TShieldShip(400, -50));
					sBar(5);
					sCru(5);
					sKam(8);
					sFla(1);
					break;
				case(27):
					if (Hud.instance.messer == 0) {
						Weapon.instance.weaplev++;
						txter = Weapon.instance.weaplev < 14 ? "\n -- WEAPON LEVEL UPGRADED --" : "";
						Hud.instance.setMes("Wave: " + noer + "\n Introducing Rocketers \n" + txter);
						return;
					}
					Galagian.diffSpd -= 1;	//
					sRoc(2);
					sShi(2);
					sFla(4);
					sPar(5);
					break;
				case(28):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Wave: " + noer);
						return;
					}
					sRoc(4);
					List.EnemyAdd(new TShieldShip(0, -50));
					List.EnemyAdd(new TShieldShip(80, -50));
					List.EnemyAdd(new TShieldShip(160, -50));
					List.EnemyAdd(new TShieldShip(240, -50));
					List.EnemyAdd(new TShieldShip(320, -50));
					List.EnemyAdd(new TShieldShip(400, -50));
					sBar(3);
					break;
				case(29):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Wave: " + noer + "\n Challenge no. " + chler);
						chl++;
						return;
					}
					Galagian.diffSpd += 1;	//2
					Galagian.diffHp += 2;	//3
					sRoc(3);
					sKam(40);
					break;
				case(30):
					if (Hud.instance.messer == 0) {
						Weapon.instance.weaplev++;
						txter = Weapon.instance.weaplev < 14 ? "\n -- WEAPON LEVEL UPGRADED --" : "";
						Hud.instance.setMes("Wave: " + noer + "\n" + txter);
						return;
					}
					Galagian.diffSpd -= 1;	//1
					Galagian.diffHp -= 2;	//1
					sRoc(2);
					sMin(20);
					sCru(6);
					sPar(8);
					sBar(1);
					break;
				case(31):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Wave: " + noer + "\n Introducing Mowers \n Their touch is deadly... \n\n -- EXTRA LIFE ACQUIRED -- ");
						Hud.instance.lives++;
						Hud.instance.updLives();
						return;
					}
					sFla(4);
					sMow(5);
					sFig(20);
					sCan(10);
					break;
				case(32):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Wave: " + noer + "\n Challenge no. " + chler);
						chl++;
						return;
					}
					Galagian.diffHp += 2;	//3
					sMow(15);
					break;
				case(33):
					if (Hud.instance.messer == 0) {
						Weapon.instance.weaplev++;
						txter = Weapon.instance.weaplev < 14 ? "\n -- WEAPON LEVEL UPGRADED --" : "";
						Hud.instance.setMes("Wave: " + noer + "\n" + txter);
						return;
					}
					Galagian.diffHp -= 2;	//1
					sMow(5);
					sFig(10);
					List.EnemyAdd(new TShieldShip(0, -50));
					List.EnemyAdd(new TShieldShip(80, -50));
					List.EnemyAdd(new TShieldShip(160, -50));
					List.EnemyAdd(new TShieldShip(240, -50));
					List.EnemyAdd(new TShieldShip(320, -50));
					List.EnemyAdd(new TShieldShip(400, -50));
					sFla(4);
					sRoc(1);
					break;
				case(34):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Wave: " + noer + "\n Challenge no. 10");
						return;
					}
					Galagian.diffHp += 3;	//4
					Galagian.diffSpd += 1;	//2
					sMow(1);
					sFla(4);
					sRoc(2);
					break;
				case(35):
					if (Hud.instance.messer == 0) {
						Weapon.instance.weaplev++;
						txter = Weapon.instance.weaplev < 14 ? "\n -- WEAPON LEVEL UPGRADED --" : "";
						Hud.instance.setMes("Wave: " + noer + "\n" + txter);
						return;
					}
					Galagian.diffHp -= 3;		//1
					Galagian.diffSpd -= 1;		//1
					sPar(20);
					sKam(30);
					sRoc(2);
					break;
				case(36):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Wave: " + noer + " \n Challenge no. " + chler + "\n \n Introducing Core \n He is your utter demise \n\n -- EXTRA LIFE ACQUIRED -- ");
						chl++;
						Hud.instance.lives++;
						Hud.instance.updLives();
						return;
					}
					Galagian.diffHp += 4; 	//5
					Galagian.diffAtk += 1;	//2
					sCor(1);
					break;
				case(37):
					if (Hud.instance.messer == 0) {
						Weapon.instance.weaplev++;
						txter = Weapon.instance.weaplev < 14 ? "\n -- WEAPON LEVEL UPGRADED --" : "";
						Hud.instance.setMes("Wave: " + noer + " \n Challenge no. " + chler + " \n" + txter);
						chl++;
						return;
					}
					
					sCor(1);
					sMow(10);
					sCan(10);
					sPar(8);
					break;
				case(38):
					if (Hud.instance.messer == 0) {
						Weapon.instance.weaplev++;
						txter = Weapon.instance.weaplev < 14 ? "\n -- WEAPON LEVEL UPGRADED --" : "";
						Hud.instance.setMes("Wave: " + noer + "\n Challenge no. " + chler + " \n" + txter);
						chl++;
						return;
					}
					Galagian.diffHp -= 1;	//1
					Galagian.diffAtk += 0.5;	//1.5
					List.EnemyAdd(new TCore(100, -100));
					List.EnemyAdd(new TCore(150, -100));
					List.EnemyAdd(new TCore(200, -100));
					List.EnemyAdd(new TCore(250, -100));
					List.EnemyAdd(new TCore(300, -100));
					List.EnemyAdd(new TCore(350, -100));
					break;
				case(39):
					if (Hud.instance.messer == 0) {
						Weapon.instance.weaplev++;
						txter = Weapon.instance.weaplev < 14 ? "\n -- WEAPON LEVEL UPGRADED --" : "";
						Hud.instance.setMes("Wave: " + noer + " \n Challenge no. " + chler + " \n" + txter);
						chl++;
						return;
					}
					Galagian.diffAtk -= 0.5;	//1
					Galagian.diffHp += 3;	//4
					sFig(20);
					sCru(5);
					sPar(5);
					sRoc(2);
					sMow(5);
					sCan(10);
					sFla(1);
					break;
				case(40):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Wave: " + noer + " \n Challenge no. " + chler + " ");
						chl++;
						return;
					}
					Galagian.diffHp -= 2;	//2
					sPar(40);
					sRoc(10);
					sCru(20);
					break;
				case(41):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Wave: " + noer + "\n Challenge no. " + chler + " \n\n -- EXTRA LIFE ACQUIRED -- ");
						chl++;
						Hud.instance.lives++;
						Hud.instance.updLives();
						return;
					}
					Galagian.diffHp += 3;	//5
					Galagian.diffAtk += 3;	//4
					sCor(1);
					sShi(2);
					break;
				case(42):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Wave: " + noer + " \n Challenge no. " + chler);
						chl++;
						return;
					}
					Galagian.diffHp += 10;	//15
					Galagian.diffAtk -= 1;	//3
					sFig(20);
					sKam(20);
					sBoa(10);
					break;
				case(43):
					if (Hud.instance.messer == 0) {
						Hud.instance.setMes("Congratulations! You have completed all the waves! \n Now proceed to conquer your enemies which are \n Twice as fast \n Twice as strong \n Twice as angry \n\n Good Luck!");
						return;
					}
					Galagian.diffHp -= 14;
					Galagian.diffAtk -= 2;
					Galagian.diffAtk *= 2;
					Galagian.diffHp *= 2;
					Galagian.diffSpd *= 2;
					break
			}
		}

		public static function sFig(am:uint):void {
			for (var i:uint = 0; i < am; i++) {
				List.EnemyAdd(new TFighter(25 + Math.random() * 450, -30))
			}
		}

		public static function sBoa(am:uint):void {
			for (var i:uint = 0; i < am; i++) {
				List.EnemyAdd(new TBoarder(25 + Math.random() * 450, -30))
			}
		}

		public static function sCan(am:uint):void {
			for (var i:uint = 0; i < am; i++) {
				List.EnemyAdd(new TCannon(25 + Math.random() * 450, -30))
			}
		}

		public static function sMin(am:uint):void {
			for (var i:uint = 0; i < am; i++) {
				List.EnemyAdd(new TMine(25 + Math.random() * 450, -30))
			}
		}

		public static function sKam(am:uint):void {
			for (var i:uint = 0; i < am; i++) {
				List.EnemyAdd(new TKamikaze(25 + Math.random() * 450, -30))
			}
		}

		public static function sCor(am:uint):void {
			for (var i:uint = 0; i < am; i++) {
				List.EnemyAdd(new TCore(200, -140))
			}
		}

		public static function sBar(am:uint):void {
			for (var i:uint = 0; i < am; i++) {
				List.EnemyAdd(new TBarrier(25 + Math.random() * 400, -30))
			}
		}

		public static function sCru(am:uint):void {
			for (var i:uint = 0; i < am; i++) {
				List.EnemyAdd(new TCruiser(25 + Math.random() * 450, -40))
			}
		}

		public static function sFla(am:uint):void {
			for (var i:uint = 0; i < am; i++) {
				List.EnemyAdd(new TFlamer(25 + Math.random() * 450, -30))
			}
		}

		public static function sMow(am:uint):void {
			for (var i:uint = 0; i < am; i++) {
				List.EnemyAdd(new TMower(25 + Math.random() * 450, -30))
			}
		}

		public static function sPar(am:uint):void {
			for (var i:uint = 0; i < am; i++) {
				List.EnemyAdd(new TParafighter(25 + Math.random() * 450, -30))
			}
		}

		public static function sRoc(am:uint):void {
			for (var i:uint = 0; i < am; i++) {
				List.EnemyAdd(new TRocketer(25 + Math.random() * 450, -60))
			}
		}

		public static function sShi(am:uint):void {
			for (var i:uint = 0; i < am; i++) {
				List.EnemyAdd(new TShieldShip(25 + Math.random() * 350, -50))
			}
		}
	}
}