package
{
	import DBMgr.DBMgr;
	import DBMgr.NewClass3;
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
			var obj:NewClass = new NewClass();
			var obj1:DBMgr = new DBMgr();
			var obj2:NewClass3 = new NewClass3();
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			trace("OK");
			var request:URLRequest = new URLRequest("demo.swf");
			var context:LoaderContext = new LoaderContext(false, ApplicationDomain.currentDomain);
			//loader.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS, ResourceHttpStatusHandler);
			//loader.contentLoaderInfo.addEventListener(Event.INIT, ResourceInitHandler);
			//loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ResourceIoErrorHandler);
			//loader.contentLoaderInfo.addEventListener(Event.OPEN, ResourceOpenHandler);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, CompleteHandler);
			//loader.load(request, context);
		}
		
		public function CompleteHandler(e:Event):void
		{
			trace("CompleteHandler");
			var mc:MovieClip = e.currentTarget.content as MovieClip;
			trace(mc.numChildren);
			var cls:Class = loader.contentLoaderInfo.applicationDomain.getDefinition("MC1") as Class;
			if (cls!=null) 
			{
				trace("OK");
				var obj1:DisplayObject = new cls();
				if (obj1!=null) 
				{
					trace("OK");
					obj1.x = 100;
					obj1.y = 100;
					this.addChild(obj1);
				}
			}
		}
		
		public function ResourceHttpStatusHandler(event:HTTPStatusEvent):void
		{
			trace("ResourceHttpStatusHandler: " + event.toString());
			var mc1:MovieClip = this.getChildByName("mc1") as MovieClip;
			if (mc1 != null)
			{
				trace("OK");
			}
		}
		
		public function ResourceInitHandler(event:Event):void
		{
		/*
		   trace('ResourceInitHandler Success');
		
		   var info:LoaderInfo = event.currentTarget as LoaderInfo;
		   if(info == null)
		   {
		   m_iTry++;
		   if(m_iTry < 3)
		   {
		   RemoveListeners(m_resourceLoader.contentLoaderInfo);
		   LoadGameControll();//try again
		   }
		   else
		   {
		   m_iTry = 0;
		   FatalError("Load Main Error");
		   }
		   return;
		   }
		   m_iTry = 0;
		
		   addChild(m_resourceLoader);
		 */
		}
		
		public function ResourceIoErrorHandler(event:IOErrorEvent):void
		{
		/*
		   RemoveListeners(m_resourceLoader.contentLoaderInfo);
		   m_resourceLoader = null;
		   trace('ResourceIoErrorHandler:' + event.toString());
		 */
		}
		
		public function ResourceOpenHandler(event:Event):void
		{
			trace("ResourceOpenHandler: " + event.toString());
		}
	}
}