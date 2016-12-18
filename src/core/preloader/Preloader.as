package core.preloader {
	import core.S;

	import flash.display.Bitmap;

	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	import flash.utils.getDefinitionByName;

	

	import net.retrocade.retrocamel.core.RetrocamelCore;
	import net.retrocade.retrocamel.core.RetrocamelDisplayManager;
	import net.retrocade.retrocamel.core.RetrocamelInputManager;
	import net.retrocade.retrocamel.display.layers.RetrocamelLayerFlashSprite;

	public dynamic class Preloader extends MovieClip {
		public var app:IGalagian;
		[Embed(source="../../../src.font/font.ttf", fontFamily="Fonter", embedAsCFF="false")]
		private var Fonter:Class;
		[Embed(source="../../../src.assets/gfx/preloader/Preloader.jpg")]
		private var GLOGO:Class;
		[Embed(source="../../../src.assets/gfx/preloader/PreloadingBar.png")]
		private var gbar:Class;
		[Embed(source="../../../src.assets/gfx/preloader/PressHereToStart.png")]
		private var gtxt:Class;
		public var logo:Bitmap;
		public static var gfx:Sprite = new Sprite;
		public var loaded:Boolean = false;
		public var bar:Bitmap;
		public var barm:Sprite = new Sprite;
		public var texter:Sprite = new Sprite;
		public var logo1:Sprite = new Sprite;
		public var logo1r:Sprite = new Sprite;
		public var logo2:Sprite = new Sprite;
		public var bb:Shape = new Shape;

		public var layer:RetrocamelLayerFlashSprite;

		public function Preloader() {
			addEventListener(Event.ENTER_FRAME, onEnterFrameInit);
		}

		private function onEnterFrameInit(e:*):void{
			if (!stage){
				return;
			}
			removeEventListener(Event.ENTER_FRAME, onEnterFrameInit);

			RetrocamelCore.initFlash(stage, this, S());
			layer = new RetrocamelLayerFlashSprite();


			bb.graphics.beginFill(0);
			bb.graphics.drawRect(0, 0, 500, 550);
			bb.graphics.endFill();
			layer.addChild(bb);
			layer.addChild(gfx);
			//gfx.visible=false


			var recter:Sprite = new Sprite;
			recter.graphics.beginFill(0x000000);
			recter.graphics.drawRect(0, 267, 500, 103);
			recter.graphics.endFill();

			var txter:TextField = new TextField;
			txter.x = 0;
			txter.width = 500;
			txter.y = 267;
			txter.textColor = 0xFFFFFF;
			txter.selectable = false;
			txter.embedFonts = true;
			txter.htmlText = "<p align='center'><font face='Fonter' size='18'>Get your own customized site-locked\n" +
				"version of Galagian Now!\n" +
				"Or Play more game from Mauft.com!\n" +
				"Click to Visit!\n" +
				"opens in new window</font></p>";

			logo1r.graphics.beginFill(0xFFFFFF, 0.4);
			logo1r.graphics.drawRect(0, 374, 275, 118);
			logo1r.graphics.endFill();
			logo1r.buttonMode = true;
			logo1r.alpha = 0;
			logo1.addChild(recter);
			logo1.addChild(txter);
			logo1.visible = false;

			logo2.graphics.beginFill(0xFFFFFF, 0.4);
			logo2.graphics.drawRect(375, 373, 119, 118);
			logo2.graphics.endFill();
			logo2.buttonMode = true;
			logo2.alpha = 0;

			stop();
			var bitm:Bitmap = getBitmap(gtxt);
			bitm.y = 300;
			//gfx.visible=false
			texter.graphics.beginFill(0x000000);
			texter.graphics.drawRect(0, 267, 500, 103);
			texter.graphics.endFill();
			texter.addChild(bitm);
			texter.alpha = 0;
			bar = getBitmap(gbar);
			bar.x = 96;
			bar.y = 303;
			bar.mask = barm;
			barm.graphics.beginFill(0xFFFFFF);
			barm.graphics.drawRect(96, 303, 307, 28);
			barm.graphics.endFill();
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.showDefaultContextMenu = false;
			stage.align = StageAlign.TOP_LEFT;
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			logo = getBitmap(GLOGO);
			logo.x = 0;
			logo.y = 0;
			gfx.addChild(logo);
			gfx.addChild(bar);
			gfx.addChild(barm);
			gfx.addChild(logo1r);
			gfx.addChild(texter);
			gfx.addChild(logo1);
			gfx.addChild(logo2);

			texter.buttonMode = true;


			logo1r.addEventListener(MouseEvent.MOUSE_OVER, log1On);
			logo1r.addEventListener(MouseEvent.MOUSE_OUT, log1Off);
			logo1r.addEventListener(MouseEvent.CLICK, log1Click);

			logo2.addEventListener(MouseEvent.MOUSE_OVER, log2On);
			logo2.addEventListener(MouseEvent.MOUSE_OUT, log2Off);
			logo2.addEventListener(MouseEvent.CLICK, log2Click);

			texter.addEventListener(MouseEvent.CLICK, clickman2);

			initKeyboardShortcuts();
		}


		private static function initKeyboardShortcuts():void {
			RetrocamelInputManager.keyDownSignal.add(function (keyCode:int):void {
				switch (keyCode) {
					case(Keyboard.F4):
						if (RetrocamelDisplayManager.scaleToFit && RetrocamelDisplayManager.scaleToInteger) {
							RetrocamelDisplayManager.scaleToFit = false;
							RetrocamelDisplayManager.scaleToInteger = false;

						} else if (RetrocamelDisplayManager.scaleToFit && !RetrocamelDisplayManager.scaleToInteger) {
							RetrocamelDisplayManager.scaleToFit = true;
							RetrocamelDisplayManager.scaleToInteger = true;

						} else {
							RetrocamelDisplayManager.scaleToFit = true;
							RetrocamelDisplayManager.scaleToInteger = false;
						}
						break;
					case(Keyboard.F11):
						RetrocamelDisplayManager.toggleFullScreen();
						break;
				}
			});
		}

		public function log1On(e:MouseEvent):void {
			logo1r.alpha = 1
		}

		public function log1Off(e:MouseEvent):void {
			logo1r.alpha = 0
		}

		public function log1Click(e:MouseEvent):void {
			openWindow("http://retrocade.net", "_blank")
		}

		public function log2On(e:MouseEvent):void {
			logo2.alpha = 1
		}

		public function log2Off(e:MouseEvent):void {
			logo2.alpha = 0

		}

		public function log2Click(e:MouseEvent):void {
			openWindow("http://http://kowalczyk.mauft.com/", "_blank")
		}

		public function clickman2(e:MouseEvent):void {
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			layer.removeChild(gfx);
			layer.removeChild(bb);
			layer.removeLayer();
			layer = null;
			
			nextFrame();
			texter.removeEventListener(MouseEvent.CLICK, clickman2);
			
			var mainClass:Class = Class(getDefinitionByName("core.Galagian"));

			if (mainClass) {
				app = new mainClass();
				stage.addEventListener(KeyboardEvent.KEY_DOWN, app.keyDownHandler);
				stage.addEventListener(KeyboardEvent.KEY_UP, app.keyUpHandler);
				stage.addEventListener(MouseEvent.MOUSE_DOWN, app.weapon.mouseDownHandler);
				stage.addEventListener(MouseEvent.MOUSE_UP, app.weapon.mouseUpHandler);
				stage.addEventListener(MouseEvent.CLICK, app.hud.clickHandler);
				stage.addEventListener(MouseEvent.CLICK, app.mouseClickHandler)
			}
		}

		public function onEnterFrame(event:Event):void {
			if (gfx.alpha < 1) {
				gfx.alpha += 0.04;
				if (gfx.alpha >= 1) {
					gfx.alpha = 1;
					gfx.visible = true;
					loaded = true
				}
			}
			if (framesLoaded >= totalFrames || root.loaderInfo.bytesLoaded >= root.loaderInfo.bytesTotal - 10 || loaded) {
				if (loaded == false) {
					init()
				}
				texter.alpha += 0.1
			} else {
				var percent:Number = root.loaderInfo.bytesLoaded / root.loaderInfo.bytesTotal;
				if (percent >= 0.99) {
					init();
					texter.alpha += 0.1
				}
				barm.x = -307 + 307 * percent
			}
		}

		private function init():void {
			loaded = true;
			texter.alpha += 0.1
		}

		public static function openWindow(url:String, _window:String):void {
			navigateToURL(new URLRequest(url), _window);

		}
	}
} 