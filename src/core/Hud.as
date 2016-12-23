package core {
	import flash.display.Bitmap;

	import other.*;
	import core.preloader.IHud;

	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;

	

	public class Hud implements IHud{
		private static var _instance:Hud = new Hud();

		public static function get instance():Hud {
			return _instance;
		}

		public var bar:Bitmap;
		public var bmask:Sprite = new Sprite;
		public var bar2:Bitmap;
		public var bmask2:Sprite = new Sprite;
		public var shield:uint = 120;
		public var lives:int = 3;
		public var points:uint = 0;
		public var gLiv:Sprite = new Sprite;
		public var gPnt:Sprite = new Sprite;
		public var gWav:Sprite = new Sprite;
		public var wavs:uint = 0;
		public var midScreenMessage:TextField = new TextField;
		public var messer:uint = 0;
		public var multiplus:uint = 70;
		public var multi:uint = 5;
		public var multig:Sprite = new Sprite;

		public function Hud() {
			midScreenMessage.embedFonts = true;
			midScreenMessage.textColor = 0xFFFFFF;
			midScreenMessage.autoSize = TextFieldAutoSize.NONE;
			midScreenMessage.wordWrap = true;
			midScreenMessage.width = 500;
			midScreenMessage.selectable = false;
			midScreenMessage.mouseEnabled = false;
			var huder:Bitmap = getBitmap(Gfx.hudBackground);
			huder.y = 500;

			multig.x = 279;
			multig.y = 529;

			bmask.graphics.beginFill(0xFFFFFF);
			bmask.graphics.drawRect(0, 0, 154, 16);
			bmask.graphics.endFill();
			bar = getBitmap(Gfx.hudBarShield);
			bar.x = 334;
			bar.y = 508;
			bar.mask = bmask;
			bmask.x = 334;
			bmask.y = 508;
			bmask2.graphics.beginFill(0xFFFFFF);
			bmask2.graphics.drawRect(0, 0, 154, 16);
			bmask2.graphics.endFill();
			bar2 = getBitmap(Gfx.hudBarMultiplier);
			bar2.x = 136;
			bar2.y = 508;
			bar2.mask = bmask2;
			bmask2.x = 135;
			bmask2.y = 508;
			Galagian.layerHud.addChild(midScreenMessage);
			Galagian.layerHud.addChild(huder);
			Galagian.layerHud.addChild(multig);
			Galagian.layerHud.addChild(gLiv);
			Galagian.layerHud.addChild(gPnt);
			Galagian.layerHud.addChild(gWav);
			Galagian.layerHud.addChild(bar);
			Galagian.layerHud.addChild(bmask);
			Galagian.layerHud.addChild(bar2);
			Galagian.layerHud.addChild(bmask2);
			updLives();
			updMult();
			updPnt();
			updWav()
		}

		public function Update():void {

			if (lives < 0 && Galagian.gameOverContainer.alpha == 0) {
				wavs = 0;
				Hud.instance.messer = 0;
				Weapon.instance.weaplev = 0;
				Galagian.layerFore.clear();
				Galagian.layerMid.clear();
				List.Effects = [];
				List.Enemies = [];
				List.Bullets = [];
				Galagian.Player = null;
				lives = 0;
				new Flasher;

				Galagian.gameOverContainer.alpha = 10

			}
			if (Galagian.shield) {
				if (shield > 0 && TPlayer.reappear == 0) {
					shield--;
					TPlayer.shield.alpha = 0.6 + Math.random();
					TPlayer.shield.visible = true
				} else {
					TPlayer.shield.visible = false
				}
			} else {
				TPlayer.shield.visible = false
			}
			if (multi > 1 && (messer == 0 || messer == 3)) {
				multiplus--;
				if (multiplus == 0) {
					multi--;
					multiplus = 160 - 30 * (multi - 2);
					updMult()
				}
			}
			bmask.x = 180 + shield * 154 / 120;
			bmask2.x = -18 + multiplus * 154 / (160 - 30 * (multi - 2));
			if (messer == 1) {
				if (midScreenMessage.alpha < 2) {
					midScreenMessage.alpha += 0.03
				}
			} else {
				if (midScreenMessage.alpha > 0) {
					midScreenMessage.alpha -= 0.15;
				} else if (midScreenMessage.alpha <= 0) {
					messer = 0
				}
			}
			if (List.Enemies.length == 0) {
				if (messer == 0) {
					multi = 5;
					multiplus = 160 - 30 * (multi - 2);
					updMult();
					wavs++;
					Waves.Give(wavs);
					updWav();
					shield = 120
				}
				if (messer == 2) {
					Waves.Give(wavs);
					messer = 3
				}
			}
		}

		public function updLives():void {
			Galagian.layerHud.removeChild(gLiv);
			gLiv = new Sprite;
			var bitm:Bitmap;
			for (var i:uint = 0; i < lives; i++) {
				bitm = getBitmap(Gfx.hudIconLife);
				bitm.x = 3 + i * 6;
				bitm.y = 503;
				gLiv.addChild(bitm)
			}
			Galagian.layerHud.addChild(gLiv)
		}

		public function updPnt():void {
			Galagian.layerHud.removeChild(gPnt);
			gPnt = new Sprite;
			var p:String = points.toString();
			while (p.length < 10) {
				p = "0" + p
			}
			var bitm:Bitmap;
			for (var i:uint = 0; i < 10; i++) {
				bitm = giveN(p.charCodeAt(i) - 48);
				bitm.x = 200 + i * 13;
				bitm.y = 10;
				gPnt.addChild(bitm)
			}
			Galagian.layerHud.addChild(gPnt)
		}

		public function updWav():void {
			Galagian.layerHud.removeChild(gWav);
			gWav = new Sprite;
			var p:String = wavs.toString();
			while (p.length < 3) {
				p = "0" + p
			}
			var bitm:Bitmap;
			for (var i:uint = 0; i < 3; i++) {
				bitm = giveN(p.charCodeAt(i) - 48);
				bitm.x = 440 + i * 13;
				bitm.y = 529;
				gWav.addChild(bitm)
			}
			Galagian.layerHud.addChild(gWav)
		}

		public function updMult():void {
			while (multig.numChildren > 0) {
				multig.removeChildAt(0)
			}
			multig.addChild(giveN(multi))
		}

		public function giveN(n:uint):Bitmap {
			switch (n) {
				case(0):
					return getBitmap(Gfx.number_0);
				case(1):
					return getBitmap(Gfx.number_1);
				case(2):
					return getBitmap(Gfx.number_2);
				case(3):
					return getBitmap(Gfx.number_3);
				case(4):
					return getBitmap(Gfx.number_4);
				case(5):
					return getBitmap(Gfx.number_5);
				case(6):
					return getBitmap(Gfx.number_6);
				case(7):
					return getBitmap(Gfx.number_7);
				case(8):
					return getBitmap(Gfx.number_8);
				case(9):
					return getBitmap(Gfx.number_9);
				default:
					return getBitmap(Gfx.number_0);
			}
		}

		public function clickHandler(event:*):void {
			if (messer == 1 && midScreenMessage.alpha > 1) {
				messer = 2;
				midScreenMessage.alpha = 1
			}
		}

		public function setMes(txt:String = ""):void {
			midScreenMessage.textColor = 0xFFFFFF;
			midScreenMessage.htmlText = "<p align='center'><font color='#FFFFFF' face='Fonter' size='20'>" + txt + "\n\n Click to continue!</font></p>";
			midScreenMessage.x = 0;
			midScreenMessage.height = 400;
			midScreenMessage.y = 180;

			midScreenMessage.alpha = 0;
			messer = 1
		}

		public function addPnt(n:uint, da:Boolean = true):void {
			if (da) {
				multiplus = 160 - 30 * (multi - 2)
			}
			if (da) {
				shield = Math.min(120, shield + (multi - 1))
			} else {
				shield = Math.min(120, shield + 2)
			}
			points += Math.ceil((n + (da == true ? Math.ceil(shield / 10) : 0)) * (da == true ? multi : 1) * (Galagian.isEasyMode == true ? 0.1 : 1));
			updPnt()
		}
	}
}