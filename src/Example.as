package {

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.ProgressEvent;

	import jc.library.net.imgur.Imgur;


	[SWF(backgroundColor = "0xffffff")]

	public class Example extends Sprite {

		public function Example():void {
			addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}

		protected function addedToStageHandler(event:Event = null):void  {
			removeEventListener(Event.ADDED_TO_STAGE, init);

			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			initialize();
		}

		private function initialize():void {

			// check http://imgur.com/register/api/
			var imgur:Imgur = new Imgur("YOUR_IMGUR_DEV_KEY_HERE");

			imgur.addEventListener(Event.COMPLETE, completeHandler);
			imgur.addEventListener(ProgressEvent.PROGRESS, progressHandler);


			// upload an image ...
			// (either a string or a bitmapdata instance
		    //  maybe i'll add file support later)
			// imgur.upload("http://www.domain.com/foobar.jpg");

			// deletes an image
			// imgur.destroy("image.delete_hash");

			// returns an image gallery
			imgur.gallery();
		}

		protected function completeHandler(event:Event):void {
			var imgur:Imgur = event.currentTarget as Imgur;
			trace("images : ", imgur.response.images);
		}

		protected function progressHandler(event:ProgressEvent):void {
			trace("progress : ", event.bytesLoaded / event.bytesTotal);
		}

	}

}