package  {
	import flash.display.MovieClip;
	import flash.ui.Keyboard;
	import flash.events.*;
	import flash.utils.Timer;
		
	public class supercar extends MovieClip {

		public var crashed:Boolean = false;
		public var ended:Boolean = false;
	
		var snelheid: int = 150;
		var directie: int = 0;
		var directieY: int = 0;
		var min: int = 0;
		var max: int = 0;
		
		function ingedrukt(event:KeyboardEvent):void
		{
			//Beweeg naar links
			if(event.keyCode == Keyboard.LEFT) directie = -1;
			//Beweeg naar links
			if(event.keyCode == Keyboard.RIGHT) directie = 1;
			//Beweeg naar voren
			if(event.keyCode == Keyboard.UP) directieY = -1;
			//Beweeg naar voren
			if(event.keyCode == Keyboard.DOWN) directieY = 1;
		}
		
		
		function nietingedrukt(event:KeyboardEvent):void
		{
			if(event.keyCode == Keyboard.LEFT || event.keyCode == Keyboard.RIGHT) directie = 0;
			if(event.keyCode == Keyboard.UP || event.keyCode == Keyboard.DOWN) directieY = 0;
		}
		
		function init(e:Event):void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, ingedrukt);
			stage.addEventListener(KeyboardEvent.KEY_UP, nietingedrukt);
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		public function Remove()
		{
			ended = true;
			stage.removeEventListener(Event.ENTER_FRAME, loop);
			this.parent.removeChild(this)
		}
		
		function loop (e:Event):void
		{
			if(crashed == false)
			{
				this.x += directie * snelheid / stage.frameRate;
				this.y += directieY * snelheid / stage.frameRate;
			}
			
			//De auto mag niet buiten de witte lijnen 
			if(this.x < min)
				this.x = min;
			
			if(this.x > max)
				this.x = max;
				
			if(this.y > stage.stageHeight - 100)
				this.y = stage.stageHeight - 100;
			
			if(this.y < 200)
				this.y = 200;
			
		}
		
		var timer:Timer = null;
		public function Crashed() : void
		{
			crashed = true;
			timer = new Timer(1000,1);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, StopCrash, false, 0, true);
			timer.start();
		}
		
		function StopCrash(e:TimerEvent = null) : void
		{
			crashed = false;
			timer.removeEventListener(TimerEvent.TIMER_COMPLETE, StopCrash);
		}
		
		public function supercar(min:int, max:int) 
		{
			addEventListener(Event.ADDED_TO_STAGE, init, false, 0, true);
			this.min = min;
			this.max = max;
		}

	}
	
}
