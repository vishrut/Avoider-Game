package 
{
	import flash.display.MovieClip;
	/*import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import flash.events.*;*/
	
	/**
	 * This is the main Contoller Class. It creates Menu Secreen, 
	 *  redirects to Play Screen and if game finishes dislays Game Over Screen.
	 * @author: Ankita Mehta
	 */
	 
	public class DocumentClass extends MovieClip 
	{
		public var playScreen:AvoiderGame;
		public var menuScreen:MenuScreen;
		public var gameOverScreen:GameOverScreen;
		/*private static var previousStageW:int;
		private static var previousStageH:int;*/
 
		public function DocumentClass() 
		{
			menuScreen = new MenuScreen();
			menuScreen.addEventListener( IntermediateEvent.START, onStartRequest );
			menuScreen.x = 0;
			menuScreen.y = 0;
			/*stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			menuScreen.width = stage.stageWidth;
			menuScreen.height = stage.stageHeight;*/
			addChild( menuScreen );
			//stage.addEventListener(Event.RESIZE, resizeHandler);
		}
				
		public function onGameOver( gameOverEvent:GameOverEvent ):void
		{
			var finalScore:Number = playScreen.getFinalScore(); 
			var finalClockTime:Number = playScreen.getGamePlayedTime();
			removeChild( playScreen );
			playScreen = null;
 			gameOverScreen = new GameOverScreen();
			gameOverScreen.addEventListener( IntermediateEvent.RESTART, onRestartRequest)
			gameOverScreen.x = 0;
			gameOverScreen.y = 0;
			gameOverScreen.setFinalScore( finalScore );
			gameOverScreen.setGamePlayedTime( finalClockTime);
			addChild( gameOverScreen );
		 
			playScreen = null;
		}
		
		public function onStartRequest( intermediateEvent:IntermediateEvent ):void
		{
			playScreen = new AvoiderGame();
			playScreen.addEventListener( GameOverEvent.DEAD, onGameOver );
			addChild( playScreen );
		 
			removeChild( menuScreen );
			menuScreen = null;
 
			/*stage.focus = playScreen;
			stage.stageFocusRect = false;*/
		}
		public function restartGame():void
		{
			playScreen = new AvoiderGame();
			playScreen.addEventListener( GameOverEvent.DEAD, onGameOver );
			playScreen.x = 0;
			playScreen.y = 0;
			addChild( playScreen );
 
			gameOverScreen = null;
		}
		
		/*private function resizeHandler(e:Event):void 
		{
			this.width = stage.stageWidth;
			this.height = stage.stageHeight;
			previousStageW = stage.stageWidth;
			previousStageH = stage.stageHeight;
		}
		*/
		public function onRestartRequest(intermediateEvent:IntermediateEvent):void
		{
			restartGame();
		}
		
		
	}
}
