package core {
	import core.preloader.IGalagian;
	import core.preloader.IHud;
	import core.preloader.IWeapon;

	import enemies.TAsteroid;

	import flash.display.Bitmap;

	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.net.SharedObject;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;

	

	import net.retrocade.retrocamel.core.RetrocamelInputManager;

	import net.retrocade.retrocamel.display.layers.RetrocamelLayerFlashSprite;

	import other.TPlayer;
	import other.Waves;

	public class Galagian extends Sprite implements IGalagian {
		[Embed("../../src.assets/gfx/TitleScreen.png")]
		private var assetTitleScreen:Class;
		[Embed("../../src.assets/gfx/GameOver.png")]
		private var assetGameOverScreen:Class;

		public static var Player:TPlayer;
		public static var self:Galagian;
		public static var bgw:uint = 1;
		public static var backgroundContainer:Sprite = new Sprite;
		public static var layerBack:RetrocamelLayerFlashSprite;
		public static var layerMid:RetrocamelLayerFlashSprite;
		public static var layerFore:RetrocamelLayerFlashSprite;
		public static var layerShader:RetrocamelLayerFlashSprite;
		public static var layerHud:RetrocamelLayerFlashSprite;
		public static var diffSpd:Number = 1;
		public static var diffHp:Number = 1;
		public static var diffAtk:Number = 1;
		public static var shield:Boolean = false;
		public static var pauser:Sprite = new Sprite;
		public static var titleScreenBitmap:Bitmap;
		public static var gameOverContainer:Sprite = new Sprite;
		public static var gameOverInstructionsText:TextField = new TextField;
		public static var modex:Array = new Array(3);
		public static var txt3:TextField = new TextField;
		public static var isEasyMode:Boolean = false;
		public static var mousix:Boolean = true;
		public static var shade:Sprite = new Sprite;


		public function get realMouseX():Number {
			return RetrocamelInputManager.mouseX;
		}

		public function get realMouseY():Number {
			return RetrocamelInputManager.mouseY;
		}

		public function get hud():IHud {
			return Hud.instance;
		}

		public function get weapon():IWeapon {
			return Weapon.instance;
		}

		public function Galagian() {
			layerBack = new RetrocamelLayerFlashSprite();
			layerMid = new RetrocamelLayerFlashSprite();
			layerFore = new RetrocamelLayerFlashSprite();
			layerShader = new RetrocamelLayerFlashSprite();
			layerHud = new RetrocamelLayerFlashSprite();

			shade.visible = false;
			var mker:Shape = new Shape;
			mker.graphics.beginFill(0);
			mker.graphics.drawRect(0, 0, 500, 550);
			mker.graphics.endFill();
			this.mask = mker;
			modex[0] = new Sprite;
			modex[1] = new Sprite;
			modex[2] = new Sprite;
			modex[0].graphics.beginFill(0xFFFFFF, 0.4);
			modex[0].graphics.drawRect(224, 92, 112, 35);
			modex[0].graphics.endFill();
			modex[0].buttonMode = true;
			modex[1].graphics.beginFill(0xFFFFFF, 0.4);
			modex[1].graphics.drawRect(380, 92, 112, 35);
			modex[1].graphics.endFill();
			modex[1].buttonMode = true;
			modex[2].graphics.beginFill(0xFFFFFF, 0.4);
			modex[2].graphics.drawRect(66, 135, 366, 35);
			modex[2].graphics.endFill();
			modex[2].buttonMode = true;

			layerHud.addChild(modex[0]);
			layerHud.addChild(modex[1]);
			layerHud.addChild(modex[2]);

			titleScreenBitmap = getBitmap(assetTitleScreen);

			gameOverInstructionsText.embedFonts = true;
			gameOverInstructionsText.htmlText = "<p align='center'><font face='Fonter' size='16'>Scores no longer work, sorry.</font></p>";
			gameOverInstructionsText.width = 500;
			gameOverInstructionsText.height = 35;
			gameOverInstructionsText.y = 250;
			gameOverInstructionsText.textColor = 0xFFFFFF;
			gameOverInstructionsText.visible = false;
			gameOverInstructionsText.mouseEnabled = false;
			gameOverInstructionsText.selectable = false;

			txt3.background = true;
			txt3.backgroundColor = 0x111111;
			txt3.textColor = 0xFFFFFF;
			txt3.embedFonts = true;
			txt3.htmlText = "<font face='Fonter' size='20'>Close</font>";
			txt3.width = 85;
			txt3.height = 28;
			txt3.selectable = false;
			txt3.borderColor = 0xFFFFFF;
			txt3.border = true;
			txt3.x = 300;
			txt3.y = 330;

			gameOverContainer.addChild(getBitmap(assetGameOverScreen));
			gameOverContainer.addChild(gameOverInstructionsText);
			gameOverContainer.addChild(txt3);

			gameOverContainer.alpha = 0;
			blendMode = "layer";
			var backgroundTemp:Bitmap = getBitmap(Gfx.assetBackground);
			backgroundTemp.y = -1500;
			backgroundContainer.addChild(backgroundTemp);
			backgroundTemp = getBitmap(Gfx.assetBackground);
			backgroundContainer.addChild(backgroundTemp);

			pauser.graphics.beginFill(0x000000, 0.6);
			pauser.graphics.drawRect(0, 0, 500, 550);
			pauser.graphics.endFill();
			layerHud.addChild(pauser);
			pauser.alpha = 0;

			layerHud.addChild(gameOverContainer);
			layerHud.addChild(titleScreenBitmap);
			layerBack.addChild(backgroundContainer);
			layerShader.addChild(shade);
			backgroundContainer.alpha = 1;
			self = this;
			Player = new TPlayer(300, 400);
			addEventListener(Event.ENTER_FRAME, Step);
		}

		public function Step(e:Event):void {
			modex[2].graphics.drawRect(66, 135, 366, 35);
			if (titleScreenBitmap.alpha > 0) {
				if (realMouseX > 224 && realMouseX < 336 && realMouseY > 92 && realMouseY < 127) {
					modex[0].visible = true
				} else {
					modex[0].visible = false
				}
				if (realMouseX > 380 && realMouseX < 492 && realMouseY > 92 && realMouseY < 127) {
					modex[1].visible = true
				} else {
					modex[1].visible = false
				}
				if (realMouseX > 66 && realMouseX < 432 && realMouseY > 135 && realMouseY < 170) {
					modex[2].visible = true
				} else {
					modex[2].visible = false
				}
			}
			Sfx.reset();
			bgw--;
			if (bgw == 0) {
				backgroundContainer.y += 1;
				if (backgroundContainer.y > 900) {
					backgroundContainer.y -= 1500
				}
				bgw = 5
			}
			if (gameOverContainer.alpha > 1) {
				gameOverInstructionsText.visible = true;
				for (en = List.Effects.length - 1; en >= 0; en--) {
					List.Effects[en].U(en)
				}
				if (realMouseX > 300 && realMouseX < 385 && realMouseY > 330 && realMouseY < 358) {
					txt3.backgroundColor = 0x777777
				} else {
					txt3.backgroundColor = 0x111111
				}
			}
			
			if (pauser.alpha == 0 && titleScreenBitmap.alpha == 0 && gameOverContainer.alpha == 0) {
				if (Math.random() < 0.005 && List.Enemies.length > TAsteroid.howMany && Hud.instance.messer == 0) {
					List.EnemyAdd(new TAsteroid())
				}

				for (var en:int = List.Enemies.length - 1; en >= 0; en--) {
					List.Enemies[en].Update(en)
				}
				if (Player != null) {
					Player.Update(realMouseX, realMouseY)
				}
				Weapon.instance.update();
				Hud.instance.Update();

				for (en = List.Bullets.length - 1; en >= 0; en--) {
					List.Bullets[en].Update(en)
				}
				for (en = List.Effects.length - 1; en >= 0; en--) {
					List.Effects[en].U(en)
				}
			}
		}

		public function keyDownHandler(e:KeyboardEvent):void {
			if (e.keyCode == Keyboard.SPACE) {
				shield = true
			} else if (e.keyCode == Keyboard.ESCAPE) {
				if (titleScreenBitmap.alpha == 0 && gameOverContainer.alpha == 0) {
					pauser.alpha = 1 - pauser.alpha
				}
			} else if (e.keyCode == 77) {
				if (gameOverContainer.alpha == 0) {
					Sfx.musique()
				}
			} else if (e.keyCode == 83) {
				if (gameOverContainer.alpha == 0) {
					Sfx.snd = 1 - Sfx.snd
				}
			} else if (e.keyCode == 84) {
				if (mousix == false) {
					mousix = true;
					Mouse.show()
				} else {
					mousix = false;
					Mouse.hide()
				}
			}
		}

		public function keyUpHandler(e:KeyboardEvent):void {
			if (e.keyCode == Keyboard.SPACE) {
				shield = false
			}
		}

		public function mouseClickHandler(e:*):void {
			if (shade.visible) {
				return;
			}
			if (gameOverContainer.alpha > 0 && List.Effects.length == 0) {
				if (realMouseX > 300 && realMouseX < 385 && realMouseY > 330 && realMouseY < 358) {
					gameOverInstructionsText.visible = false;
					gameOverContainer.alpha = 0;
					titleScreenBitmap.alpha = 1;
					Hud.instance.lives = 3;
					Hud.instance.updLives();
					Player = new TPlayer(1000, 1000);
					Hud.instance.wavs = 1;
					Weapon.instance.weaplev = 0;

					diffHp = 1;
					diffAtk = 1;
					diffSpd = 1
				}
			}
			if (titleScreenBitmap.alpha == 0) {
				return;
			}
			if (realMouseX > 224 && realMouseX < 336 && realMouseY > 92 && realMouseY < 127) {
				titleScreenBitmap.alpha = 0;
				Galagian.diffHp = 0.4;
				Galagian.diffAtk = 0.6;
				Weapon.instance.weaplev = 1;
				Waves.chl = 1;
				Hud.instance.points = 0;
				Hud.instance.updPnt();
				isEasyMode = true
			}
			if (realMouseX > 380 && realMouseX < 492 && realMouseY > 92 && realMouseY < 127) {
				titleScreenBitmap.alpha = 0;
				Galagian.diffHp = 1;
				Galagian.diffAtk = 1;
				Weapon.instance.weaplev = 0;
				Waves.chl = 1;
				Hud.instance.points = 0;
				Hud.instance.updPnt();
				isEasyMode = false
			}
			if (realMouseX > 66 && realMouseX < 432 && realMouseY > 135 && realMouseY < 170) {
				var so:SharedObject = SharedObject.getLocal("Galagian_Data");
				if (so.data.wav > 0) {
					titleScreenBitmap.alpha = 0;
					Galagian.diffHp = so.data.dH;
					Galagian.diffAtk = so.data.dA;
					Galagian.diffSpd = so.data.dS;
					Hud.instance.wavs = so.data.wav;
					Weapon.instance.weaplev = so.data.wea;
					Waves.chl = so.data.chl;
					Galagian.isEasyMode = so.data.e;
					Waves.chl = 1;
					Hud.instance.points = 0;
					Hud.instance.messer = 0;
					Hud.instance.updPnt()
				} else {
					titleScreenBitmap.alpha = 0;
					Galagian.diffHp = 1;
					Galagian.diffAtk = 1;
					Weapon.instance.weaplev = 0;
					Waves.chl = 1;
					Hud.instance.points = 0;
					Hud.instance.updPnt()
				}
			}
			modex[0].visible = false;
			modex[1].visible = false;
			modex[2].visible = false
		}
	}

}