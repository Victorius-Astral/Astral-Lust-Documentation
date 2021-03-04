.. _tab_lootlists:

Lootlists
=========

Changing & adding lootlists
---------------------------

:ref:`Create new items <new_items>`

.. code-block:: python
  :linenos:

  init 11 python:

    ###################
    # Cards lootlists #
    ###################

    # Replacing lootlist, this code changes werewolf lootlist, it now drops four cards: MyCard1, MyCard2, Lycanthropy, Insatiable Lust
    lootlist["werewolf"] = [MyCard1(), MyCard2(), Lycantrophy(), Insatiable_Lust()]

    # Adding card to a lootlist, it adds card (with class name) MyCard, the rest of lootlist remains
    lootlist["werewolf"].append(MyCard())

    # Create new lootlist, it creates myLootlist with cards MyCard1 and MyCard2
    lootlist.update({"myLootlist", [MyCard1(), MyCard2()]})

    ######################
    # Material lootlists #
    ######################

    # Replacing lootlist this replaces orc lootlist, it gives the lootlist:
    # 65% for 1-3 Wood,
    # 50% for 1-3 Stone,
    # 50% for 1-3 Metal
    mat_lootlist.update({"orc": {
      "Wood": [0.65, 1, 3],
      "Stone": [0.5, 1, 3],
      "Metal": [0.5, 1, 3]
    }})

    # Adding material to lootlist / Changing materials amount & drop chance
    # This adds Cloth to orc lootlist with 5% chance for 2-4 Cloth.
    # You can this same way overwrite other items with your own chances, amounts
    mat_lootlist["orc"].update({"Cloth": [0.05, 2, 4]})

    # Create new lootlist, it creates myList with 100% chance for 4-5 Wood and 1% chance for 1 Mysterious Coin
    mat_lootlist.update({"myList": {
      "Wood": [1.0, 4, 5],
      "Mysterious Coin": [0.01, 1, 1]
    }})

|
|

Cards - Enemies
---------------

.. code-block:: python
  :linenos:

  "werewolf": [Lycantrophy(), Bite(), Empower(), Dodge(), Slash(), Healing(), Greater_Healing(), Regrow_Limbs()],
  "bandits_melee": [Slash(), Retaliate(), Kick(), Blind(), Guard(), Headbutt(), Stab(), Flurry()],
  "bandits_guns": [Bulletstorm(), Dodge(), Shot(), Kick(), Take_Cover(), Strike()],
  "bandits": [Bulletstorm(), Dodge(), Shot(), Kick(), Take_Cover(), Strike(), Slash(), Retaliate(), Flurry(), Blind(), Guard(), Headbutt(), Stab()],
  "spider": [Bite(), Spit_Poison(), Poisonous_Bite(), Hide_in_the_Shadows(), Lunge()],
  "scavengers": [Slash(), Retaliate(), Blind(), Guard(), Headbutt(), Shot(), Take_Cover()],
  "bandit_melee": [Slash(), Blind(), Retaliate(), Strike(), Defend(), Kick(), Guard(), Stab(), Headbutt()],
  "bandit_melee_girl": [Slash(), Blind(), Retaliate(), Strike(), Defend(), Kick(), Guard(), Stab(), Headbutt(), Seduce(), Flirtatious_Look()],
  "orc": [Fury(), Roar(), Flurry(), Slash(), Retaliate(), Kick(), Freedom_in_Death(), Empower(), Guard(), Headbutt(), Sharpening(), Horde_Weapons(), Strike(), Defend()],
  "manticore": [Fury(), Roar(), Spit_Poison(), Poisonous_Bite(), Lunge(), Headbutt(), Dodge(), Healing(), Bite(), Retaliate(), Stab(), Antidote()],
  "flamingo": [Mutate(), Bite(), Dodge(), Enfeeble(), Infection(), Despair()],
  "faceless_giant": [Roar(), Fury(), Terror(), Despair(), Crush(), Sweep(), Giant(), Madness(), Insanity(), Faceless(), Veil_of_Shadows(), Kick(), Freedom_in_Death(), Guard(), Hide_in_the_Shadows()],
  "faceless": [Fury(), Madness(), Insanity(), Faceless(), Veil_of_Shadows(), Freedom_in_Death(), Guard(), Hide_in_the_Shadows()],
  "devourer_giant": [Roar(), Fury(), Terror(), Despair(), Crush(), Sweep(), Giant(), Madness(), Insanity(), Devour(), Insatiable_Hunger(), Kick(), Freedom_in_Death(), Bite(), Guard()],
  "devourer": [Fury(), Madness(), Insanity(), Devour(), Insatiable_Hunger(), Freedom_in_Death(), Bite(), Guard()],
  "succubus": [Seduce(), Flirtatious_Look(), Slash(), Insatiable_Lust(), Guard(), Freedom(), Flurry(), Enfeeble(), Hypnotise(), Cease_Fire_Treaty()],
  "cultist": [Miracle(), Slash(), Kick(), Empower(), Hide_in_the_Shadows(), Freedom_in_Death(), Stab(), Hypnotise(), Outside(), Terror(), Despair(), Madness(), Insanity(), Veil_of_Shadows(), Ritual(), Aharon(), Sacrifice(), Dodge()],
  "crab": [Stone_Skin(), Strike(), Defend(), Regrow_Limbs(), Roar(), Fury(), Mutate(), Terror(), Sweep(), Unshakable(), Retaliate(), Guard()],
  "dragon": [Fireborn(), Fireball(), Dragon_Roar(), Fire_Breath(), Roar(), Terror(), Sweep(), Giant(), Bite(), Crush(), Guard(), Healing(), Retaliate()],
  "stickman": [Terror(), Madness(), Kick(), Freedom_in_Death(), Mutate(), Guard(), Stab(), Lunge(), Headbutt()],
  "ghouls": [Bite(), Poisonous_Bite(), Dodge(), Healing(), Lunge(), Antidote(), Slash(), Retaliate(), Devour()]

