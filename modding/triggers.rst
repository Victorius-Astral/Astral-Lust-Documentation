.. _tab_triggers:

Triggers
========

Using a trigger
--------

To add your own mechanics right into vanilla code without actually overwriting any files you need to use the trigger system I've invented for this purpose.
It takes code as string or code compiled with ``compile("code", "triggers", "exec")``. You should compile your code at init time for increased performance.

Trigger system acts as a code injector, we tell it what to inject by appending our code to triggers. The code works like if it was always there, in other word you can use ``self.`` or local variables. Remember that using global variable inside of function/method requires to define it in function/method with ``global myVar``.

.. code-block:: python
  :linenos:

  init 11 python:
    # Code to inject, here it calls our function named myfunction()
    myfun = "myfunction()"

    # Compile your code to code object, it improves performance, if you don't do this it'll be done by trigger system, but for now it's slower
    com_myfun = compile(myfun, "triggers", "exec")

    # Add code object com_myfun, we just compiled to trigger before_combat, your code will be executed always the trigger before_combat is used
    trigger.add("before_combat", com_myfun)

  # This uses the trigger, they are already included in parts of vanilla script
  trigger.use("before_combat")

|
|

.. _tab_triggers_effects:

Adding our own status effect
----------------------------

Adding our own status effects comes with three steps:

* Add our effect, to the being.eff
* Program our effect's mechanic
* Make an icon

|

Add our effect, to the being.eff
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The simplest thing to do. We add ``being.eff.update({"SuperPower", "Triples the damage dealt!"})`` at init time.
Keep in mind that when there is a new effect, loading game will throw an error if in combat.

Saves inside of combat will throw an error on load without compatibility patch.
Patch can be injected to ``trigger.after_load_start`` or ``trigger.after_load_end``.

The error also will appear if loading save within combat after removing the mod.
So remember to save outside of combat.

Saves outside of combat won't have any problems.

.. code-block:: python
  :linenos:

  init 11 python:
    # being.eff.update({"Effect Name", "Tooltip"})
    being.eff.update({"SuperPower", "Triples the damage dealt! Every attack uses 1 stack."})

|

Program our effect's mechanic
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: python
  :linenos:

  init 11 python:
    # being.eff.update({"Effect Name", "Tooltip"})
    being.eff.update({"SuperPower", "Triples the damage dealt! Every attack uses 1 stack."})

    command = "if self.eff['SuperPower'][0] > 0: \n dmg = dmg * 3 \n self.eff['SuperPower'][0] -= 1"
    com_command = compile(command, "triggers", "exec")

    trigger.add("take_dmg_before_attack", com_command)

|

Make an icon
~~~~~~~~~~~~

I've made all my icons here: `Game-icons.net <https://game-icons.net/>`_

It's a great site that allows you to download and customize over 4000 game icons.
The perfect resolution would be 128x128 pixels.
It's a good balance between quality and performance. 
Game will resize the icon on its own depending on 4K or 1080p game version.

For now your icon need to be put in ``game/images/Icons/``. I plan to add support for your own paths, in your mod's folder.

|
|

List of triggers
----------------

Update
~~~~~~

* ``"after_load_start"`` - First thing on loading saved
* ``"after_load_end"`` - The end of save loading

|

fight()
~~~~~~~

# fight() function - initialization of combat #

* ``"start_of_fight"`` - The start of fight() function
* ``"middle_of_fight"`` - Middle of fight() function, before defining piles
* ``"before_combat_screen"`` - Before combat screens are initialized
* ``"before_combat"`` - Right before actual combat starts

|

Combat
~~~~~~

End turn order:

* player turn damage
* enemy turn damage
* enemy turn1
* enemy action
* enemy turn2
* player turn2
* player turn1

|

* ``"before_discard"`` - Before cards are discarded from hand
* ``"after_discard"`` - After cards been discarded, before other things
* ``"after_turn_damage"`` - After calculating damage from effects
* ``"before_enemy_action"`` - Before enemy makes an action
* ``"after_enemy_action"`` - After enemy makes an action
* ``"after_decrease_effects"`` - After turn2() (effects decrease)
* ``"before_new_turn"`` - Right before new turn
* ``"before_new_turn_alt"`` - Right before new turn, screen isn't blocked

|

Escape
~~~~~~

* ``"on_escape"`` - When trying to escape combat
* ``"on_escape_success"`` - When succed in escape roll, before actual escape
* ``"on_escape_fail"`` - When failed to escape

|

Cards
~~~~~

* ``"card_use"`` - On using a card, before anything else
* ``"card_before_play"`` - Right before card is played
* ``"card_after_play"`` - Right after card is played
* ``"card_after_use"`` - After all cards interactions are done

|

turn1()
~~~~~~~

* ``"turn1_start"`` - Beginning of turn1
* ``"turn1_end"`` - End of turn1

|

turn2()
~~~~~~~

* ``"turn2_start"`` - Beginning of turn2
* ``"turn2_end"`` - End of turn2

|

turn_dmg()
~~~~~~~~~~

* ``"turn_dmg_start"`` - Beginning of turn_dmg
* ``"turn_dmg_end"`` - End of turn_dmg

|

take_dmg()
~~~~~~~~~~

* ``"take_dmg_start"`` - Beginning of take_dmg, after is_player is defined, it can be used to check if executed by player or enemy
* ``"take_dmg_before_attack"`` - Right before damage is dealt
* ``"take_dmg_after_attack"`` - Right after damage is dealt
* ``"take_dmg_end"`` - End of take_dmg

|

Enemy
~~~~~

* ``"enemy_atk_start"`` - Beginning of atk method
* ``"enemy_before_attack"`` - Right before damage is dealt (before player.take_dmg(dmg) is called)
* ``"enemy_after_attack"`` - Right before damage is dealt (before player.take_dmg(dmg) is called)
* ``"enemy_atk_end"`` - End of atk method

|

Special
~~~~~~~

* ``"test"`` - Used with debug() method to run all triggers' codes at once, you don't need to manually add to it, it's added automatically
