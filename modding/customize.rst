.. _tab_customize:

Customize Astral Lust
=====================

Tweak variables
---------------

Here you'll find easy to tweak game variables, this way you'll make the game adhere to your preferences.
To change the variables use:

.. code-block:: python

  init 11 python:
    variable = value

|
|

Change/add journal tip
----------------------

To change a tip we need to do this:

``tips["story_name"][event_number] = "new_tip"``

Story names are the same you see in the journal in-game. Remember to work on them in init time (inside ``init python:`` statement)

.. code-block:: python
  :linenos:

  tips["Main Story"][1] = "Now first Main Story event will have this as a tip."

|

To add a new tip you can just ``pop()`` the last story tip, then ``append()`` to a story.
First the new tip then the last tip.

.. code-block:: python
  :linenos:

  tips["Lexi"].pop() # Remove last item
  tips["Lexi"].append("New tip.") # Add new tip
  tips["Lexi"].append("More coming soon.") # Add last tip, there needs to be one more tip than amount of events.

|

.. code-block:: python
  :linenos:

  tips = {
    "Main Story": [ # Name of a story
      "player.story", # [0], String, variable keeping story progress (which event you've completed)
      # _("string") marks it as translatable in Ren'Py
      _("I have a gut feeling that I would have a good dream."), # [1], Actual tips
      _("Who knows what awaits me outside?"), # [2]
      _("I need to take care of my mental health."), # [3]
      _("Maybe someone can answer my questions out there."), # [4]
      _("I wonder if I would turn insane if it spoke to me again.."), # [5]
      _("Who knows what awaits me outside?"), # [6]
      _("My dreams are becoming more disturbing as of late."), # [7]
      _("More coming soon.") # [8], Last tip, you need one more tip than your events, if you want you can use "Completed" instead
    ]
  }

|
|

Add story
---------

We can add new story with very simple method:

.. code-block:: python
  :linenos:

  init 11 python:
    tips.update({"My Story": [ # Name of a story
      "my_story_progress_tracking_variable", # [0], String, variable keeping story progress (which event you've completed)
      _("I have a gut feeling that I would have a good dream."), # [1], Actual tips, make as much as you need
      _("More coming soon.") # Last tip, you need one more tip than your events, if you want you can use "Completed" instead
    ]})

|
|

List of safe to tweak variables
-------------------------------

* ``dream_base_chance = 0.2`` - Chance for a dream during sleep
* Base chance for card of given rarity to drop, player luck is added to it:

  * ``base_ordinary_chance = 60``
  * ``base_extraordinary_chance = 25``
  * ``base_mythical_chance = 10``
  * ``base_angelic_chance = 3``
  * ``base_divine_chance = 2``

* ``base_escape_chance = 0.2`` - Base chance to escape combat
* ``agi_escape_chance = 0.02`` - Chance to escape combat per agility point
* ``escape_chance_cap = 0.65`` - Maximum escape chance
* ``terror_chance = 50`` - Chance for beings in terror to skip turn, in %, deafult 50%
* ``base_gen_combat_chance = 0.45`` - chance of generic combat event, 1.0 for 100% 0 for 0%, story mode disables random combat encounter without care for this setting
* ``succubus_base_lust = 50`` - Lust that succubus start with, default 50
* ``succubus_lust_increase = 5`` - Lust that succubus gain per day, default 5
* ``succubus_max_lust = 100`` - Lust after which succubus come to us for sex, default 100
* ``succubus_lust_mult = 5`` - Multiplier of lust succubus lose after H, default 5
* ``sleep_with_girl_cor_chance = 0.5`` - Chance for corruption decrease during sleepover
* ``journal_color = "#45B6FE"`` - Color of journal tips
