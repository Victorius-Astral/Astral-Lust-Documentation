Changelog - Modding
===================

0.1.5a
------

Added
~~~~~

* 2 new text tag ``{trust}`` & ``{bad}``

|
|

0.1.5
-----

Added
~~~~~

* 2 buttons - button_craft_stone & button_craft_steel
* 5 succab emotions
* 1 kiara emotion - sigh
* can add tabs to the vault
* can add recipes to the forge and the gunsmith
* can make new crafting tables using vanilla screen
* chinatown2 arena

|
|

0.1.4b
------

Added
~~~~~

* new button displayable ``button_label``, can be used with background attribute
* you can now add your own scenes/categories to replay gallery
* now you can change vault's space per level
* ``before_shuffle`` trigger
* option to add code to trigger directly, through appending function like this ``trigger.before_combat_screen.append(myFunction)``
* ``dream_end`` label now ends replay automatically
* ``death2`` label now ends replay automatically
* ``explore_return`` label now ends replay automatically
* now ``fight()`` skips combat automatically if in replay, can be disabled by setting ``replay_mode = False`` when calling ``fight()``

Fixed
~~~~~

* error/bug when using console (in freeroam) to jump to a label that ends with return (on this event's end)

|
|

0.1.4a
------

Major
~~~~~

* reworked the whole file structure, severely increasing overwriting vanilla files compatibility with future versions

Added
~~~~~

* track of current label, it's in the _label variable
* customizable text tags, check text_tags.rpy in functions/qol

|
|

0.1.4
-----

Added
~~~~~

* a few new pages to the documentation, changed or expanded a few other
* support for tweaking characters states (what they do, where they are)
* a few Alice's emotions, one Lexi's emotion

|
|

0.1.3b
------

Major
~~~~~

* reworked triggers, now they can actually use global/local variables, as they are in fact executed in code now, not in the trigger object. You don't need to compile triggers anymore, I got you covered, it'll be compiled automatically at game startup.

Removed
~~~~~~~

* old card methods granting effect, only buff() method should be used to increase or decrease status effects

Added
~~~~~

* 5 looting triggers and 3 new ones to combat

Changed
~~~~~~~

* now cards are reset with load using reset() method (you need to initialize your variables here). __init__() by default calls this method.

Fixed
~~~~~

* trigger after_load_start triggering instead of after_load_end

|
|

0.1.3a
------

Added
~~~~~

* Sample Mod to mods/ folder, check it, it's heavily commented to explain everything going on
* after_load _start & _end triggers
* triggers during combat initialization

Changed
~~~~~~~

* for triggers you can now either use a string or (much better for performance) use compiled (at init time) code object (check documentation's trigger tab)
* now adding enemies to random combat encounter requires to add them as strings instead of objects
* now terror tooltip reflects changes to terror chance properly

Fixed
~~~~~

* spelling mistakes in a few image names, to make it easier for you to not use wrong name

|
|

0.1.3
-----

Released
~~~~~~~~

* online documentation, it shows how to make your mod with new dreams, events, cards, enemies, etc.
* source code for people with Mod Developer role on Discord
* AL card templates
* mod_toolkit script (for now it only enables dev tools & console in AL)

Added
~~~~~

* support for adding new status effects & card mechanics, trigger system
* support for adding your own menus to expanded menu
* support for replacing game images
* support for adding new cards
* support for adding dreams
* support for changing base dream chance
* support for adding new enemies & arenas
* support for adding new enemies & arenas to generic combat event
* support for adding wallpapers
* support for adding new cards and changing/adding cards lootlists
* support for adding new materials and changing/adding items lootlist
* support for changing sleepover chance to decrease corruption
* support for changing card loot chance
* support for changing escape chance
* support for creating new traders
* support for adding new prisoners
* support for adding new succubus
* support for tweaking succubus lust mechanic
* support for adding/changing journal tips
* support for displaying help screen with your text