|
|

Cards - Traders
---------------

.. code-block:: python
  :linenos:

  "devil_abi": [Miracle(), Fireborn(), Lycantrophy(), Vampirism(), Freedom(), Freedom_in_Death(), Cease_Fire_Treaty(), Outside(), Terror(), Despair(), Crush(), Madness(), Insanity(), Insatiable_Lust(), Aharon(), Dragon_Roar()],
  "tarot": [The_Fool(), The_Magican(), The_High_Priestess(), The_Empress(), The_Emperor(), The_Hierophant(), The_Lovers(), The_Chariot(), Justice(), The_Hermit(), Wheel_of_Fortune(), Strength(), The_Hanged_Man(), Death(), Temperance(), The_Devil(), The_Tower(), The_Star(), The_Moon(), The_Sun(), Judgement(), The_World()]

|
|

Materials
---------

.. code-block:: python
  :linenos:

  define mat_lootlist = {
    "materials_basic": {
    "Wood": [0.5, 1, 3], # item: [chance, min, max]
    "Stone": [0.5, 1, 3],
    "Metal": [0.5, 1, 3],
    "Cloth": [0.5, 1, 3],
    "Mysterious Coin": [0.01, 1, 1]
  }}

|
|

Materials - Enemies
-------------------

.. code-block:: python
  :linenos:

  "werewolf": {"Wood": [0.65, 1, 3], "Stone": [0.5, 1, 3], "Metal": [0.5, 1, 3], "Cloth": [0.8, 1, 3], "Mysterious Coin": [0.01, 1, 1]},
  "bandits": {"Wood": [0.65, 1, 3], "Stone": [0.4, 1, 2], "Metal": [0.7, 1, 3], "Cloth": [0.8, 1, 4], "Mysterious Coin": [0.01, 1, 1]},
  "bandit": {"Wood": [0.65, 1, 2], "Stone": [0.4, 1, 1], "Metal": [0.7, 1, 2], "Cloth": [0.9, 1, 3], "Mysterious Coin": [0.01, 1, 1]},
  "spider": {"Wood": [0.65, 1, 2], "Metal": [0.5, 1, 2], "Cloth": [0.8, 1, 2], "Mysterious Coin": [0.01, 1, 1]},
  "scavengers": {"Wood": [0.8, 1, 1], "Stone": [0.8, 1, 1], "Metal": [0.8, 1, 1], "Cloth": [0.8, 1, 1], "Mysterious Coin": [0.01, 1, 1]},
  "orc": {"Wood": [0.55, 1, 3], "Stone": [0.7, 1, 3], "Metal": [0.9, 1, 3], "Cloth": [0.5, 1, 3], "Mysterious Coin": [0.01, 1, 1]},
  "orc_group": {"Wood": [0.55, 1, 7], "Stone": [0.7, 3, 7], "Metal": [0.9, 2, 7], "Cloth": [0.5, 2, 7], "Mysterious Coin": [0.15, 1, 1]},
  "manticore": {"Cloth": [1.0, 2, 8], "Mysterious Coin": [0.03, 1, 1]},
  "flamingo": {"Wood": [0.4, 1, 1], "Stone": [0.4, 1, 1], "Metal": [0.4, 1, 1], "Cloth": [0.4, 1, 1], "Mysterious Coin": [0.01, 1, 1]},
  "faceless_giant": {"Wood": [0.6, 1, 7], "Stone": [0.6, 1, 7], "Metal": [0.6, 1, 7], "Cloth": [0.6, 1, 7], "Mysterious Coin": [0.1, 1, 1]},
  "devourer_giant": {"Wood": [0.6, 1, 7], "Stone": [0.6, 1, 7], "Metal": [0.6, 1, 7], "Cloth": [0.6, 1, 7], "Mysterious Coin": [0.1, 1, 1]},
  "succubus": {"Wood": [0.65, 1, 3], "Stone": [0.5, 1, 3], "Metal": [0.5, 1, 3], "Cloth": [0.8, 1, 3], "Mysterious Coin": [0.1, 1, 1]},
  "cultist": {"Wood": [0.7, 1, 10], "Stone": [0.7, 1, 10], "Metal": [0.7, 1, 10], "Cloth": [0.8, 1, 10], "Mysterious Coin": [0.15, 1, 1]},
  "crab": {"Stone": [1.0, 2, 6], "Metal": [1.0, 2, 6], "Mysterious Coin": [0.03, 1, 1]},
  "ghouls": {"Wood": [0.8, 2, 5], "Stone": [0.6, 1, 3], "Metal": [0.6, 1, 3], "Cloth": [0.5, 1, 3], "Mysterious Coin": [0.01, 1, 1]},
  "dragon": {"Wood": [0.5, 1, 6], "Stone": [0.9, 3, 10], "Metal": [1.0, 4, 12], "Cloth": [0.5, 1, 6], "Mysterious Coin": [0.5, 1, 1]},
  "stickman": {"Wood": [1.0, 3, 8], "Mysterious Coin": [0.1, 1, 1]},
  "orc_group": {"Wood": [0.6, 1, 7], "Stone": [0.6, 1, 7], "Metal": [0.7, 3, 7], "Cloth": [0.6, 1, 7], "Mysterious Coin": [0.1, 1, 1]}

