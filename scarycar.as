package  {
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.display.*;
	
	public class scarycar extends MovieClip  {

		var snelheid : int = 300;
		var carcoolcar : supercar = null;
	
		function init(e:Event):void
		{
			stage.addEventListener(Event.ENTER_FRAME, move);
		}
	
		function move(e:Event):void
		{
			this.y += snelheid / stage.frameRate;
			
			if(this.y > stage.stageHeight + this.height / 2 + 2)
			{
				stage.removeEventListener(Event.ENTER_FRAME, move);
				this.parent.removeChild(this);		
			}
			
			if(this.hitTestObject(car))
			{
				car.Crashed();
			}
		}
	
		public function scarycar(xpos:int, car:supercar) 
		{
			carcoolcar = car;
			this.x = xpos;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}

	}
	
}
