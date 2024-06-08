package android;

import flixel.graphics.frames.FlxAtlasFrames;
import flixel.graphics.FlxGraphic;
import flixel.group.FlxSpriteGroup;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.ui.FlxButton;
import flixel.FlxSprite;

class FlxHitbox extends FlxSpriteGroup {
	public var hitbox:FlxSpriteGroup;

	public var buttonLeft:FlxButton;
	public var buttonDown:FlxButton;
	public var buttonUp:FlxButton;
	public var buttonRight:FlxButton;
	public var buttonSpace:FlxButton;
	public var buttonShift:FlxButton;

	public var orgAlpha:Float = 0.75;
	public var orgAntialiasing:Bool = true;
	
	public function new(?alphaAlt:Float = 0.75, ?antialiasingAlt:Bool = true) {
		super();

		orgAlpha = alphaAlt;
		orgAntialiasing = antialiasingAlt;

		buttonLeft = new FlxButton(0, 0);
		buttonDown = new FlxButton(0, 0);
		buttonUp = new FlxButton(0, 0);
		buttonRight = new FlxButton(0, 0);
		if(ClientPrefs.hitBoxSpace)
		buttonSpace = new FlxButton(0, 0);

		if(ClientPrefs.hitBoxShift)
        buttonShift = new FlxButton(0, 0); 

		hitbox = new FlxSpriteGroup();
		// this is just for the space button
		if(!ClientPrefs.hitBoxShift && ClientPrefs.hitBoxSpace)
			{
				if(ClientPrefs.toporbottom == 'Bottom')
					{
						hitbox.add(add(buttonLeft = createhitbox(0, 0, "left", 'MobileControls/hitbox')));
						hitbox.add(add(buttonDown = createhitbox(320, 0, "down", 'MobileControls/hitbox')));
						hitbox.add(add(buttonUp = createhitbox(640, 0, "up", 'MobileControls/hitbox')));
						hitbox.add(add(buttonRight = createhitbox(960, 0, "right", 'MobileControls/hitbox')));
						hitbox.add(add(buttonSpace = createhitbox(0, 540, "space", 'MobileControls/hitbox')));
					}else
				if(ClientPrefs.toporbottom == 'Top')
					{
						hitbox.add(add(buttonLeft = createhitbox(0, 180, "left", 'MobileControls/hitbox')));
						hitbox.add(add(buttonDown = createhitbox(320, 180, "down", 'MobileControls/hitbox')));
						hitbox.add(add(buttonUp = createhitbox(640, 180, "up", 'MobileControls/hitbox')));
						hitbox.add(add(buttonRight = createhitbox(960, 180, "right", 'MobileControls/hitbox')));
						hitbox.add(add(buttonSpace = createhitbox(0, 0, "space", 'MobileControls/hitbox')));
					}
			}

			// just the shift button
			if(ClientPrefs.hitBoxShift && !ClientPrefs.hitBoxSpace)
				{
					if(ClientPrefs.toporbottom == 'Bottom')
						{
							hitbox.add(add(buttonLeft = createhitbox(0, 0, "left", 'MobileControls/hitboxSHIFT')));
							hitbox.add(add(buttonDown = createhitbox(320, 0, "down", 'MobileControls/hitboxSHIFT')));
							hitbox.add(add(buttonUp = createhitbox(640, 0, "up", 'MobileControls/hitboxSHIFT')));
							hitbox.add(add(buttonRight = createhitbox(960, 0, "right", 'MobileControls/hitboxSHIFT')));
							hitbox.add(add(buttonShift = createhitbox(0, 540, "shift", 'MobileControls/hitboxSHIFT')));
						}else
					if(ClientPrefs.toporbottom == 'Top')
						{
							hitbox.add(add(buttonLeft = createhitbox(0, 180, "left", 'MobileControls/hitboxSHIFT')));
							hitbox.add(add(buttonDown = createhitbox(320, 180, "down", 'MobileControls/hitboxSHIFT')));
							hitbox.add(add(buttonUp = createhitbox(640, 180, "up", 'MobileControls/hitboxSHIFT')));
							hitbox.add(add(buttonRight = createhitbox(960, 180, "right", 'MobileControls/hitboxSHIFT')));
							hitbox.add(add(buttonShift = createhitbox(0, 0, "space", 'MobileControls/hitboxSHIFT')));
						}
				}

				// both of them, the shift and space 

				if(ClientPrefs.hitBoxShift && ClientPrefs.hitBoxSpace)
					{
						if(ClientPrefs.toporbottom == 'Bottom')
							{
								if(ClientPrefs.spacePosition  == 'Left')
										{
											hitbox.add(add(buttonLeft = createhitbox(0, 0, "left", 'MobileControls/ShiftHitbox')));
										   hitbox.add(add(buttonDown = createhitbox(320, 0, "down", 'MobileControls/ShiftHitbox')));
										   hitbox.add(add(buttonUp = createhitbox(640, 0, "up", 'MobileControls/ShiftHitbox')));
										   hitbox.add(add(buttonRight = createhitbox(960, 0, "right", 'MobileControls/ShiftHitbox')));
										   hitbox.add(add(buttonSpace = createhitbox(0, 540, "space", 'MobileControls/ShiftHitbox')));
										   hitbox.add(add(buttonShift = createhitbox(640, 540, "shift", 'MobileControls/ShiftHitbox')));
										}else
									if(ClientPrefs.spacePosition  == 'Right')
										{
											hitbox.add(add(buttonLeft = createhitbox(0, 0, "left", 'MobileControls/ShiftHitbox')));
											hitbox.add(add(buttonDown = createhitbox(320, 0, "down", 'MobileControls/ShiftHitbox')));
											hitbox.add(add(buttonUp = createhitbox(640, 0, "up", 'MobileControls/ShiftHitbox')));
											hitbox.add(add(buttonRight = createhitbox(960, 0, "right", 'MobileControls/ShiftHitbox')));
											hitbox.add(add(buttonSpace = createhitbox(640, 540, "space", 'MobileControls/ShiftHitbox')));
											hitbox.add(add(buttonShift = createhitbox(0, 540, "shift", 'MobileControls/ShiftHitbox')));
										}
							}else
							if(ClientPrefs.toporbottom == 'Top')
								{
									if(ClientPrefs.spacePosition  == 'Left')
										{
											hitbox.add(add(buttonLeft = createhitbox(0, 180, "left", 'MobileControls/ShiftHitbox')));
										   hitbox.add(add(buttonDown = createhitbox(320, 180, "down", 'MobileControls/ShiftHitbox')));
										   hitbox.add(add(buttonUp = createhitbox(640, 180, "up", 'MobileControls/ShiftHitbox')));
										   hitbox.add(add(buttonRight = createhitbox(960, 180, "right", 'MobileControls/ShiftHitbox')));
										   hitbox.add(add(buttonSpace = createhitbox(0, 0, "space", 'MobileControls/ShiftHitbox')));
										   hitbox.add(add(buttonShift = createhitbox(640, 0, "shift", 'MobileControls/ShiftHitbox')));
										}else
									if(ClientPrefs.spacePosition  == 'Right')
										{
											hitbox.add(add(buttonLeft = createhitbox(0, 180, "left", 'MobileControls/ShiftHitbox')));
											hitbox.add(add(buttonDown = createhitbox(320, 180, "down", 'MobileControls/ShiftHitbox')));
											hitbox.add(add(buttonUp = createhitbox(640, 180, "up", 'MobileControls/ShiftHitbox')));
											hitbox.add(add(buttonRight = createhitbox(960, 180, "right", 'MobileControls/ShiftHitbox')));
											hitbox.add(add(buttonSpace = createhitbox(640, 0, "space", 'MobileControls/ShiftHitbox')));
											hitbox.add(add(buttonShift = createhitbox(0, 0, "shift", 'MobileControls/ShiftHitbox')));
										}
								}
					}

				// this person has none of the special buttons
				if(!ClientPrefs.hitBoxSpace && !ClientPrefs.hitBoxShift)
					{
						hitbox.add(add(buttonLeft = createhitbox(0, 0, "left", 'MobileControls/hitboxnospace')));
						hitbox.add(add(buttonDown = createhitbox(320, 0, "down", 'MobileControls/hitboxnospace')));
						hitbox.add(add(buttonUp = createhitbox(640, 0, "up", 'MobileControls/hitboxnospace')));
						hitbox.add(add(buttonRight = createhitbox(960, 0, "right", 'MobileControls/hitboxnospace')));
					}
	}

	public function createhitbox(x:Float = 0, y:Float = 0, frames:String, image:String) {
		var button = new FlxButton(x, y);
		button.loadGraphic(FlxGraphic.fromFrame(getFrames(image).getByName(frames)));
		button.antialiasing = orgAntialiasing;
		button.alpha = 0;// sorry but I can't hard lock the hitbox alpha
		button.onDown.callback = function (){FlxTween.num(0, ClientPrefs.hitBoxTrans, 0.075, {ease:FlxEase.circInOut}, function(alpha:Float){ button.alpha = alpha;});};
		button.onUp.callback = function (){FlxTween.num(ClientPrefs.hitBoxTrans, 0, 0.1, {ease:FlxEase.circInOut}, function(alpha:Float){ button.alpha = alpha;});}
		button.onOut.callback = function (){FlxTween.num(button.alpha, 0, 0.2, {ease:FlxEase.circInOut}, function(alpha:Float){ button.alpha = alpha;});}
		return button;
	}

	public function getFrames(image:String):FlxAtlasFrames {
		return Paths.getSparrowAtlas(image);
	}

	override public function destroy():Void {
		super.destroy();

		buttonLeft = null;
		buttonDown = null;
		buttonUp = null;
		buttonRight = null;
	}
}
