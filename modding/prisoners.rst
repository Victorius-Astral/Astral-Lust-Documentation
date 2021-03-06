Prisoners
=========

Prisoner system was implemented in 0.1.3 and it allows us to catch beings and keep them in the dungeon.
It automatically checks if said enemy can be catched.
It also allows us to visit the prisoner in the dungeon.

This system has safety features enabled, if you use the mod that adds prisoners, but delete it, your save will work.
Even more! It'll save your prisoner, so that when you install the mod again, your prisoner will be waiting for you in the dungeon.
No need to catch him/her/it again.

|
|

Add new prisoner
----------------

You need to add your prisoner to ``available_prisoners`` at the init time.
It's here so that mods which adds them can be safely removed.

.. code-block:: python

  # Prisoner's image Enemy's class attribute (if catchable enemy),
  available_prisoners.append("MyPrisoner")

|

Now let's make prisoner's NPC object, it's required, thank to that prisoner will have trust, lust, submission etc. statistics.

.. code-block:: python

  init 11 python:
    # Make NPC object, name is the only required argument
    MyPris = NPC("John")

|

Now we need to create catch label using ``catch_MyPrisoner`` as a syntax.
It should end with return, you can also jump somewhere if you know what you're doing.
If you jump remember to make sure player ends in a freeroam mode, also remember to change the music.
You need to add prisoner to the ``prisoners`` dictionary as ``{"MyPrisoner": NPC_Object}``.

You don't need this label if you don't want your prisoner to be caught after winning a fight,
still if it's an enemy you should make this label even if it only returns.

`Dialogue and Narration <https://www.renpy.org/doc/html/dialogue.html?highlight=dialogues#dialogue-and-narration>`_

.. code-block::
  :linenos:

  label catch_MyPrisoner:
    ... talk ...
    ... event ...
    ... or whatever you want to happen here ...

    # $ allows to add one line python statement in renpy's labels or screens
    #
    $prisoners.update({"MyPrisoner": MyPris})
    return

|

Next required label is ``talk_MyPrisoner``. It's called when you decide to talk to the prisoner in the dungeon.
While you can make it into whatever you want, dialogue menu would be the best here. It shows dungeon cell as a background image.

.. code-block:: python
  :linenos:

  label talk_MyPrisoner:
    show myprisoner calm
    ... dialogue / grettings ...

    menu .menu1:
      "Option1":
        ... dialogue ...
        # Return to dialogue choosing menu
        jump .menu1

      "Option2":
        ... dialogue ...
        jump .menu1

      "Leave":
        # Leave the talk, return to the dungeon freeroam
        jump room_hotel_dungeon

|

That would be all for creating a prisoner.

|
|

Add new succubus
----------------

To add a succubus you need to add her as a prisoner, exactly like above, then simply append her to ``list_of_succubus`` list.

.. code-block:: python

  init 11 python:
    # Append the same thing you did to available_prisoners
    list_of_succubus.append("MySuccubusImage")
