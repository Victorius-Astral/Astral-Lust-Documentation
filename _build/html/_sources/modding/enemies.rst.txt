.. _tab_enemies:

Enemies
=======

Create new enemy
----------------

.. code-block:: python
    :linenos:

  class Werewolf(Enemy):
        def __init__(self, name = "Werewolf", hp = 180, hp_max = 180, po = 1, race = "Beast", poU = 0, poL = 0, img = "WerewolfA", loot = "werewolf", faction = "None", act = 1, str = 0, agi = 0, vit = 0, inte = 0, cha = 0, wis = 0, msize = "n", drop = "werewolf", flags = []):
          self.name = name # enemy showed name
                self.hp = hp # enemy health
                self.hp_max = hp_max # enemy maximum health
                self.po = po # enemy power
                self.race = race # enemy race eq. human, monster

                self.eff = copy.deepcopy(being.eff) # List of effect one can get in battle
                self.poU = poU # upper value of power randomization ( set both poU and poL to 0 to delete random damage values )
                self.poL = poL # lower value of power randomization

                self.img = img # Name of enemy .webp inside Enemy folder
                self.loot = loot # card Lootlist
                
                self.faction = faction # Enemy faction
                self.act = act # Action enemy would do in next turn

                # Initial cooldowns, this dict length must match amount of actions enemy can do
                self.cd = {
                1: 0,
                2: 0,
                3: 0,
                4: 0
                }

                self.strength = str # Not implemented, required for script to work
                self.agility = agi # Not implemented, required for script to work
                self.vitality = vit # Not implemented, required for script to work
                self.wisdom = wis # Not implemented, required for script to work
                self.intellect = inte # Not implemented, required for script to work
                self.charisma = cha # Not implemented, required for script to work
                self.spirit_max = 0 # Not implemented, required for script to work

                self.drop = drop # item lootlist
                self.msize = msize # arena's size (point of view): "n" - normal, "g" - giant, "t" - titan
                self.flags = flags # Empty list, can be used to add add flags to enemies in combat

        def action(self, **kwargs):
            global enemy_state
            note = ""
            avoid = []

            if self.eff['Stun'][0] > 0:
                self.eff['Stun'][0] -= 1
                note = self.name + " is stunned."
                self.end(note = note)
                return

            if self.act == 1:
                ### Basic Action
                enemy_state = "attack"
                self.atk(dmg = 14)
                note = " slashes you!"

            elif self.act == 2:
                ### 2nd Action
                self.heal(amt = 25)
                note = "'s injuries heal quickly."
                self.cold(2)

            elif self.act == 3:
                enemy_state = "attack"
                self.atk(dmg = 6, times = 3)
                player.buff("Bleeding", 3)
                note = " quickly slashes you three times!"
                self.cold(2)

            elif self.act == 4:
                enemy_state = "specialA"
                self.buff("Regeneration", 4)
                self.buff("Strength", 5)
                self.buff("Block", 10)
                note = " howls making it even more powerful!"
                self.cold(3)

            if note != "":
                note = self.name + note

            if self.hp > (self.hp_max - 25):
                avoid.append(2)

            self.end(note = note, avoid = avoid)

            return

        def intent(self):
            back = self.name + " wants to "
            if self.act == 1:
                return back + "attack."
            elif self.act == 2:
                if self.hp > (self.hp_max) - 25:
                    return back + "attack."
                else:
                    return back + "heal."
            elif self.act == 3:
                return back + "rip you apart!"
            elif self.act == 4:
                return back + "empower itself."
            else:
                return "Error 002 - Enemy action outside of possible action list."

Add enemy to generic combat
---------------------------

You can add new enemies to the generic combat by adding your enemy object to the list. There are four lists for enemies:

* gen_enemies_normal
* gen_enemies_elite
* gen_enemies_boss
* gen_enemies_elite_boss

They differ by encounter chance. The stronger the player the closer the chances are to being equal.

``gen_enemies_normal.append(My_Enemy())``

Create/Change lootlist and droplist
-----------------------------------

Lootlist contains only cards

Droplist contains only items

To create your lootlist you need to add your ``lootlist: loot`` to the ``lootlist`` dictionary.

.. code-block:: python
    :linenos:

    my_lootlist = {
        # Replace existing lootlist
        "werewolf": [My_Card(), ...],

        # New lootlist
        "my_loot": [Aharon(), My_Card2(), ...]
        }

    # Add & replace lootlist found in my_lootlist
    for x in my_lootlist:
        lootlist.update({x: my_lootlist[x]})

Above code adds your lootlist to the game and replaces the ones in game with your replacements
