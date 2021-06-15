Changelog - Modding
===================

0.1.7
------

Added
~~~~~

* optional days attribute to NPC.check() method
* calc_gui(pixels) - quick way to calculate pixels to your game format
* scope variable to replays
* 7 mina emotions - ouch, shocked, eyeroll, apologetic, sigh, exasperated, smile cum
* 2 alice emotions - pout, closed

Changed
~~~~~~~

* gui mode is now defined at -999 init

|
|

0.1.6c
------

Added
~~~~~

* characters, and ignored attributes to set_states()
* stat_sleep to NPCs
* add_submission() to NPC class
* stat_bdsm to NPC class
* optional set attribute to advance_time()
* emoticon sm/sp screens

Changed
~~~~~~~

* how wallpaper system works, now not all wallpapers are lootable from combat

Fixed
~~~~~

* unable to save after using some triggers

|
|

0.1.6a
------

Major
~~~~~

* reworked traders implementation, now changes are made automatically to them, use define

Added
~~~~~

* sacrifice option to enemy atk method, deafult False
* unlocked boolean, needed when adding to replays_list, decided if name is seen from the start
* four trigger to death
* being heal method now returns amount healed
* can make heal method do notification, make_message = True

Changed
~~~~~~~

* how arena animation is determined, now all renpy images work

|
|

0.1.5c
------

Major
~~~~~

* now your pathways can also be relative to mods folder (``myMod/1.png`` instead of ``mods/myMod/1.png``)

Added
~~~~~

* support for up to 20 dialogue options being displayed at once (previously 9)
* option to add your own characters to the character menu
* 6 new text tags - love, lust, quiet, small, big, loud

|
|

0.1.5b
------

Added
~~~~~

* player ``skills`` dict to Player class
* Massage skill
* ``improve_skill(sk, amt = 1)`` method to Player class, it improves or adds a skill to the player, can be used to decrease skill

|
|

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