|
|

Materials - Cheats
------------------

.. code-block:: python
  :linenos:

  "cheat_starter": {"Wood": [1.0, 3, 3], "Stone": [1.0, 3, 3], "Metal": [1.0, 3, 3], "Cloth": [1.0, 3, 3]},
  "cheat_builder": {"Wood": [1.0, 5, 5], "Stone": [1.0, 5, 5], "Metal": [1.0, 5, 5], "Cloth": [1.0, 5, 5]},
  "cheat_mysteries": {"Mysterious Coin": [1.0, 1, 1]},
  "cheat_forge": {"Wood": [1.0, 5, 5], "Stone": [1.0, 5, 5], "Metal": [1.0, 15, 15], "Cloth": [1.0, 5, 5]}

|
|

Materials - Exploration
-----------------------

.. code-block:: python
  :linenos:

  "orc_camp": {"Wood": [1.0, 1, 3], "Metal": [1.0, 1, 3], "Stone": [1.0, 1, 3], "Cloth": [1.0, 1, 3], "Mysterious Coin": [0.05, 1, 1]},
  "exp_house": {"Wood": [0.75, 2, 5], "Stone": [0.75, 1, 2], "Metal": [0.75, 1, 2], "Cloth": [0.75, 1, 4]},
  "exp_b_rape": {"Wood": [0.75, 1, 2], "Stone": [0.75, 1, 1], "Metal": [0.75, 1, 1], "Cloth": [1, 1, 2]},
  "exp_rose": {"Rose": [1.0, 1, 1], "Wood": [1.0, 1, 3]},
