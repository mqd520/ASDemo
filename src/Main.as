package
{
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	
	/**
	 * ...
	 * @author
	 */
	public class Main extends Sprite
	{
		private var loader:Loader = new Loader();
		
		public function Main()
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			//动态加载资源
			//var request:URLRequest = new URLRequest("demo1.swf");
			//var context:LoaderContext = new LoaderContext(false, ApplicationDomain.currentDomain);
			//loader.contentLoaderInfo.addEventListener(Event.COMPLETE, CompleteHandler);
			//loader.load(request, context);
			
			//静态加载资源
			var mc:CLASS2 = new CLASS2();
			if (mc!=null) 
			{
				mc.x = 100;
				mc.y = 100;
				this.addChild(mc);
			}
		}
		
		public function CompleteHandler(e:Event):void
		{
			var mc:MovieClip = e.currentTarget.content as MovieClip;
			var cls:Class = loader.contentLoaderInfo.applicationDomain.getDefinition("CLASS1") as Class;
			if (cls!=null) 
			{
				var obj1:DisplayObject = new cls();
				if (obj1!=null) 
				{
					obj1.x = 100;
					obj1.y = 100;
					this.addChild(obj1);
				}
			}
		}
	}
}