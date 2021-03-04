.. _tab_cards:

Cards
=====

Add new cards
-------------

To add new cards you need to create your cards as a child of Card class. Action to be done on card use is to be contained in ``play()`` method.

.. code-block:: python
    :linenos:

    class Take_Cover(Card):
        def __init__(self):
            # card name / .webp image name
            self.name = "Take Cover"
            # spirituality cost
            self.sp = 2
            # category: Offensive, Defensive, Ability, Power, Tarot
            self.ca = "Defensive"
            # rarity: Ordinary, Extraordinary, Mythical, Angelic, Divine, Unique, Tarot
            self.ra = "Extraordinary"
            # Help to be displayed when card is hovered
            self.tip = '>   Block:\n'+str(player.eff['Block'][1])+'\n\n>   Dodge:\n' + str(player.eff['Dodge'][1])

        def play(self, **kwargs):
            self.block(amt = 10, target = player)
            self.dodge(amt = 10, target = player)
            return

Cards Images
------------

Start by either creating your own or downloading vanilla card templates:

* `PNG`_
* `WebP`_

When using my template you should:

* Put card art behind the template (so it's visible in the middle)
* Name the card at the top
* Define card spirit cost to the right of card name
* Choose correct card rarity & type from templates
* Describe it's effects below card type

Cards need to be:

* Named like the card name attribute
* Placed in ``AstralLust\game\images\Cards\`` directory
* Saved in ``.webp`` format, I recommend using `Bulk Images to WebP Converter`_ for Chrome with 90% quality
* Resolution should follow: 13:20 proportions. Default resolution for 4K is 650x1000, for 1080p 325x500. It's not recommended to make cards above 4K default resolution for optimization reasons. You don't need to make two sets of cards for 4K and 1080p, but low res cards will help optimization.

You can make cards in any image editor like paint, paint.net, gimp, photoshoot, etc.

.. _PNG: https://mega.nz/file/pEFinb4Z#1oqqwYZDSw-y59x4duEUgZHzy1VJeODrlm5YkPqnmg8
.. _WebP: https://mega.nz/file/oQdGgbaY#1uyIFXBjnBo12yXgEV7plqS3_B895ff-eVFgiJpq4WI
.. _Bulk Images to WebP Converter : https://chrome.google.com/webstore/detail/bulk-images-to-webp-conve/alehapkmecbigebjbcicmbmjdaolcjhb

Status Effects
--------------

Status effects are granted using buff(), it takes three arguments:

* ``buff`` - required, name of status effect - string,
* ``amt`` - required, status effect will be changed by this amount - depends on buff, either integer or boolean,
* ``minus`` - if status effect can take negative value - boolean, default ``True``

.. code-block:: python
    :linenos:

        def play(self, **kwargs):
            player.buff("Fire Immunity", True)
            enemy.buff("Ressurect", 1)
            return

Exhaust and Destroy
-------------------

Cards can be destroyed with ``self.destroy()``. To exhaust a card you need to return "exhaust" with ``play()``. Take note that ``destroy()`` removes card from your deck not hand/any pile, to make card disappear from combat return ``"exhaust"``.

.. code-block:: python
    :linenos:

    def play(self, **kwargs):
        ... card action ...

        self.destroy()
        return "exhaust"

X card cost
-----------

Set card cost to 0 and execute your action x times, at the end set ``player.spirit`` to 0:

.. code-block:: python
    :linenos:

    def play(self, **kwargs):
        # Attack x times
        self.atk(dmg = 4, target = enemy, times = player.spirit)

        # Do something x times
        for x in range(player.spirit):
            ... action ...

        # Set player spirit to 0
        player.spirit = 0

        return

Complex Effects
---------------

Returning "complex" with play() will skip using card cost and removing it from hand, it can be used with complex card effects that move/exhaust the card before return statement.

Other Card class methods
------------------------

* ``draw()`` - draw x cards:
    * ``amt`` - required, amount of cards to draw
    * ``min`` - minimum amount of cards to draw, default ``0``
    * ``discard`` - if discard hand before drawing cards, default ``False``
    * ``skip_discarded`` - if skip shuffling discard pile into draw pile if not enough cards, default ``True``
* ``steal()`` - steal enemy status effects:
    * ``times`` - how many effects to steal, default ``1``
* ``enemy_intention()`` - change enemy intention

.. _tab_cards_effects:

List of all status effects
--------------------------

Integer:

* ``Armor`` -Each turn increase block by x.
* ``Critic`` - Increase next damage dealt multiplied x times.
* ``Bleeding`` - Each turn deals x damage. Damage doubled if target has Frail. Decreases by 1 every turn.
* ``Block`` - Block up to x points of damage. Lasts till next turn.
* ``Dodge`` - Gives x% to avoid damage. Lasts till next turn. Dodge chance capped at 80%.
* ``Burning`` - Each turn deals 5 damage. Lasts x turns.
* ``Frail`` - Gain x less block. Decreases by 1 every turn.
* ``Invulnerability`` - Become immune to all damage. Lasts x turns.
* ``Life Steal`` - Heal for x% damage dealt.
* ``Poison`` - Each turn deals x damage. Damage doubled if target is bleeding. Decreases by 1 every turn.
* ``Regeneration`` - Each turn heals x health. Decreases by 1 after taking damage.
* ``Resurrect`` - Will resurrect with 50% of health after death.
* ``Strength`` - Deal x more damage. Decreases by 1 every turn.
* ``Stun`` - Unable to act for x turns.
* ``Thorns`` - Deal x before being attacked. Lasts till next turn.
* ``Weak`` - Deal 50% less damage. Lasts x turns.
* ``Vulnerable`` - Receive 50% more damage. Lasts x turns.
* ``Empower`` - Gain x strength every turn.
* ``Card Draw`` - Draw x more cards each turn.
* ``Clarity`` - Gain x spirituality each turn.
* ``Forbid Offensive`` - Can't play offensive cards for x turns.
* ``Forbid Defensive`` - Can't play defensive cards for x turns.
* ``Forbid Ability`` - Can't play ability cards for x turns.
* ``Forbid Power`` - Can't play power cards for x turns.
* ``Stealth`` - Gain x% dodge each turn.
* ``Spikes`` - Gain x thorns every turn.
* ``Forbid Tarot`` - Can't play tarot cards for x turns.
* ``Terror`` - 45% chance to lose turn. Lasts for x turns.
* ``Fury`` - Gain x strength on taking unblocked damage.

Boolean:

* ``Fire Immunity`` - Immune to burning.
* ``Poison Immunity`` - Immune to poison.
* ``Bleeding Immunity`` - Immune to bleeding.
* ``Stun Immunity`` - Can't be stunned.
* ``Freedom`` - Free from corruption and madness.
