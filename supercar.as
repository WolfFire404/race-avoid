package  {
	import flash.display.MovieClip;
	import flash.ui.Keyboard;
	import flash.events.*;
		
	public class supercar extends MovieClip {

		var snelheid: int = 200;
		var directie: int = 0;
		
		function ingedrukt(event:KeyboardEvent):void
		{
			//Beweeg naar links
			if(event.keyCode == Keyboard.LEFT) directie = -1;
			//Beweeg naar links
			if(event.keyCode == Keyboard.RIGHT) directie = 1;
			
			trace(directie);
		}
		
		function nietingedrukt(event:KeyboardEvent):void
		{
			if(event.keyCode == Keyboard.LEFT || event.keyCode == Keyboard.RIGHT) directie = 0;
		}
		
		function init(e:Event):void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, ingedrukt);
			stage.addEventListener(KeyboardEvent.KEY_UP, nietingedrukt);
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		function loop (e:Event):void
		{
			this.x += directie * snelheid / stage.frameRate;
			trace(this.x);		
			}
		
		public function supercar() 
		{
			addEventListener(Event.ADDED_TO_STAGE, init);
			
		}

	}
	
}
