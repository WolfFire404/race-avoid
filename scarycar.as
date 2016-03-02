package  {
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.display.*;
	
	public class scarycar extends MovieClip  {

		var snelheid : int = 800;
		var carcoolcar : supercar = null;
	
		function init(e:Event):void
		{
			stage.addEventListener(Event.ENTER_FRAME, move, false, 0, true);
		}
	
		function move(e:Event):void
		{
			if(carcoolcar.crashed == false)
				this.y += snelheid / stage.frameRate;
			
			if(this.y > stage.stageHeight + this.height / 2 + 2)
			{
				stage.removeEventListener(Event.ENTER_FRAME, move);
				this.parent.removeChild(this);		
			}
			
			if(this.hitTestObject(carcoolcar))
			{
				carcoolcar.Crashed();
				stage.removeEventListener(Event.ENTER_FRAME, move);
				this.parent.removeChild(this);
			}
		}
	
		public function scarycar(xpos:int, car:supercar) 
		{
			carcoolcar = car;
			this.x = xpos;
			addEventListener(Event.ADDED_TO_STAGE, init, false, 0, true);
		}

	}
	
}
