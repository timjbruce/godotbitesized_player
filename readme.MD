# Godot Bite Sized Player - 2D

This repo represents the Godot Bite Sized Player - 2D. What is a Bite Sized Player - 2D, you might ask? The answer is in two parts. First, it's the player object that is being created under my (Godot Bite Sized content series)[https://github.com/timjbruce/godotbitesized]. In this series, I take a 5-10 lesson and make something concrete for developers to follow along / learn about Godot. Second, it is the 2D Player object that will be used in games that I create. It will be a component that can be copies (or used as a plug-in, I'm not dropping that goal!) in a 2D game and offer capabilities to get game developers started. A working game, no matter how small the increment, is the goal!

## Table of Contents

[Build 1](#build-1) - Start the Character

[Build 2](#build-2) - Add physics via an initialize script

[Build 3](#build-3) - Adding a feature to use this component for Players, NPCs, and Enemies

[Build 4](#build-4) - Adding movement to NPCs and Enemies

## Build 1

For Build 1, we're going to form the _very_ basic Player for a game. For 2D Games, this means a 2D Scene with an image that can move in different directions. For 2D games in Godot, we should use (CharacterBody2D)[https://docs.godotengine.org/en/stable/classes/class_characterbody2d.html] as the base object. This gives us a bunch of capabilities, like handling physics so it can move. Your end project will look something like this when you look at the file browser:

![The final file browser will have the Player folder and all the assets for it located there.](readmeassets/build_1/1_final_file_browser.png)

I've already started a new project, called Player. The first thing I'm going to do is create a new folder called "Player" in the file system. This sub folder gives me the ability to easily move components from one project to another and keeps objects from name conflicts. When I move this component into another game, I'll create a "Player" folder in that game and copy the objects from my "Player" folder there. Now, I probably wouldn't have 2 objects named "Player" in a game, but I might have two objects with the same name sometime in a complex game. 

Great, so the "Player" folder is there, now lets start creating the "Player" itself! Right click on the "Player" folder, select "Create New" and "Scene." This will open the new scene dialog. Change the Root Type to "CharacterBody2D," enter the Scene Name as "Player" and click "OK." This will create an empty scene with the CharacterBody2D as the base object.

![Filled out New Scene dialog box for the player](readmeassets/build_1/1_create_player.png)

You'll notice in the Scene window that there is a yellow triangle that is warning you that there is no shape added to the CharacterBody2D to deal with collisions. By the end of this session, we'll have that addressed.

![Initial Godot scene window showing a warning about collision shapes](readmeassets/build_1/1_scene_start.png)

Let's go ahead and add a few other Godot Nodes to our Player. Specifically, we're going to add AnimatedSprite2D, to play animations, CollisionShape2D, to detect collisions, Label, to display some text, and Camera2D, to follow the player around when our game world is bigger than our window. Right click on the Player in the scene window click on "Add Child Node" and add these three nodes. Your Player Scene should look like this at the end.

![Player scene with all nodes added in](readmeassets/build_1/1_player_scene_with_nodes.png)

Notice that the Yellow warning is now gone on the CharacterBody2D, but it now exists on the AnimatedSprite2D and CollisionShape2D. We'll get to fixing those shortly! Let's start filling in our Player object with details.

The first thing we're going to do is to add in the animated sprites for the Player movement. We want to show these when the Player moves on the screen. I've placed my assets into the "Player/assets" folder. Again, this allows me to move this component and not worry about naming conflicts for other components.

Click on the AnimatedSprite2D in the Scene browser. In the Inspector, you'll see Sprite Frames as an option in the AnimatedSprite2D section. Click the dropdown and select "Sprite Frames." Click on the text entry for "Sprite Frames" again and it will open the "Animation" window at the bottom.

![Animation window for Player](readmeassets/build_1/1_animation_window.png)

Now we are going to add animations for the player, specifically to move up, down, walk, and idle. Notice there isn't a left and right - that's because we'll use a trick with the images for walk to do both left and right! First, let's get the named animations in. Double-click on default and rename it "idle." Then, click the "Add" button and add the animations for up, down, and walk individually. You will rename the "New Animations" by double clicking on them and typing the name you want. Your Animation window should look like this at the end.

![Animation window for Player with the movements for idle, up, down, and walk added](readmeassets/build_1/1_animation_with_movements.png)

In this next step, we will add the assets for the animations. My assets are sprite sheets that need to be separated out into frames. Luckily, Godot supports sprite sheets and this process will be fairly easy! Let's walk through "down" in detail.

Click on the "Add Frames from Sprite Sheet" button in the Animation Frames section.

![Animation window add assets from sprite sheet button is the grid icon](readmeassets/build_1/1_load_frames_from_sprite_sheet.png)

Next, navigate to the "Player/assets" folder and select the `adventurer_down.png` file. This will bring up a window where we can select frames. If you use my image, you can enter in 4 Horizontal frames and 1 Vertical frame to slice the image. Then, select each of the "frames" by clicking on it, starting from the left and going right. The dialog should look like this.

![Animation frames are now selected and can be added to the animation](readmeassets/build_1/1_frames_selected.png)

Click on the button that reads "Add 4 Frame(s)" and the images should be added to the animation window like this.

![The animation for down is now loaded and shows the 4 frames](readmeassets/build_1/1_animation_for_down_loaded.png)

Now repeat this same process for the other 3 animations, using `adventurer_idle.png` for "idle," `adventurer_right.png` for "walk," and `adventurer_up.png` for "up." For "right," you will need to change the frames to 5 Horizontal and 1 Vertical and select all 5 frames.

The player might look a little small when loaded. We can do a quick fix on that. Select the "AnimatedSprite2D" node in your scene browser, go into the "Transform" section of the inspector and set the scale to 2 for x and 2 for y. If you have these linked, you should only have to change it for x and it will also change for y.

---
**NOTE**

I did not set the Texture Filters to "Nearest" in Build1. You can add this by clicking o the AnimatedSprite2D object, checking the Inspector under Canvas Item, and changing the value for Texture -> Filter to "Nearest." This value is set in Build2. Thank you OkMonk6021!

---

Next, we will update the CollisionShape2D object. Select it in the Scene Browser. The CollisionShape2D needs a shape that works with the AnimatedSprite2D shape. This will help your collisions seem more accurate to players when they play your game. In the Inspector, click on the down arrow by "Shape" and select "RectangleShape2D."

![Selecting the down arrow to open the collision shapes](readmeassets/build_1/1_collision_shape_selection.png)

When you do, a rectangle will appear over the Player. Resize and move the rectangle, as needed, so that it covers the player like this.

![Make the collision shape rectangle cover the player so that any collisions with the player will be detected](readmeassets/build_1/1_set_collision_shape_rectangle.png)

One last thing before we add some code and try this out is to add text to the label to call this "Player." Click on the Label in the Scene browser. In the Inspector window, enter "Player" in the Text field. Finally, move the label in the Scene browser so that it looks like this.

![The scene for the player now has the label above the player with the text of "Player"](readmeassets/build_1/1_scene_for_player_painted.png)

We are down to two last steps for this version of this component. We still need to add the input map for the project so we can test this and, also, a bit of code so we can see the Player move around. Let's take care of the input map first.

Open the Project Settings dialog by selecting the "Project -> Project Settings..." menu. Click on the "Input Map" tab so we can add new actions. We're going to add actions to move the player "up," "down," "left," and "right" using the arrow keys (or WASD, if you want) and left joystick controller (if you don't have a controller, you can skip this part). Here are the steps for "up" and you can repeat these for the other directions.

Type in "up" for the action and click on the +Add button. This will add the "up" action to the Input Map.

![The up action needs to be added to the input map for the game. This will allow the game to receive named inputs from the player](readmeassets/build_1/1_add_up_input_map.png)

Next, click the "+" next to "up" to open a dialog to add events that can trigger "up" to occur. This dialog box listens for input, making it easy to add the keys. Press the up arrow or W key to add it

![Next you define what inputs map to this named game input. We will add the up arrow and joystick up](readmeassets/build_1/1_add_arrow_up_event_to_up.png)

Click the "+" again and now press the left joystick on your controller up to assign it to up, as well

![Now the up event has two inputs mapped to it, up arrow and joystick up](readmeassets/build_1/1_add_joystick_up_event.png)

Repeat this process for "down," "left," and "right." The final output should look like this:

![Up, Down, Left, and Right events are now mapped to input events](readmeassets/build_1/1_all_inputs_mapped.png)

Click the "Close" button to return to the project.

For the final step, we're going to add some very basic code to the Player. To add code to the Player, click the Player in the Scene browser and click the "Add a new or existing script to the selected node" button.

Accept the defaults for the new script and the code browser window should appear. Replace what is in the code browser with the script below.

```
extends CharacterBody2D
class_name player_2d_body

var SPEED = 600

func _process(_delta: float) -> void:
	var x_direction: float = Input.get_axis("left", "right")
	var y_direction: float = Input.get_axis("up", "down")
	if x_direction:
		velocity.x = x_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if y_direction:
		velocity.y = y_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y < 0:
		$AnimatedSprite2D.animation = "up"
	elif velocity.y > 0:
		$AnimatedSprite2D.animation = "down"
	else:
		$AnimatedSprite2D.animation = "idle"
	$AnimatedSprite2D.play()
	
	move_and_slide()
```

This code will run within the Player class and look for the inputs we defined in the prior step. When the events are triggered, floats are sent to the variables that are then calculate the velocity of the CharacterBody2D. We want a gliding motion, so `move_toward` is used to allow the Player to gradually slow down. It's a pretty quick slow down with this component right now.

After the velocity is calculated, the animation is selected. If the Player is walking right or left, the "walk" animation is used. If they are moving left, the images are flipped horizontally to show the animation moving left. Finally, `move_and_slide()` is called to move the body based on the velocity.

If you want, you can play this scene using the F6 key. Note that the Player animations play but the Player doesn't move around the screen. This is because of the Camera2D node keeping the player in the middle of the screen. You can override this setting by clicking the "Override the in-game camera" button. Because there is no game world for this component, your Player is allowed to move off the screen and back onto it!

![Use the override the in-game camera to watch your player move around, and off, the screen](readmeassets/build_1/1_override_camera.png)

Happy Building and I'll see you for the next component build!

## Build 2

Build 2 is going to use an initialize script instead of setting properties for physics using the Inspector. You might be wondering why. The main reason is that we will want to change physics layers for our games. In the generator build, I know walls are always going to be layer 2. Characters might have many different layers, however. We could develop a ghost that goes through walls. We could have multiple players in the game, in which case, we might want them to collide with each other. And, my favorite, we might want to enable or disable friendly fire. If we start with an initialize script now, we start to enable building in a more componentized fashion now.

So, why didn't we do this initially? We didn't have anything to set, initially. However, we're going to make some changes and start that path now!

### Create the Initialize function

Open up the `player.gd` script. The first thing we're going to do is to update the SPEED variable. With capitalization, this variable reads more as a constant and we will want to expose this as a property that can be filled in or set with the initialize function. We also don't specify what type of variable it is, so we'll fix that with the following update:

```
@export var speed: int = 600
```

In your editor, you'll see 4 lines highlighted because we changed the name from `SPEED` to `speed`. Update these lines to use the new variable speed so they look like this:

```
		velocity.x = x_direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	if y_direction:
		velocity.y = y_direction * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)
```

Now, we can change the Players speed either via properties, if we paint the Player into a scene.

Next, we'll add the `initialize` function. Our initialize function will take 4 inputs. The first one will be the name of the object. All objects that will be instantiated should have a unique name. This will help when inspecting what the object is at runtime. The second will be the speed of the character. The last two will be the layer(s) the Player will exist on and the final will be the masks that will be used to detect collisions. Within this function, we'll set these values.

I could set these values directly on the `Player` by navigating through the scene tree, as needed. The reason I use the `initialize` function instead is that this allows me to refactor any part or the entire scene without needing to worry about updating any part of my game that calls these items directly. I can change how things are implemented without having to chase down all the parts of my game code that references them. This is using a strategy called "loose coupling," where components are free to change the implementation of a feature without causing a ripple effect to other parts of your game.

If you're starting to wonder about what you can do with loose coupling, that's great! If you're on the fence or still wrapping your head around it, that's ok! In either case, stick around for a while longer and I hope that you'll see how I use this approach in a practical manner and, hopefully, that will spark some ideas.

Let's add our `initialize` function to the `player.gd` file:

```
func initialize(inc_name: String, inc_speed: int, inc_layers: Array[int], inc_mask: Array[int]) -> void:
	name = inc_name
	speed = inc_speed
	for layer in inc_layers:
		set_collision_layer_value(layer, true)
	for mask in inc_mask:
		set_collision_mask_value(mask, true)
```

`name` is an automatically created variable name for objects with Godot. We haven't declared it and do not need to declare it, it just exists. Also, note that we only turn on layers and masks that are passed in and don't turn others off. We're going to make sure that all masks and layers are turned off, by default, in the Inspector in the next step.

We'll also add a function to set the location of the Player, for after the Generator is done.

```
func set_location(new_location: Vector2i) -> void:
	global_position = new_location	
```


<details>
<summary>Full code for player.gd</summary>

```
extends CharacterBody2D
class_name player_2d_body

@export var speed: int = 600


func initialize(inc_name: String, inc_speed: int, inc_layers: Array[int], inc_mask: Array[int]) -> void:
	name = inc_name
	speed = inc_speed
	for layer in inc_layers:
		set_collision_layer_value(layer, true)
	for mask in inc_mask:
		set_collision_mask_value(mask, true)


func set_location(new_location: Vector2i) -> void:
	global_position = new_location	


func _process(_delta: float) -> void:
	var x_direction: float = Input.get_axis("left", "right")
	var y_direction: float = Input.get_axis("up", "down")
	if x_direction:
		velocity.x = x_direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	if y_direction:
		velocity.y = y_direction * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)
		
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y < 0:
		$AnimatedSprite2D.animation = "up"
	elif velocity.y > 0:
		$AnimatedSprite2D.animation = "down"
	else:
		$AnimatedSprite2D.animation = "idle"
	$AnimatedSprite2D.play()
	
	move_and_slide()

```
</details>

### Turn off Player Layers and Mask

The last thing we're doing in this build, before saving and checking in code to our repo, is updating the properties for our `Player` object. Open the Player scene, select the "Player" root object in the Scene window, and use the Inspector window. We'll go down to the CollisionObject2D section and unselect all Layers and Masks.

![Unselect the Collision Layers and Masks for the Player object](/readmeassets/build_2/2_unselect_all_layers_and_masks.png)

Now let's save and run the scene with F6. You'll see the Player really has no changes from before, but the code runs and the Player can move.

Next we'll integrate the updated Player and Generator into our World object and see how things work!

## Build 3

The next few builds of the Player are going to start adding more features to our Player. Some of these features will grow into components, such as Weapons and Inventory. Other features will be captured within the current scene. For Build 3, we're focusing only on what is contained in the Player scene.

### What Makes a Good Component Versus a Good Feature?

Before we jump into the code, let's talk a bit of philosophy about components versus features. There is no one way to determine if something makes a better component or feature. I tend to look at it this way: is it small and large enough to maintain and does it provide enough functionality by itself?

First, on the size side, I look at the component from the Scene tree and size of code. I tend to lean towards mid-size components. When they get too large, I wonder if I am making something more complicated than it needs to be by combining components into a single package. Sometimes, combining components together can be a good thing. But, when it becomes too large that I spend more time trying to debug something versus adding a feature, then I think it might be time to either re-factor and split the components. If the component is too small, I'm creating more maintenance for myself.

Second, I tend to think about how useful a component can be with other components. If there's only one real use of the component, it won't pass my sniff test especially if it only has a few lines of code. At that point, the main component will be calling it and all I've really done is add a layer of complexity to projects by adding another component that needs to be copied to my main project for no other purpose.

Think about a health bar as an example. Health bars could be a component and show the current value and maximum values of a Players health. It could do this with text and / or a bar. You can add to it and subtract from it. That's probably 5 lines of code and another project. In my perspective, too small for a component and just do it as a feature.

On the other hand, could you create a component that allows people to set a ton of variables and, voila!, they have a game? Sure you could. Should you, is definitely a different question. In my perspective, this is too big for a component. If you decide this is a route you want to go, let me know - I'm interested in where you end up!

Now let's move on to adding some features!

### Switching Between Players, Enemies, and NPCs

The first thing I want to do is to add the ability to use the Player component as an Enemy and as an NPC, as well as a Player. To do this, I'm going to add a `type` to the class that can be set at the component level. You'll remember that we added a `name` value to the `initialize` function and we could use that. However, each object in a Godot game needs a unique name. We could substring and check the `name` for the type of Player this is, but I find it is easier to do with a clearly defined field. Let's update the `player.gd` script header to include this

```
enum PlayerType { Player, Enemy, NPC }

@export var speed: int = 600
@export var type: PlayerType = PlayerType.Player 
@export var animation: AnimatedSprite2D = null
```

The enum provides a list of appropriate values that can be used for type. The variable `type` uses this enum as its data type, allowing us to make sure the correct values are provided for this field and we don't get unintended effects from bad input. We also added a field for an animation to be passed in. We probably don't want our NPCs, players, and enemies to all look the same.

Next, we'll add some member variables to handle the x_direction and y_direction inputs or calculations. We'll use the inputs for actual players, but the NPCs and enemies should probably move based on calculations versus the input. I've put the `_` in front of these variables as a reminder that they should not be accessed directly or `@export`ed later.

```
var _x_direction: float = 0.0
var _y_direction: float = 0.0
```

Next, we're going to update the `_process` function to not handle input from the actual game player to control the enemy or NPC. We still need it to be able to move, and we still want the animations. So, let's wrap the input lines with an if statement that can check if this instance of Player is a player! We also need to reference the new member variables we just created.

```
func _process(_delta: float) -> void:
	if type == PlayerType.Player:
		_x_direction = Input.get_axis("left", "right")
		_y_direction = Input.get_axis("up", "down")
	if _x_direction:
		velocity.x = _x_direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	if _y_direction:
		velocity.y = _y_direction * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)
		
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y < 0:
		$AnimatedSprite2D.animation = "up"
	elif velocity.y > 0:
		$AnimatedSprite2D.animation = "down"
	else:
		$AnimatedSprite2D.animation = "idle"
	$AnimatedSprite2D.play()
```

Before we make further to code, open the Player scene and change the name of "Label" to "PlayerTypeLabel" as shown below.

![Change the name of Label to PlayerTypeLabel in the Scene Tree](/readmeassets/build_3/3_change_label_name.png)

We'll also change the `initialize` function to take in two new arguments for the type and animation variable. We're going to make animation optional, as we still want to be able to test the Player component without having to deal with multiple animations within the component.

```
func initialize(inc_name: String, inc_speed: int, inc_layers: Array[int], inc_mask: Array[int], 
	inc_type: PlayerType, inc_animation: AnimatedSprite2D = null) -> void:
		name = inc_name
		speed = inc_speed
		type = inc_type
		match type:
			PlayerType.Player:
				$PlayerTypeLabel.text = "Player"
			PlayerType.Enemy:
				$PlayerTypeLabel.text = "Enemy"
			PlayerType.NPC:
				$PlayerTypeLabel.text = "NPC"
			_:
				"!!!!!!!"
		if inc_animation:
			$AnimatedSprite2D.sprite_frames = inc_animation.sprite_frames
		for layer in inc_layers:
			set_collision_layer_value(layer, true)
		for mask in inc_mask:
			set_collision_mask_value(mask, true)
```

Lastly, we are going to use the `_ready` function to do some testing with this component.

```
func _ready() -> void:
	if get_parent().name == "root":
		initialize("Tim", 500, [3], [2], PlayerType.Player, null)
```

Now, if you hit F6 to play the scene, a Player with the Label of "Player" should show up and you can use your controller to move them around. Don't forget to override the ingame camera to see them move on the screen. You can also test this with NPC and Enemies by changing the `PlayerType.Player` values to `PlayerType.NPC` and PlayerType.Enemy` respectively.

### Adding a Test Harness

This is the spot where I normally add a testing scene, as I want to see all the types in one scene. Let's go to the FileSystem and add a new directory called "Test" at the root of the project, like below. This will be our test harness, so we don't have to do crazy stuff like editing and commenting out test cases, like we'd have to if we just used _ready.

![Add a test folder for the Player project](/readmeassets/build_3/3_add_test_harness.png)

Now, create a new scene in the test folder and call it "Test". Keep it as a 2D Scene.

![Add the new testing scene, which will be the scene for the test harness](/readmeassets/build_3/3_add_test_scene.png)

In the Scene window for the "Test" scene, attach a script to the Test node. Accept the default values that appear in the Attach Node Script dialog and click "Create".

![Add a script to the Test Node](/readmeassets/build_3/3_add_script_to_test.png)

Now, add the following code to the `test.gd` file:

```
extends Node2D

var player_node: PackedScene = preload("res://Player/Player.tscn")

func _ready() -> void:
	var layer: Array[int] = [2]
	var mask: Array[int] = [2]
	var test_cases = [["Tim1", 500, layer, mask, player_2d_body.PlayerType.Player, null],
						["Tim2", 500, layer, mask, player_2d_body.PlayerType.NPC, null],
						["Tim3", 500, layer, mask, player_2d_body.PlayerType.Enemy, null]]
	var p1: player_2d_body
	var i: int = 0
	for test_case in test_cases:
		p1 = player_node.instantiate()
		p1.initialize(test_case[0], test_case[1], test_case[2], test_case[3], test_case[4], test_case[5])
		add_child(p1)
		p1.set_location(Vector2i(i * 50, i * 50))
		i+=1
```

This will create a Player, NPC, and Enemy and add them to the Test scene. If you use your controller, you should see that only your Player component moves.

![Testing your player class shows that only your "Player" moves on the screen and the other two stay still](/readmeassets/build_3/3_testing_your_player_class.png)

<details>
<summary>Full listing for player.gd</summary>

```
extends CharacterBody2D
class_name player_2d_body

enum PlayerType { Player, Enemy, NPC }

@export var speed: int = 600
@export var type: PlayerType = PlayerType.Player 
@export var animation: AnimatedSprite2D = null

var _x_direction: float = 0.0
var _y_direction: float = 0.0


func _ready() -> void:
	if get_parent().name == "root":
		initialize("Tim", 500, [3], [2], PlayerType.Player, null)


func initialize(inc_name: String, inc_speed: int, inc_layers: Array[int], inc_mask: Array[int], 
	inc_type: PlayerType, inc_animation: AnimatedSprite2D = null) -> void:
		name = inc_name
		speed = inc_speed
		type = inc_type
		match type:
			PlayerType.Player:
				$PlayerTypeLabel.text = "Player"
			PlayerType.Enemy:
				$PlayerTypeLabel.text = "Enemy"
			PlayerType.NPC:
				$PlayerTypeLabel.text = "NPC"
			_:
				"!!!!!!!"
		if inc_animation:
			$AnimatedSprite2D.sprite_frames = inc_animation.sprite_frames
		for layer in inc_layers:
			set_collision_layer_value(layer, true)
		for mask in inc_mask:
			set_collision_mask_value(mask, true)


func set_location(new_location: Vector2i) -> void:
	global_position = new_location	


func _process(_delta: float) -> void:
	if type == PlayerType.Player:
		_x_direction = Input.get_axis("left", "right")
		_y_direction = Input.get_axis("up", "down")
	if _x_direction:
		velocity.x = _x_direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	if _y_direction:
		velocity.y = _y_direction * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)
		
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y < 0:
		$AnimatedSprite2D.animation = "up"
	elif velocity.y > 0:
		$AnimatedSprite2D.animation = "down"
	else:
		$AnimatedSprite2D.animation = "idle"
	$AnimatedSprite2D.play()
	
	move_and_slide()
```

</details>


The next lesson will integrate the updated Player component in the World project.


## Build 4

In this build, we'll be leveling off the abilities of the all types of player_2d_body to have the same ability - movement. Currently, this is the only thing that separates our Player type from the others. There will be other things that we will add to the player_2d_body, including inventory, equipment, and interaction. These features will look very similar in nature to what we're going to do for movement.

### Sub Components

This build will feature sub components, or components that we will only use with the player_2d_body but are not included in the Player scene. Sub components are scenes that can be loaded by player_2d_body class. Specifically, we're going to add sub components that allow the Enemy type to "look" for the Player. Also, we want the NPC type to avoid the Enemy. The Enemy looking should be only in the direction they are moving. I tend to use conical or triangular shapes for looking forward. The NPC will be more reactive, always looking around in a panic while moving in one direction. For the NPC, I'll use a circle with them at the center. Both of these will use the `ShapeCast2D` node as their base. 

You might wonder why these sub components aren't just part of the scene if these components are only used by player_2d_body. It seems pretty easy that you could turn them on and off as needed. This is a great question! I tend to look at what the component is doing and if it is a waste of CPU cycles to include in the main component scene. Both of these cases will be handling events with the built-in `_physics_process` function. We don't need this for the Player type. Since this internal function is triggered 60 times per second by default for each node, I like to make sure it only processes code when it is needed.

Your next question might be along the lines of, "but this is used in most of our player_2d_body nodes now. What's the big difference to leave it out of just player?" For this implementation, you're right. We may, however, want games where the NPC stays still. Or wanders but doesn't care about the Enemy. Or something else. Or, what if only your Player type requires physics checking? This approach gives us flexibility to adjust the sub component while leaving the main component mostly unedited.

This might seem like a lot of extra work, especially at first. Thinking about this flexibility and isolating functionality can help with re-use down the road.

### Our First Sub Component - A shared script

Once you start working with sub components, you'll find that some structures and data elements need to be shared across objects. Our `PlayerType` enumeration is a big one that will help with sub components.

Step 1, in the FileSystem window, create a `Scripts` folder under the `Player` folder. We will add a `player_shared.gd` script to that folder. The end result should look like this. The `player_shared.gd` script will act as globals for our player_2d_body class.

![Create a Scripts folder and add a player_shared.gd file to it. We will use this to share global definitions and functions for player_2d_body](/readmeassets/build_4/4_shared_script_created.png)

Next, update the `player_shared.gd` file with the following code:

```
extends Node
class_name PlayerShared

enum PlayerType { Player, Enemy, NPC }
```

The class_name `PlayerShared` gives us a reference to call items in this file by and we are moving just the enum for PlayerType at this time. This way, all of our components in the Player folder can reference the enum values for PlayerType by using the code `PlayerShared.PlayerType.` syntax before the value.

Save this file and close the editor window. We will update the player_2d_body class later, after we get the other sub components setup.

### Our Second Sub Component - SightLine

The SightLine sub component will be used by Enemy types. It will be a line of sight for the enemies and will present a conic shape from the Enemy, expanding outward to a limit. It should also be in the direction the Enemy is moving.

I like to create subdirectories for each sub component, as this keeps it easy to manage. So, create a new folder under the `Player` folder called `Sightline`. The result should look like this.

![Create a new folder for the Sightline scene under the Player folder](/readmeassets/build_4/4_sightline_folder.png)

We're going to create a new scene under this folder called `Sightline`. It should be of type `ShapeCast2D`.

![Create the new Sightline scene using the ShapeCast2D node as the base](/readmeassets/build_4/4_sightline_scene.png)

In the Scene window, select the `SightLine` node. To enable this node, we'll need to set a shape to it. Then we can add in code to support the Enemy type using it to "look" for Players. To set the shape, look in the Inspector window and click on the down arrow by the "Shape" field. Select the "ConvexPolygonShape2D" value.

![Start the process to set the shape of the Sightline 2D shape](/readmeassets/build_4/4_set_shape_of_sightline.png)

Click on the "ConvexPolygonShape2D" field value and then on the "PackedVector2" field value to open the fields where we can build the shape.

For size, enter "3" so we can add 3 points to the shape. We'll use the points (0,0), (135, -45), and (135, 45).

![Set the SightLine points so we get our cone for the enemy to look through](/readmeassets/build_4/4_set_sightline_points.png)

Next, set the Target Position in the Inspect to x = 0.0 px and y = 0.0 px. Also, uncheck any selected Collision Masks.

![Set the SightLine target position to 0 and 0, also uncheck any selected collision masks](/readmeassets/build_4/4_set_sightline_position_and_collision_mask.png)

Add a script to the Sightline scene and name it `Sightline`. We will then place the code below in this file.

```
extends ShapeCast2D
class_name _sightline

signal found_target(player_2d_body)
signal hit_object()

var _has_target: bool = false


func _physics_process(delta):
	# Common Block #
	
	# Per Type Block #
	match get_parent().type:
		PlayerShared.PlayerType.Player:
			return
		PlayerShared.PlayerType.Enemy:
			if is_colliding():
				var collides = get_collision_count()
				for i in collides:
					var obj = get_collider(i)
					match obj.name:
						"player":
							pass
							if not _has_target:
								_has_target = true
								found_target.emit(obj)
						"DefaultTileMap":
							if not _has_target and global_position.distance_to(collision_result[0]["point"]) < 70:
								hit_object.emit()
						_:
							if not _has_target and "enemy" in obj.name and global_position.distance_to(collision_result[0]["point"]) < 50:
								hit_object.emit()
							else:
								print("Not looking for ", obj.name)
		PlayerShared.PlayerType.NPC:
			return
		_:
			print("_physics_process Did not have a type")
			return
	#Common Block  

func set_direction(inc_vector2: Vector2) -> void:
	rotation = inc_vector2.angle()


```

This script will run 60 times per second for components it is attached to. If you look through it, you can see there are 2 signals it can emit, `found_target` and `hit_object`. `found_target` is used for when the ShapeCast2D has found a target to follow. It will send the collision target to whatever is connected to it. `hit_object` is used to denote the instance of the class has run into something and cannot move in that direction any further. You've seen those "wall slides," where an enemy or something continues to move slowly along the wall and eventually locks into a corner. This can help prevent that.

Next, look at the `_physics_process` function. This function introduces a technique I normally use in creating components, and that is putting in 3 code blocks for the function. First is a common block, next a per type block, and then finally a close out common block. I try to organize my code so that it fits in this construct, as it makes long term maintenance easier for me. It also helps reduce spaghetti code! I like to use a `match` statement with all the types, even if they aren't being used. The match should never hit these blocks in this implementation, so I just use `return` to skip the rest of the function.

The `Enemy` case is the most interesting. It looks for collisions `player` (who the Enemies will hunt) and `DefaultTileMap` (the walls). If it finds a player, it will emit that the player is found, via `found_target` and allow the listener to do what it will with this information. If it finds a wall, it will emit the `hit_object` signal to let the listener know that the wall is hit. Finally, it will also try to avoid running over other `enemy_` instances. I left in a print statement if it runs into something else that is not explicitly expected. This can be helpful in the future.

Finally, there is a function called `set_direction`. This is used to set the direction of the ShapeCast2D to be in front of where the Enemy is moving. This is not called within this class, but will be called by the player_2d_body class.

Save the script file and scene and we'll move on to our next sub component.

### The Scram Circle, Our Third Sub Component

The Scram Circle will be used by the NPC types, who will constantly be looking for any Enemies to run from. To do this, we'll use a circle shape to simulate the constant scanning, versus an always moving shape.

Start by creating a new folder under the Player folder named `Scramcircle`.

![Create a Scramcircle folder under the Player folder](/readmeassets/build_4/4_scramcircle_folder.png)

Under the `Scramcircle` folder, create a new scene called `Scramcircle`. It should use the `ShapeCast2D` node.

![Create the scene for the Scramcircle using the ShapeCast2D node](/readmeassets/build_4/4_scramcircle_scene.png)

Select the `ScramCircle` node in the Scene window. We need to set the shape, just like we did for the SightLine. Click the down arrow by the "Shape" field and select "CircleShape2D".

![Set the shape of the scramcircle to circleshape2d](/readmeassets/build_4/4_set_scramcircle_shape.png)

Set the radius to 100.0 px, Target Position to 0.0 px, 0.0 px, and unselect the Collision Masks.

![Set the properties for the scramcircle to a 100 px size, located at 0.0, 0.0, with no collision masks](/readmeassets/build_4/4_scramcircle_properties.png)

Next, attach a script to the Scramcircle and call it `scramcircle.gd`. We will use the following code in this file.

```
extends ShapeCast2D
class_name _scramcircle

signal scram_target(player_2d_body)
signal scram_target_clear()
signal hit_object()

var _has_target: bool = false

	
func _physics_process(delta):
	# Common Block #
	
	# Per Type Block #
	match get_parent().type:
		PlayerShared.PlayerType.Player:
			return
		PlayerShared.PlayerType.Enemy:
			return
		PlayerShared.PlayerType.NPC:
			var _scram_target: bool = false
			if is_colliding():
				var collides = get_collision_count()
				for i in collides:
					var obj = get_collider(i)
					match obj.name:
						"player":
							pass
						"DefaultTileMap":
							if not _has_target and global_position.distance_to(collision_result[0]["point"]) < 70:
								hit_object.emit()
						_:
							if not _has_target and "enemy" in obj.name and global_position.distance_to(collision_result[0]["point"]) < 100:
								print("enemy in range ")
								scram_target.emit(obj)
								_has_target = true
								_scram_target = true
							else:
								print("ScramCircle Not looking for ", obj.name)
			if not _scram_target and _has_target:
				_has_target = false
				scram_target_clear.emit()
		_:
			print("_physics_process Did not have a type")
			return
	#Common Block  

```

This code looks similar to the Sightline code. It has 3 signals it can emit, one to say that it found a target to avoid (`scram_target`), one to clear the target to avoid (`scram_target_clear`), and one to say it hit a wall or other blocker (`hit_object`).

In the `_process_physics` function, we can see that the NPC is avoiding walls. When it locates an enemy it sets a flag internally to denote that it found an enemy and emits the signal that one is in range. The listener can then take action on this. If it escapes from the target, it sends a the clear signal.

Save this script file and scene and we'll update the player code to use these sub components.