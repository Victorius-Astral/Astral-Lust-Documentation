Dreams
======

Add new dreams
--------------
Create new label consisting of three parts:

* prefix ``d_`` - That's required for dream to be recognize as a dream
* name ``My_Dream_Name`` - Name of your dream, replace spaces with ``_``
* suffix ``_type`` - Category of your dream:
    * 0 - Normal / Positive - brings positive or no effect
    * 1 - Nightmare - brings negative effect
    * 2 - Wet - contains H scenes
    * 3 - Other - special or complex effects, can't be put in other category

Code should look like this:

.. code-block::
    :linenos:

    label d_Light_0:
        scene d 2 1 with fade
        "You open your eyes only to see a light."
        "The light illuminates the world."
        "You float amidst the clouds and enjoy the light shining on you."
        $player.corrupt(-3)
        "You fell purified."
        jump d_end

More label examples:

* ``label d_First_Love_2:``
* ``label d_Deal_with_the_Devil_3:``
* ``label d_Reccuring_Nightmare_1:``

Dreams should be ended with ``jump d_end`` - it's a generic dream ending it blackens the screen and executes sleep method, you can end the dream other way if you know what you are doing:

.. code-block::
    :linenos:

    label d_end:
        # Start to make the screen fade to darkness
        show screen blacken(ilosc = "50") with dissolve
        "You feel everything around fading away. You are awakening."
        pause 0.25
        show screen blacken(ilosc = "90") with dissolve
        pause 0.25
        show screen blacken(ilosc = "C0") with dissolve
        pause 0.25
        show screen blacken(ilosc = "FF") with dissolve
        pause 0.25

        # Restore player hp & sanity
        $player.sleep()

        # Stop all music and sound from dream
        stop music2 fadeout 1.0
        stop sound fadeout 1.0
        stop music fadeout 1.0

        # Play music depending on location
        if "room_hotel" in player.location:
            play music persistent.music_hotel fadein 1.0

        # Return to the label
        return

Change dream chance
-------------------
To change the base dreams chance you need to change ``dream_base_chance`` variable, like this:

.. code-block:: python

    init 11 python:
        # Float, 1.0 for 100% chance, 0.0 for 0% chance.
        dream_base_chance = 0.4
