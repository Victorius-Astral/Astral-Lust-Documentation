.. _tab_customize:

Customize Astral Lust
=====================

Here you'll find easy to tweak game variables, this way you'll make the game adhere to your preferences.
To change the variables use:

.. code-block:: python

  init 11 python:
    variable = value

List of variables
-----------------

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
