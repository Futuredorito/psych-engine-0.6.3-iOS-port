package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

class CrashState extends MusicBeatState
{
	override function create()
	{
		super.create();

		var bg = new FlxSprite().loadGraphic(Paths.image('crash'));
		add(bg);

		var errorMessage:FlxText = new FlxText(12, FlxG.height - 44, 0, SUtil.errMsg, 12);
		errorMessage.scrollFactor.set();
		errorMessage.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		errorMessage.antialiasing = ClientPrefs.globalAntialiasing;
		add(errorMessage);

	}

	override function update(elapsed:Float)
	{
		
		super.update(elapsed);
	}
}
