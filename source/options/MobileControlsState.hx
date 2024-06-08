package options;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;

using StringTools;

class MobileControlsState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Customize Mobile Controls';
		rpcTitle = 'Customize Mobile Controls'; //for Discord Rich Presence

		var option:Option = new Option('Mobile Controls Menu',
			"brings you to the menu when clicked",
			'toolazytocodesomethinginsohereisatrashway',
			'nonexistent',
			true);
		addOption(option);
		option.onChange = goNOW;

		var option:Option = new Option('Hitbox Alpha',
			'Changes the transparency when Hitbox is pressed.',
			'hitBoxTrans',
			'percent',
			0);
		option.scrollSpeed = 1.6;
		option.minValue = 0.0;
		option.maxValue = 1;
		option.changeValue = 0.01;
		option.decimals = 2;
		addOption(option);

		var option:Option = new Option('Hitbox Space',
			'If checked, Space button will appear! (hitbox only)',
			'hitBoxSpace',
			'Bool',
			true);
		addOption(option);

		var option:Option = new Option('Hitbox Shift',
			'If checked, Shift button will appear! (hitbox only)',
			'hitBoxShift',
			'Bool',
			true);
		addOption(option);

		var option:Option = new Option('Space + Shift location',
			"space + shift appears on the side you want",
			'toporbottom',
			'string',
			'Bottom',
			['Bottom', 'Top']);
		addOption(option);

		var option:Option = new Option('Space + Shift X',
			"where do you want the space button",
			'spacePosition',
			'string',
			'Bottom',
			['Left', 'Right']);
		addOption(option);

		super();
	}

	override function destroy()
	{
		super.destroy();
	}

	function goNOW()
	{
		MusicBeatState.switchState(new android.AndroidControlsMenu());
	}
}
