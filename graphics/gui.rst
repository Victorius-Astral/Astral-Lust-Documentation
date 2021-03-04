.. _tab_gui:

GUI Configuration
=================

As you know, there are two official versions of the Astral Lust: 4K and 1080p.

You can change gui sizes using below code:

.. code-block:: python
  :linenos:

  init 11 python:

    # Change 10 to amount of pixels you want,
    # choose the size that would be in 4K version (even if you do it for 1080p version),
    # game will automatically resize it according to game version.
    gui.variable = int(math.ceil(10 / gui.game_mode))

|
|

Menus
-----

Add new menu
~~~~~~~~~~~~

To add new menu to extended menu (top right corner) we need to do the following steps:

* Choose menu icon
* Create menu's screen
* Add our icon and screen to ``gui_menus`` as a pair

You can get your icon from `Game-icons.net <https://game-icons.net/>`_ or `Iconpacks.net <https://www.iconpacks.net/>`_.
Of course if you feel creative feel free to make your icon, yourself.
Icons should always have 128x128 resolution, to be clear enough, game will rescale it on its own according to 4K or 1080p game version.

You can put them wherever you want. I would recommend your own mod's folder.

Now that the icon is waiting, ready to be displayed, we need to create our in-game screen.
Check documentation below to learn how to make screens. You can always only modify my example, but it's good to be creative.

`Screens and Screen Language <https://www.renpy.org/doc/html/screens.html?highlight=screens#screens-and-screen-language>`_

.. code-block:: python
  :linenos:

  # That's my easiest menu screen to learn from (below more complex example)
  # First we need to define our screen as shown below. Do this with -> screen my_screen():
  screen rpg_menu_characteristics():

    # screens with higher zorder show above screens with lower zorder.
    # All my menus have 90 zorder. If you don't specify zorder it'll be the default of 0
    zorder 90

    # Drag allows us to move our menu around the screen
    drag:

      # align(0.5, 0.5) means that menu will appear in the middle of the screen
      align (0.5,0.5)

      # dropable means that we can drop the menu somewhere else and it'll stay there
      droppable True

      # Frame is, well a frame, you can understand it as background for menu
      frame:

        # Ensures nice padding so that text isn't on menus edge
        padding (gui.game_spacing_small, gui.game_spacing_small)

        # background color, it needs to be hex code (for color), here it is #000000 -> pitch black with D5 opacity
        background "#000000D5"

        # Container for our content, it makes all it's children (things place inside) to appear under the previous child
        vbox:

          # Displays text
          text "Characteristics coming soon."

|

* `Screens and Screen Language <https://www.renpy.org/doc/html/screens.html?highlight=screens#screens-and-screen-language>`_
* `Screens and Python <https://www.renpy.org/doc/html/screen_python.html?highlight=screen#screens-and-python>`_
* `Style Properties <https://www.renpy.org/doc/html/style_properties.html#style-properties>`_
* `Displayables <https://www.renpy.org/doc/html/displayables.html#displayables>`_

.. code-block:: python
  :linenos:

  screen rpg_menu_quests():
    zorder 90
    drag:
      align (0.5,0.5)
      droppable True

      frame:
        padding (gui.game_spacing, gui.game_spacing_small)
        background "#000000D5"
        xsize gui.game_width / 3

        vbox:
          spacing gui.game_spacing_mini
          xfill True
          hbox:
            xalign 0.5
            button:
              xalign 0.5

              # On click set _in_codex to False
              action SetVariable("_in_codex", False)

              frame at guzik_hover:
                  align (0.5, 0.5)
                  background guzik
                  padding (gui.game_spacing_small, gui.game_spacing_small)
                  text "Journal" size gui.game_text

            button:
              xalign 0.5

              # On click set _in_codex to True
              action SetVariable("_in_codex", True)

              frame at guzik_hover:
                align (0.5, 0.5)

                # Shows my button image as a background, to learn how to make your own image backgrounds check Displayables link above
                background guzik

                padding (gui.game_spacing_small, gui.game_spacing_small)
                text "Codex" size gui.game_text

          if _in_codex:

            # Shows rpg_codex screen if _in_codex = True
            use rpg_codex

          else:

            # Otherwise show rpg_journal screen
            use rpg_journal

Now we need to only add our icon and screen to ``gui_menus``.

.. code-block:: python

  init 11 python:

    # First we add icon path, relative to game folder
    gui_menus.append("pathToIcon/icon ouricon.webp")

    # Then we add screen this icon launches
    gui_menus.append("our_screen")

    # For example, we have screen rpg_sample_menu and icon in mods/Sample Mod, the icon is sample.webp
    # We will execute this example like this:
    gui_menus.append("mods/Sample Mod/icon sample.webp")
    gui_menus.append("rpg_sample_menu")

|
|

Change menu icons
~~~~~~~~~~~~~~~~~

To change existing menu icons you need to change it's entry in ``gui_menus``.

.. code-block:: python
  :linenos:

  # This is the list of vanilla icons
  define gui_menus = [ # Menus to appear on extended menu, | icon_path, screen to show on click
    # First line is [0], [1]. Next line is [2], [3], etc.
    "Icons/icon backpack.webp", "rpg_menu_backpack",
    "Icons/icon character.webp", "rpg_menu_character",
    "Icons/icon cards.webp", "show_deck",
    "Icons/icon characteristics.webp", "rpg_menu_characteristics",
    "Icons/icon quests.webp", "rpg_menu_quests",
    "Icons/icon girls.webp", "rpg_menu_girls"
  ]

  # Change it like this
  init 11 python:

    # Icon, you need to refer to index number, it starts with [0], then it increases by one after every | , |.
    gui_menus[0] = "newiconspath/icon"

    # Screen to show on click
    gui_menus[1] = "my_new_screen"

|
|

List of all GUI variables
-------------------------

General
~~~~~~~

.. code-block:: python
  :linenos:

  ## General
  ## Example: define gui.game_ = int(math.ceil( / gui.game_mode))
  define gui.game_width = int(math.ceil(3840 / gui.game_mode))
  define gui.game_height = int(math.ceil(2160 / gui.game_mode))
  define gui.game_spacing_mini = int(math.ceil(10 / gui.game_mode))
  define gui.game_spacing_very_small = int(math.ceil(25 / gui.game_mode))
  define gui.game_spacing_small = int(math.ceil(30 / gui.game_mode))
  define gui.game_spacing = int(math.ceil(40 / gui.game_mode))
  define gui.game_spacing_plus = int(math.ceil(45 / gui.game_mode))
  define gui.game_spacing_wrap = int(math.ceil(50 / gui.game_mode))
  define gui.game_icons = int(math.ceil(128 / gui.game_mode))
  define gui.game_icons_small = int(math.ceil(64 / gui.game_mode))
  define gui.game_width_half = int(math.ceil(gui.game_width / 2))
  define gui.game_height_half = int(math.ceil(gui.game_height / 2))

|

Emoticons
~~~~~~~~~

.. code-block:: python
  :linenos:

  ## Emoticons
  ## Example: define gui.emo_ = int(math.ceil( / gui.game_mode))
  define gui.emo_x = int(math.ceil(32 / gui.game_mode))
  define gui.emo_y = int(math.ceil(32 / gui.game_mode))
  define gui.emo_posx = int(math.ceil(580 / gui.game_mode))
  define gui.emo_posy = int(math.ceil(180 / gui.game_mode))

|

Text sizes
~~~~~~~~~~

.. code-block:: python
  :linenos:

  ## Text sizes
  ## Example: define gui.game_text_ = int(math.ceil( / gui.game_mode))
  define gui.game_text_very_small = int(math.ceil(30 / gui.game_mode))
  define gui.game_text_menu = int(math.ceil(36 / gui.game_mode))
  define gui.game_text_small = int(math.ceil(40 / gui.game_mode))
  define gui.game_text = int(math.ceil(46 / gui.game_mode))
  define gui.game_text_medium = int(math.ceil(55 / gui.game_mode))
  define gui.game_text_ind = int(math.ceil(60 / gui.game_mode))

|

Collectibles
~~~~~~~~~~~~

.. code-block:: python
  :linenos:

  ## Collectibles
  ## Example: : [int(math.ceil( / gui.game_mode)), int(math.ceil( / gui.game_mode))],
  define gui.col = {  # col nr: [xpos, ypos]
    # player
    0: [int(math.ceil(260 / gui.game_mode)), int(math.ceil(693 / gui.game_mode))],
    1: [int(math.ceil(1747 / gui.game_mode)), int(math.ceil(310 / gui.game_mode))],
    2: [int(math.ceil(3046 / gui.game_mode)), int(math.ceil(2123 / gui.game_mode))],
    # lexi
    3: [int(math.ceil(114 / gui.game_mode)), int(math.ceil(1138 / gui.game_mode))],
    4: [int(math.ceil(1876 / gui.game_mode)), int(math.ceil(642 / gui.game_mode))],
    5: [int(math.ceil(3600 / gui.game_mode)), int(math.ceil(1939 / gui.game_mode))],
    # f1 (a & b)
    6: [int(math.ceil(1277 / gui.game_mode)), int(math.ceil(958 / gui.game_mode))],
    7: [int(math.ceil(1900 / gui.game_mode)), int(math.ceil(739 / gui.game_mode))],
    8: [int(math.ceil(1341 / gui.game_mode)), int(math.ceil(608 / gui.game_mode))],
    # grace
    9: [int(math.ceil(2445 / gui.game_mode)), int(math.ceil(500 / gui.game_mode))],
    10: [0, int(math.ceil(155 / gui.game_mode))],
    11: [int(math.ceil(441 / gui.game_mode)), int(math.ceil(1476 / gui.game_mode))],
    # alice
    12: [int(math.ceil(3676 / gui.game_mode)), int(math.ceil(1146 / gui.game_mode))],
    13: [int(math.ceil(1363 / gui.game_mode)), int(math.ceil(109 / gui.game_mode))],
    14: [int(math.ceil(1755 / gui.game_mode)), int(math.ceil(2037 / gui.game_mode))],
    # lobby
    15: [int(math.ceil(3570 / gui.game_mode)), int(math.ceil(620 / gui.game_mode))],
    16: [int(math.ceil(710 / gui.game_mode)), int(math.ceil(555 / gui.game_mode))],
    17: [int(math.ceil(1752 / gui.game_mode)), int(math.ceil(236 / gui.game_mode))],
    # library
    18: [int(math.ceil(100 / gui.game_mode)), int(math.ceil(2066 / gui.game_mode))],
    19: [int(math.ceil(3672 / gui.game_mode)), int(math.ceil(1086 / gui.game_mode))],
    20: [int(math.ceil(3429 / gui.game_mode)), int(math.ceil(1144 / gui.game_mode))],
    21: [int(math.ceil(1022 / gui.game_mode)), int(math.ceil(881 / gui.game_mode))],
    22: [int(math.ceil(1668 / gui.game_mode)), int(math.ceil(411 / gui.game_mode))],
    23: [int(math.ceil(2196 / gui.game_mode)), int(math.ceil(665 / gui.game_mode))],
    24: [int(math.ceil(2411 / gui.game_mode)), int(math.ceil(647 / gui.game_mode))]
  }

|

Battle
~~~~~~

.. code-block:: python
  :linenos:

  ## Battle / Fight / Combat
  ## Example: define gui.battle_ = int(math.ceil( / gui.game_mode))
  define gui.battle_pile_xsize = int(math.ceil(260 / gui.game_mode))
  define gui.battle_pile_ysize = int(math.ceil(400 / gui.game_mode))
  define gui.battle_card_xsize_small = int(math.ceil(390 / gui.game_mode))
  define gui.battle_card_ysize_small = int(math.ceil(600 / gui.game_mode))
  define gui.battle_card_yoffset_small = int(math.ceil(90 / gui.game_mode))
  define gui.battle_card_xsize_medium = int(math.ceil(520 / gui.game_mode))
  define gui.battle_card_ysize_medium = int(math.ceil(800 / gui.game_mode))
  define gui.battle_card_yoffset_medium = int(math.ceil(-65 / gui.game_mode))
  define gui.battle_spirit_size = int(math.ceil(260 / gui.game_mode))
  define gui.battle_enemy_hp_icon_size = int(math.ceil(260 / gui.game_mode))
  define gui.battle_hp_icon_size = int(math.ceil(150 / gui.game_mode))
  define gui.battle_effects_icons = int(math.ceil(128 / gui.game_mode))
  define gui.battle_end_turn_size = int(math.ceil(260 / gui.game_mode))
  define gui.battle_enemy_hp_bar_xsize = int(math.ceil(1200 / gui.game_mode))
  define gui.battle_enemy_hp_bar_ysize = int(math.ceil(100 / gui.game_mode))
  define gui.battle_enemy_hp_bar_ypos = int(math.ceil(40 / gui.game_mode))
  define gui.battle_enemy_hp_text_yoffset = int(math.ceil(-5 / gui.game_mode))
  define gui.battle_enemy_name_yoffset = int(math.ceil(80 / gui.game_mode))
  define gui.battle_enemy_hp_icon_ypos = int(math.ceil(-68 / gui.game_mode))
  define gui.battle_enemy_hp_icon_xoffset = int(math.ceil(-565 / gui.game_mode))
  define gui.battle_intention_ypos_expanded = int(math.ceil(140 / gui.game_mode))
  define gui.battle_intention_xoffset = int(math.ceil(750 / gui.game_mode))
  define gui.battle_intention_xmaximum = int(math.ceil(600 / gui.game_mode))
  define gui.battle_intention_ypos = int(math.ceil(50 / gui.game_mode))
  define gui.battle_enemy_effects_xmaximum = int(math.ceil(1200 / gui.game_mode))
  define gui.battle_enemy_effects_ypos = int(math.ceil(200 / gui.game_mode))
  define gui.battle_enemy_effects_spacing = int(math.ceil(20 / gui.game_mode))
  define gui.battle_enemy_effects_size = int(math.ceil(128 / gui.game_mode))
  define gui.battle_enemy_effects_text_ycenter = int(math.ceil(64 / gui.game_mode))
  define gui.battle_enemy_effects_text_xcenter = int(math.ceil(64 / gui.game_mode))
  define gui.battle_enemy_effects_text_yoffset = int(math.ceil(84 / gui.game_mode))
  define gui.battle_left_margin = int(math.ceil(80 / gui.game_mode))
  define gui.battle_draw_pile_xcenter = int(math.ceil(210 / gui.game_mode))
  define gui.battle_draw_pile_ycenter = int(math.ceil(1830 / gui.game_mode))
  define gui.battle_spirit_xcenter = int(math.ceil(210 / gui.game_mode))
  define gui.battle_spirit_ypos = int(math.ceil(1345 / gui.game_mode))
  define gui.battle_spirit_text_ypos = int(math.ceil(1425 / gui.game_mode))
  define gui.battle_effects_ymaximum = int(math.ceil(1200 / gui.game_mode))
  define gui.battle_effects_size = int(math.ceil(128 / gui.game_mode))
  define gui.battle_effects_text_ycenter = int(math.ceil(64 / gui.game_mode))
  define gui.battle_effects_text_xcenter = int(math.ceil(64 / gui.game_mode))
  define gui.battle_effects_text_xoffset = int(math.ceil(-90 / gui.game_mode))
  define gui.battle_effects_frame_xminimum = int(math.ceil(400 / gui.game_mode))
  define gui.battle_effects_frame_padding = int(math.ceil(20 / gui.game_mode))
  define gui.battle_effects_frame_xcenter = int(math.ceil(64 / gui.game_mode))
  define gui.battle_effects_frame_ypos = int(math.ceil(32 / gui.game_mode))
  define gui.battle_effects_frame_xoffset = int(math.ceil(300 / gui.game_mode))
  define gui.battle_discard_pile_xcenter = int(math.ceil(3630 / gui.game_mode))
  define gui.battle_discard_pile_ycenter = int(math.ceil(1830 / gui.game_mode))
  define gui.battle_turn_xcenter = int(math.ceil(3630 / gui.game_mode))
  define gui.battle_turn_ycenter = int(math.ceil(1480 / gui.game_mode))
  define gui.battle_tooltip_ypos = int(math.ceil(200 / gui.game_mode))
  define gui.battle_tooltip_xoffset = int(math.ceil(-20 / gui.game_mode))
  define gui.battle_tooltip_xmaximum = int(math.ceil(600 / gui.game_mode))
  define gui.battle_hp_xsize = int(math.ceil(260 / gui.game_mode))
  define gui.battle_hp_ysize = int(math.ceil(50 / gui.game_mode))
  define gui.battle_hp_xcenter = int(math.ceil(215 / gui.game_mode))
  define gui.battle_hp_ycenter = int(math.ceil(1290 / gui.game_mode))
  define gui.battle_hp_icon_xoffset = int(math.ceil(-120 / gui.game_mode))
  define gui.battle_tool_xmaximum = int(math.ceil(480 / gui.game_mode))
  define gui.battle_tool_padding = int(math.ceil(20 / gui.game_mode))
  define gui.battle_tool_xpos = int(math.ceil(350 / gui.game_mode))
  define gui.battle_tool_ypos = int(math.ceil(1345 / gui.game_mode))
  define gui.battle_turn_counter_spacing = int(math.ceil(30 / gui.game_mode))
  define gui.battle_turn_counter_ysize = int(math.ceil(100 / gui.game_mode))
  define gui.battle_hand_ycenter = int(math.ceil(1800 / gui.game_mode))
  define gui.battle_card_btn_small_yoffset = int(math.ceil(180 / gui.game_mode))
  define gui.battle_card_btn_medium_yoffset = int(math.ceil(-125 / gui.game_mode))
  define gui.battle_ind_p_xcenter = int(math.ceil(215 / gui.game_mode))
  define gui.battle_ind_p_ycenter = int(math.ceil(1290 / gui.game_mode))
  define gui.battle_ind_x = int(math.ceil(15 / gui.game_mode))
  define gui.battle_ind_y = int(math.ceil(30 / gui.game_mode))
  define gui.battle_ind_yoffset = int(math.ceil(-50 / gui.game_mode))

|

Interface
~~~~~~~~~

.. code-block:: python
  :linenos:

  ## Interface
  ## Example: define gui.inter_ = int(math.ceil( / gui.game_mode))
  define gui.inter_notify_ypos = int(math.ceil(380 / gui.game_mode))
  define gui.inter_notify_ypadding = int(math.ceil(10 / gui.game_mode))
  define gui.inter_notify_right_padding = int(math.ceil(160 / gui.game_mode))
  define gui.inter_loot_choices_ycenter = int(math.ceil(780 / gui.game_mode))
  define gui.inter_loot_tooltip_yoffset = int(math.ceil(500 / gui.game_mode))
  define gui.inter_loot_tooltip_xmaximum = int(math.ceil(600 / gui.game_mode))
  define gui.inter_loot_skip_yoffset = int(math.ceil(240 / gui.game_mode))
  define gui.inter_deck_display_xoffset = int(math.ceil(-1500 / gui.game_mode))
  define gui.inter_deck_display_yoffset = int(math.ceil(150 / gui.game_mode))
  define gui.inter_deck_card_xsize_small = int(math.ceil(325 / gui.game_mode))
  define gui.inter_deck_card_ysize_small = int(math.ceil(500 / gui.game_mode))
  define gui.inter_deck_card_xsize_medium = int(math.ceil(390 / gui.game_mode))
  define gui.inter_deck_card_ysize_medium = int(math.ceil(600 / gui.game_mode))
  define gui.inter_deck_card_yoffset = int(math.ceil(-50 / gui.game_mode))
  define gui.inter_deck_null_width = int(math.ceil(160 / gui.game_mode))
  define gui.inter_deck_null_height = int(math.ceil(10 / gui.game_mode))
  define gui.inter_deck_null2_height = int(math.ceil(130 / gui.game_mode))
  define gui.inter_deck_null2_width = int(math.ceil(3760 / gui.game_mode))
  define gui.inter_deck_exit_xcenter = int(math.ceil(3600 / gui.game_mode))
  define gui.inter_deck_exit_ycenter = int(math.ceil(64 / gui.game_mode))
  define gui.inter_vault_xoffset = int(math.ceil(600 / gui.game_mode))
  define gui.inter_save_width = int(math.ceil(768 / gui.game_mode))
  define gui.inter_save_height = int(math.ceil(432 / gui.game_mode))
  define gui.inter_notify_yoffset = int(math.ceil(100 / gui.game_mode))
  define gui.inter_char_tooltip_xoffset = int(math.ceil(550 / gui.game_mode))
  define gui.inter_char_tooltip_xmaximum = int(math.ceil(900 / gui.game_mode))
  define gui.inter_trade_yoffset = int(math.ceil(250 / gui.game_mode))
  define gui.inter_trade_yoffset_small = int(math.ceil(100 / gui.game_mode))
  define gui.inter_trade_yoffset_half = int(math.ceil(50 / gui.game_mode))
  define gui.inter_trade_margin = int(math.ceil(400 / gui.game_mode))
  define gui.inter_trade_margin_tb = int(math.ceil(200 / gui.game_mode))
  define gui.inter_trade_marginx2 = gui.inter_trade_margin * 2
  define gui.inter_trade_xoffset = int(math.ceil(380 / gui.game_mode))
  define gui.inter_trade_icon = int(math.ceil(gui.game_text_menu * 2.8 / gui.game_mode))
  define gui.inter_hollow_xsize = int(math.ceil(676 / gui.game_mode))
  define gui.inter_hollow_ypos = int(math.ceil(460 / gui.game_mode))
  define gui.inter_menu_spacing = int(math.ceil(200 / gui.game_mode))

|

Masks
~~~~~

.. code-block:: python
  :linenos:

  ## Masks
  ## Example: define gui.mask_ = [int(math.ceil( / gui.game_mode)), int(math.ceil( / gui.game_mode))] # [xpos, ypos]
  define gui.mask_lexi_door = [int(math.ceil(857 / gui.game_mode)), int(math.ceil(135 / gui.game_mode))]
  define gui.mask_lexi_document = [int(math.ceil(2889 / gui.game_mode)), int(math.ceil(670 / gui.game_mode))]
  define gui.mask_lexi_laptop = [int(math.ceil(3032 / gui.game_mode)), int(math.ceil(613 / gui.game_mode))]
  define gui.mask_lexi_pc = [int(math.ceil(2790 / gui.game_mode)), int(math.ceil(555 / gui.game_mode))]
  define gui.mask_lexi_sleep = [int(math.ceil(2025 / gui.game_mode)), int(math.ceil(961 / gui.game_mode))]
  define gui.mask_lexi_boxes = [int(math.ceil(1867 / gui.game_mode)), int(math.ceil(377 / gui.game_mode))]
  define gui.mask_lexi_sofa = [int(math.ceil(523 / gui.game_mode)), int(math.ceil(647 / gui.game_mode))]
  define gui.mask_mina_pc = [int(math.ceil(2797 / gui.game_mode)), int(math.ceil(548 / gui.game_mode))]
  define gui.mask_mina_sofa = [int(math.ceil(520 / gui.game_mode)), int(math.ceil(513 / gui.game_mode))]
  define gui.mask_mina_bed = [int(math.ceil(1867 / gui.game_mode)), int(math.ceil(815 / gui.game_mode))]
  define gui.mask_player_door = [int(math.ceil(850 / gui.game_mode)), int(math.ceil(88 / gui.game_mode))]
  define gui.mask_player_pc = [int(math.ceil(2267 / gui.game_mode)), int(math.ceil(401 / gui.game_mode))]
  define gui.mask_player_mirror = [int(math.ceil(1576 / gui.game_mode)), int(math.ceil(0 / gui.game_mode))]
  define gui.mask_player_bed = [int(math.ceil(1823 / gui.game_mode)), int(math.ceil(880 / gui.game_mode))]
  define gui.mask_player_cube = [int(math.ceil(3042 / gui.game_mode)), int(math.ceil(1822 / gui.game_mode))]
  define gui.mask_player_books = [int(math.ceil(3164 / gui.game_mode)), int(math.ceil(1931 / gui.game_mode))]
  define gui.mask_player_altar = [int(math.ceil(296 / gui.game_mode)), int(math.ceil(1092 / gui.game_mode))]
  define gui.mask_player_chest = [int(math.ceil(1816 / gui.game_mode)), int(math.ceil(875 / gui.game_mode))]
  define gui.mask_player_grey_cupboard = [int(math.ceil(2424 / gui.game_mode)), int(math.ceil(550 / gui.game_mode))]
  define gui.mask_player_white_cupboard = [int(math.ceil(2344 / gui.game_mode)), int(math.ceil(576 / gui.game_mode))]
  define gui.mask_player_wardrobe = [int(math.ceil(2912 / gui.game_mode)), int(math.ceil(153 / gui.game_mode))]
  define gui.mask_cat_pc = [int(math.ceil(2469 / gui.game_mode)), int(math.ceil(476 / gui.game_mode))]
  define gui.mask_cat_sleep = [int(math.ceil(2075 / gui.game_mode)), int(math.ceil(1004 / gui.game_mode))]
  define gui.mask_dog_sofa = [int(math.ceil(439 / gui.game_mode)), int(math.ceil(673 / gui.game_mode))]
  define gui.mask_dog_sleep = [int(math.ceil(1675 / gui.game_mode)), int(math.ceil(1215 / gui.game_mode))]
  define gui.mask_f1a_alice = [int(math.ceil(2273 / gui.game_mode)), int(math.ceil(179 / gui.game_mode))]
  define gui.mask_f1a_lexi = [int(math.ceil(2746 / gui.game_mode)), int(math.ceil(65 / gui.game_mode))]
  define gui.mask_f1a_grace = [int(math.ceil(1430 / gui.game_mode)), int(math.ceil(174 / gui.game_mode))]
  define gui.mask_f1a_f2 = [int(math.ceil(1805 / gui.game_mode)), int(math.ceil(76 / gui.game_mode))]
  define gui.mask_f1a_lobby = [int(math.ceil(1630 / gui.game_mode)), int(math.ceil(360 / gui.game_mode))]
  define gui.mask_f1a_f1b = [int(math.ceil(1850 / gui.game_mode)), int(math.ceil(550 / gui.game_mode))]
  define gui.mask_f1a_cupboard = [int(math.ceil(1203 / gui.game_mode)), int(math.ceil(607 / gui.game_mode))]
  define gui.mask_f1a_grace_clean = [int(math.ceil(2004 / gui.game_mode)), int(math.ceil(300 / gui.game_mode))]
  define gui.mask_f1b_grace = [int(math.ceil(2529 / gui.game_mode)), int(math.ceil(309 / gui.game_mode))]
  define gui.mask_f1b_alice = [int(math.ceil(912 / gui.game_mode)), int(math.ceil(243 / gui.game_mode))]
  define gui.mask_f1b_lexi = [int(math.ceil(1538 / gui.game_mode)), int(math.ceil(442 / gui.game_mode))]
  define gui.mask_f1b_player = [int(math.ceil(2223 / gui.game_mode)), int(math.ceil(454 / gui.game_mode))]
  define gui.mask_f1b_f2 = [int(math.ceil(480 / gui.game_mode)), int(math.ceil(1700 / gui.game_mode))]
  define gui.mask_f1b_lobby = [int(math.ceil(3000 / gui.game_mode)), int(math.ceil(1750 / gui.game_mode))]
  define gui.mask_f1b_f1a = [int(math.ceil(1842 / gui.game_mode)), int(math.ceil(1750 / gui.game_mode))]
  define gui.mask_f1b_cupboard = [int(math.ceil(2233 / gui.game_mode)), int(math.ceil(699 / gui.game_mode))]
  define gui.mask_f1b_grace_clean = [int(math.ceil(1598 / gui.game_mode)), int(math.ceil(504 / gui.game_mode))]
  define gui.mask_grace_door = [int(math.ceil(859 / gui.game_mode)), int(math.ceil(136 / gui.game_mode))]
  define gui.mask_grace_coffee = [int(math.ceil(2218 / gui.game_mode)), int(math.ceil(521 / gui.game_mode))]
  define gui.mask_grace_watering1 = [int(math.ceil(406 / gui.game_mode)), int(math.ceil(482 / gui.game_mode))]
  define gui.mask_grace_watering2 = [int(math.ceil(500 / gui.game_mode)), int(math.ceil(940 / gui.game_mode))]
  define gui.mask_grace_fox = [int(math.ceil(1467 / gui.game_mode)), int(math.ceil(270 / gui.game_mode))]
  define gui.mask_grace_sleep = [int(math.ceil(2715 / gui.game_mode)), int(math.ceil(1272 / gui.game_mode))]
  define gui.mask_alice_door = [int(math.ceil(728 / gui.game_mode)), int(math.ceil(136 / gui.game_mode))]
  define gui.mask_alice_tv = [int(math.ceil(2283 / gui.game_mode)), int(math.ceil(335 / gui.game_mode))]
  define gui.mask_alice_shelf = [int(math.ceil(2115 / gui.game_mode)), int(math.ceil(605 / gui.game_mode))]
  define gui.mask_alice_person_tv = [int(math.ceil(1601 / gui.game_mode)), int(math.ceil(551 / gui.game_mode))]
  define gui.mask_alice_clothes = [int(math.ceil(61 / gui.game_mode)), int(math.ceil(624 / gui.game_mode))]
  define gui.mask_alice_sleep = [int(math.ceil(2745 / gui.game_mode)), int(math.ceil(1131 / gui.game_mode))]
  define gui.mask_wc_f0 = [int(math.ceil(1600 / gui.game_mode)), int(math.ceil(1600 / gui.game_mode))]
  define gui.mask_f0_kitchen = int(math.ceil(3062 / gui.game_mode))
  define gui.mask_f0_wc = [int(math.ceil(2501 / gui.game_mode)), int(math.ceil(109 / gui.game_mode))]
  define gui.mask_f0_bath = [int(math.ceil(1438 / gui.game_mode)), int(math.ceil(111 / gui.game_mode))]
  define gui.mask_f0_dog = [int(math.ceil(1311 / gui.game_mode)), int(math.ceil(534 / gui.game_mode))]
  define gui.mask_bath_f0 = [int(math.ceil(1800 / gui.game_mode)), int(math.ceil(1700 / gui.game_mode))]
  define gui.mask_kitchen_f0 = [int(math.ceil(1800 / gui.game_mode)), int(math.ceil(1600 / gui.game_mode))]
  define gui.mask_kitchen_fridge = [int(math.ceil(2922 / gui.game_mode)), int(math.ceil(372 / gui.game_mode))]
  define gui.mask_kitchen_cat = [int(math.ceil(2095 / gui.game_mode)), int(math.ceil(195 / gui.game_mode))]
  define gui.mask_kitchen_cooking1 = [int(math.ceil(1309 / gui.game_mode)), int(math.ceil(186 / gui.game_mode))]
  define gui.mask_lobby_f0 = [int(math.ceil(1644 / gui.game_mode)), int(math.ceil(103 / gui.game_mode))]
  define gui.mask_lobby_door2 = [int(math.ceil(3025 / gui.game_mode)), int(math.ceil(92 / gui.game_mode))]
  define gui.mask_lobby_f1 = [int(math.ceil(2111 / gui.game_mode)), int(math.ceil(0 / gui.game_mode))]
  define gui.mask_lobby_door = [int(math.ceil(255 / gui.game_mode)), int(math.ceil(900 / gui.game_mode))]
  define gui.mask_lobby_counter = [int(math.ceil(1768 / gui.game_mode)), int(math.ceil(329 / gui.game_mode))]
  define gui.mask_lobby_cat = [int(math.ceil(3180 / gui.game_mode)), int(math.ceil(495 / gui.game_mode))]
  define gui.mask_lobby_dog = [int(math.ceil(1012 / gui.game_mode)), int(math.ceil(338 / gui.game_mode))]
  define gui.mask_lobby_clean_l = [int(math.ceil(1295 / gui.game_mode)), int(math.ceil(207 / gui.game_mode))]
  define gui.mask_vault_lobby = int(math.ceil(1762 / gui.game_mode))
  define gui.mask_vault_chest = [int(math.ceil(1807 / gui.game_mode)), int(math.ceil(721 / gui.game_mode))]
  define gui.mask_forge_create = [int(math.ceil(1055 / gui.game_mode)), int(math.ceil(805 / gui.game_mode))]
  define gui.mask_forge_upgrade = [int(math.ceil(2128 / gui.game_mode)), int(math.ceil(859 / gui.game_mode))]
  define gui.mask_forge_destroy = [int(math.ceil(1454 / gui.game_mode)), int(math.ceil(661 / gui.game_mode))]
  define gui.mask_gym_lobby = int(math.ceil(1806 / gui.game_mode))
  define gui.mask_gym_agi = [int(math.ceil(480 / gui.game_mode)), int(math.ceil(227 / gui.game_mode))]
  define gui.mask_gym_str = [int(math.ceil(1697 / gui.game_mode)), int(math.ceil(214 / gui.game_mode))]
  define gui.mask_gym_vit = [int(math.ceil(2080 / gui.game_mode)), int(math.ceil(262 / gui.game_mode))]
  define gui.mask_gym_alice = [int(math.ceil(2180 / gui.game_mode)), int(math.ceil(0 / gui.game_mode))]
  define gui.mask_lib_door = [int(math.ceil(3075 / gui.game_mode)), int(math.ceil(380 / gui.game_mode))]
  define gui.mask_lib_books_r = [int(math.ceil(1838 / gui.game_mode)), int(math.ceil(282 / gui.game_mode))]
  define gui.mask_lib_books_l = [int(math.ceil(1121 / gui.game_mode)), int(math.ceil(299 / gui.game_mode))]
  define gui.mask_kiara_desk = [int(math.ceil(1855 / gui.game_mode)), int(math.ceil(555 / gui.game_mode))]
  define gui.mask_lib_hotel = [int(math.ceil(3286 / gui.game_mode)), int(math.ceil(1675 / gui.game_mode))]
  define gui.mask_lib_mt_xpos = int(math.ceil(500 / gui.game_mode))
  define gui.mask_dungeon_playroom = [int(math.ceil(475 / gui.game_mode)), int(math.ceil(1478 / gui.game_mode))]
  define gui.mask_dungeon_cells = [int(math.ceil(1492 / gui.game_mode)), int(math.ceil(331 / gui.game_mode))]

|

RenPy gui.rpy
~~~~~~~~~~~~~

`GUI Customization Guide <https://www.renpy.org/doc/html/gui.html?highlight=gui#gui-customization-guide>`_

`Advanced GUI <https://www.renpy.org/doc/html/gui_advanced.html?highlight=gui#advanced-gui>`_

.. code-block:: python
  :linenos:

  ################################################################################
  ## GUI Configuration Variables
  ################################################################################


  ## Colors ######################################################################
  ##
  ## The colors of text in the interface.

  ## An accent color used throughout the interface to label and highlight text.
  define gui.accent_color = '#99ccff'

  ## The color used for a text button when it is neither selected nor hovered.
  define gui.idle_color = '#888888'

  ## The small color is used for small text, which needs to be brighter/darker to
  ## achieve the same effect.
  define gui.idle_small_color = '#aaaaaa'

  ## The color that is used for buttons and bars that are hovered.
  define gui.hover_color = '#c1e0ff'

  ## The color used for a text button when it is selected but not focused. A
  ## button is selected if it is the current screen or preference value.
  define gui.selected_color = '#ffffff'

  ## The color used for a text button when it cannot be selected.
  define gui.insensitive_color = '#8888887f'

  ## Colors used for the portions of bars that are not filled in. These are not
  ## used directly, but are used when re-generating bar image files.
  define gui.muted_color = '#3d5166'
  define gui.hover_muted_color = '#5b7a99'

  ## The colors used for dialogue and menu choice text.
  define gui.text_color = '#ffffff'
  define gui.interface_text_color = '#ffffff'


  ## Fonts and Font Sizes ########################################################

  ## The font used for in-game text.
  define gui.text_font = "Commissioner-Regular.ttf"

  ## The font used for character names.
  define gui.name_text_font = "Commissioner-Medium.ttf"

  ## The font used for out-of-game text.
  define gui.interface_text_font = "Commissioner-Light.ttf"

  ## The size of normal dialogue text.
  define gui.text_size = int(math.ceil(66 / gui.game_mode))

  ## The size of character names.
  define gui.name_text_size = int(math.ceil(90 / gui.game_mode))

  ## The size of text in the game's user interface.
  define gui.interface_text_size = int(math.ceil(66 / gui.game_mode))

  ## The size of labels in the game's user interface.
  define gui.label_text_size = int(math.ceil(72 / gui.game_mode))

  ## The size of text on the notify screen.
  define gui.notify_text_size = int(math.ceil(48 / gui.game_mode))

  ## The size of the game's title.
  define gui.title_text_size = int(math.ceil(150 / gui.game_mode))


  ## Main and Game Menus #########################################################

  ## The images used for the main and game menus.
  define gui.main_menu_background = Movie(play="Anim/main_menu.webm")
  define gui.game_menu_background = "gui/game_menu.png"


  ## Dialogue ####################################################################
  ##
  ## These variables control how dialogue is displayed on the screen one line at a
  ## time.

  ## The height of the textbox containing dialogue.
  define gui.textbox_height = int(math.ceil(555 / gui.game_mode))

  ## The placement of the textbox vertically on the screen. 0.0 is the top, 0.5 is
  ## center, and 1.0 is the bottom.
  define gui.textbox_yalign = 1.0


  ## The placement of the speaking character's name, relative to the textbox.
  ## These can be a whole number of pixels from the left or top, or 0.5 to center.
  define gui.name_xpos = int(math.ceil(720 / gui.game_mode))
  define gui.name_ypos = 0

  ## The horizontal alignment of the character's name. This can be 0.0 for left-
  ## aligned, 0.5 for centered, and 1.0 for right-aligned.
  define gui.name_xalign = 0.0

  ## The width, height, and borders of the box containing the character's name, or
  ## None to automatically size it.
  define gui.namebox_width = None
  define gui.namebox_height = None

  ## The borders of the box containing the character's name, in left, top, right,
  ## bottom order.
  define gui.namebox_borders = Borders(5, 5, 5, 5)

  ## If True, the background of the namebox will be tiled, if False, the
  ## background of the namebox will be scaled.
  define gui.namebox_tile = False


  ## The placement of dialogue relative to the textbox. These can be a whole
  ## number of pixels relative to the left or top side of the textbox, or 0.5 to
  ## center.
  define gui.dialogue_xpos = int(math.ceil(804 / gui.game_mode))
  define gui.dialogue_ypos = int(math.ceil(150 / gui.game_mode))

  ## The maximum width of dialogue text, in pixels.
  define gui.dialogue_width = int(math.ceil(2232 / gui.game_mode))

  ## The horizontal alignment of the dialogue text. This can be 0.0 for left-
  ## aligned, 0.5 for centered, and 1.0 for right-aligned.
  define gui.dialogue_text_xalign = 0.0


  ## Buttons #####################################################################
  ##
  ## These variables, along with the image files in gui/button, control aspects of
  ## how buttons are displayed.

  ## The width and height of a button, in pixels. If None, Ren'Py computes a size.
  define gui.button_width = None
  define gui.button_height = None

  ## The borders on each side of the button, in left, top, right, bottom order.
  define gui.button_borders = Borders(int(math.ceil(12 / gui.game_mode)), int(math.ceil(12 / gui.game_mode)), int(math.ceil(12 / gui.game_mode)), int(math.ceil(12 / gui.game_mode)))

  ## If True, the background image will be tiled. If False, the background image
  ## will be linearly scaled.
  define gui.button_tile = False

  ## The font used by the button.
  define gui.button_text_font = gui.interface_text_font

  ## The size of the text used by the button.
  define gui.button_text_size = gui.interface_text_size

  ## The color of button text in various states.
  define gui.button_text_idle_color = gui.idle_color
  define gui.button_text_hover_color = gui.hover_color
  define gui.button_text_selected_color = gui.selected_color
  define gui.button_text_insensitive_color = gui.insensitive_color

  ## The horizontal alignment of the button text. (0.0 is left, 0.5 is center, 1.0
  ## is right).
  define gui.button_text_xalign = 0.0


  ## These variables override settings for different kinds of buttons. Please see
  ## the gui documentation for the kinds of buttons available, and what each is
  ## used for.
  ##
  ## These customizations are used by the default interface:

  define gui.radio_button_borders = Borders(int(math.ceil(54 / gui.game_mode)), int(math.ceil(12 / gui.game_mode)), int(math.ceil(12 / gui.game_mode)), int(math.ceil(12 / gui.game_mode)))

  define gui.check_button_borders = Borders(int(math.ceil(54 / gui.game_mode)), int(math.ceil(12 / gui.game_mode)), int(math.ceil(12 / gui.game_mode)), int(math.ceil(12 / gui.game_mode)))

  define gui.confirm_button_text_xalign = 0.5

  define gui.page_button_borders = Borders(int(math.ceil(30 / gui.game_mode)), int(math.ceil(12 / gui.game_mode)), int(math.ceil(30 / gui.game_mode)), int(math.ceil(12 / gui.game_mode)))

  define gui.quick_button_borders = Borders(int(math.ceil(30 / gui.game_mode)), int(math.ceil(12 / gui.game_mode)), int(math.ceil(30 / gui.game_mode)), 0)
  define gui.quick_button_text_size = int(math.ceil(42 / gui.game_mode))
  define gui.quick_button_text_idle_color = gui.idle_small_color
  define gui.quick_button_text_selected_color = gui.accent_color

  ## You can also add your own customizations, by adding properly-named variables.
  ## For example, you can uncomment the following line to set the width of a
  ## navigation button.

  # define gui.navigation_button_width = 250


  ## Choice Buttons ##############################################################
  ##
  ## Choice buttons are used in the in-game menus.

  define gui.choice_button_width = int(math.ceil(2370 / gui.game_mode))
  define gui.choice_button_height = None
  define gui.choice_button_tile = False
  define gui.choice_button_borders = Borders(int(math.ceil(300 / gui.game_mode)), int(math.ceil(15 / gui.game_mode)), int(math.ceil(300 / gui.game_mode)), int(math.ceil(15 / gui.game_mode)))
  define gui.choice_button_text_font = gui.text_font
  define gui.choice_button_text_size = gui.text_size
  define gui.choice_button_text_xalign = 0.5
  define gui.choice_button_text_idle_color = "#cccccc"
  define gui.choice_button_text_hover_color = "#ffffff"
  define gui.choice_button_text_insensitive_color = "#444444"


  ## File Slot Buttons ###########################################################
  ##
  ## A file slot button is a special kind of button. It contains a thumbnail
  ## image, and text describing the contents of the save slot. A save slot uses
  ## image files in gui/button, like the other kinds of buttons.

  ## The save slot button.
  define gui.slot_button_width = int(math.ceil(828 / gui.game_mode))
  define gui.slot_button_height = int(math.ceil(618 / gui.game_mode))
  define gui.slot_button_borders = Borders(int(math.ceil(30 / gui.game_mode)), int(math.ceil(30 / gui.game_mode)), int(math.ceil(30 / gui.game_mode)), int(math.ceil(30 / gui.game_mode)))
  define gui.slot_button_text_size = int(math.ceil(42 / gui.game_mode))
  define gui.slot_button_text_xalign = 0.5
  define gui.slot_button_text_idle_color = gui.idle_small_color
  define gui.slot_button_text_selected_idle_color = gui.selected_color
  define gui.slot_button_text_selected_hover_color = gui.hover_color

  ## The width and height of thumbnails used by the save slots.
  define config.thumbnail_width = 768
  define config.thumbnail_height = 432

  ## The number of columns and rows in the grid of save slots.
  define gui.file_slot_cols = 3
  define gui.file_slot_rows = 2


  ## Positioning and Spacing #####################################################
  ##
  ## These variables control the positioning and spacing of various user interface
  ## elements.

  ## The position of the left side of the navigation buttons, relative to the left
  ## side of the screen.
  define gui.navigation_xpos = int(math.ceil(120 / gui.game_mode))

  ## The vertical position of the skip indicator.
  define gui.skip_ypos = int(math.ceil(30 / gui.game_mode))

  ## The vertical position of the notify screen.
  define gui.notify_ypos = int(math.ceil(135 / gui.game_mode))

  ## The spacing between menu choices.
  define gui.choice_spacing = int(math.ceil(66 / gui.game_mode))

  ## Buttons in the navigation section of the main and game menus.
  define gui.navigation_spacing = int(math.ceil(12 / gui.game_mode))

  ## Controls the amount of spacing between preferences.
  define gui.pref_spacing = int(math.ceil(30 / gui.game_mode))

  ## Controls the amount of spacing between preference buttons.
  define gui.pref_button_spacing = 0

  ## The spacing between file page buttons.
  define gui.page_spacing = 0

  ## The spacing between file slots.
  define gui.slot_spacing = int(math.ceil(30 / gui.game_mode))

  ## The position of the main menu text.
  define gui.main_menu_text_xalign = 1.0


  ## Frames ######################################################################
  ##
  ## These variables control the look of frames that can contain user interface
  ## components when an overlay or window is not present.

  ## Generic frames.
  define gui.frame_borders = Borders(int(math.ceil(12 / gui.game_mode)), int(math.ceil(12 / gui.game_mode)), int(math.ceil(12 / gui.game_mode)), int(math.ceil(12 / gui.game_mode)))

  ## The frame that is used as part of the confirm screen.
  define gui.confirm_frame_borders = Borders(int(math.ceil(120 / gui.game_mode)), int(math.ceil(120 / gui.game_mode)), int(math.ceil(120 / gui.game_mode)), int(math.ceil(120 / gui.game_mode)))

  ## The frame that is used as part of the skip screen.
  define gui.skip_frame_borders = Borders(int(math.ceil(48 / gui.game_mode)), int(math.ceil(15 / gui.game_mode)), int(math.ceil(150 / gui.game_mode)), int(math.ceil(15 / gui.game_mode)))

  ## The frame that is used as part of the notify screen.
  define gui.notify_frame_borders = Borders(int(math.ceil(48 / gui.game_mode)), int(math.ceil(15 / gui.game_mode)), int(math.ceil(120 / gui.game_mode)), int(math.ceil(15 / gui.game_mode)))

  ## Should frame backgrounds be tiled?
  define gui.frame_tile = False


  ## Bars, Scrollbars, and Sliders ###############################################
  ##
  ## These control the look and size of bars, scrollbars, and sliders.
  ##
  ## The default GUI only uses sliders and vertical scrollbars. All of the other
  ## bars are only used in creator-written screens.

  ## The height of horizontal bars, scrollbars, and sliders. The width of vertical
  ## bars, scrollbars, and sliders.
  define gui.bar_size = int(math.ceil(75 / gui.game_mode))
  define gui.scrollbar_size = int(math.ceil(36 / gui.game_mode))
  define gui.slider_size = int(math.ceil(75 / gui.game_mode))

  ## True if bar images should be tiled. False if they should be linearly scaled.
  define gui.bar_tile = False
  define gui.scrollbar_tile = False
  define gui.slider_tile = False

  ## Horizontal borders.
  define gui_borders_size = int(math.ceil(12 / gui.game_mode))
  define gui.bar_borders = Borders(gui_borders_size, gui_borders_size, gui_borders_size, gui_borders_size)
  define gui.scrollbar_borders = Borders(gui_borders_size, gui_borders_size, gui_borders_size, gui_borders_size)
  define gui.slider_borders = Borders(gui_borders_size, gui_borders_size, gui_borders_size, gui_borders_size)

  ## Vertical borders.
  define gui.vbar_borders = Borders(gui_borders_size, gui_borders_size, gui_borders_size, gui_borders_size)
  define gui.vscrollbar_borders = Borders(gui_borders_size, gui_borders_size, gui_borders_size, gui_borders_size)
  define gui.vslider_borders = Borders(gui_borders_size, gui_borders_size, gui_borders_size, gui_borders_size)

  ## What to do with unscrollable scrollbars in the gui. "hide" hides them, while
  ## None shows them.
  define gui.unscrollable = "hide"


  ## History #####################################################################
  ##
  ## The history screen displays dialogue that the player has already dismissed.

  ## The number of blocks of dialogue history Ren'Py will keep.
  define config.history_length = 250

  ## The height of a history screen entry, or None to make the height variable at
  ## the cost of performance.
  define gui.history_height = int(math.ceil(420 / gui.game_mode))

  ## The position, width, and alignment of the label giving the name of the
  ## speaking character.
  define gui.history_name_xpos = int(math.ceil(465 / gui.game_mode))
  define gui.history_name_ypos = 0
  define gui.history_name_width = int(math.ceil(465 / gui.game_mode))
  define gui.history_name_xalign = 1.0

  ## The position, width, and alignment of the dialogue text.
  define gui.history_text_xpos = int(math.ceil(510 / gui.game_mode))
  define gui.history_text_ypos = int(math.ceil(6 / gui.game_mode))
  define gui.history_text_width = int(math.ceil(2220 / gui.game_mode))
  define gui.history_text_xalign = 0.0


  ## NVL-Mode ####################################################################
  ##
  ## The NVL-mode screen displays the dialogue spoken by NVL-mode characters.

  ## The borders of the background of the NVL-mode background window.
  define gui.nvl_borders = Borders(0, int(math.ceil(30 / gui.game_mode)), 0, int(math.ceil(60 / gui.game_mode)))

  ## The maximum number of NVL-mode entries Ren'Py will display. When more entries
  ## than this are to be show, the oldest entry will be removed.
  define gui.nvl_list_length = 6

  ## The height of an NVL-mode entry. Set this to None to have the entries
  ## dynamically adjust height.
  define gui.nvl_height = int(math.ceil(345 / gui.game_mode))

  ## The spacing between NVL-mode entries when gui.nvl_height is None, and between
  ## NVL-mode entries and an NVL-mode menu.
  define gui.nvl_spacing = int(math.ceil(30 / gui.game_mode))

  ## The position, width, and alignment of the label giving the name of the
  ## speaking character.
  define gui.nvl_name_xpos = int(math.ceil(1290 / gui.game_mode))
  define gui.nvl_name_ypos = 0
  define gui.nvl_name_width = int(math.ceil(450 / gui.game_mode))
  define gui.nvl_name_xalign = 1.0

  ## The position, width, and alignment of the dialogue text.
  define gui.nvl_text_xpos = int(math.ceil(1350 / gui.game_mode))
  define gui.nvl_text_ypos = int(math.ceil(24 / gui.game_mode))
  define gui.nvl_text_width = int(math.ceil(1770 / gui.game_mode))
  define gui.nvl_text_xalign = 0.0

  ## The position, width, and alignment of nvl_thought text (the text said by the
  ## nvl_narrator character.)
  define gui.nvl_thought_xpos = int(math.ceil(720 / gui.game_mode))
  define gui.nvl_thought_ypos = 0
  define gui.nvl_thought_width = int(math.ceil(2340 / gui.game_mode))
  define gui.nvl_thought_xalign = 0.0

  ## The position of nvl menu_buttons.
  define gui.nvl_button_xpos = int(math.ceil(1350 / gui.game_mode))
  define gui.nvl_button_xalign = 0.0

  ## Localization ################################################################

  ## This controls where a line break is permitted. The default is suitable
  ## for most languages. A list of available values can be found at https://
  ## www.renpy.org/doc/html/style_properties.html#style-property-language

  define gui.language = "unicode"


  ################################################################################
  ## Mobile devices
  ################################################################################

  init python:

      ## This increases the size of the quick buttons to make them easier to touch
      ## on tablets and phones.
      if renpy.variant("touch"):

          gui.quick_button_borders = Borders(int(math.ceil(120 / gui.game_mode)), int(math.ceil(42 / gui.game_mode)), int(math.ceil(120 / gui.game_mode)), 0)

      ## This changes the size and spacing of various GUI elements to ensure they
      ## are easily visible on phones.
      if renpy.variant("small"):

          ## Font sizes.
          gui.text_size = int(math.ceil(90 / gui.game_mode))
          gui.name_text_size = int(math.ceil(108 / gui.game_mode))
          gui.notify_text_size = int(math.ceil(75 / gui.game_mode))
          gui.interface_text_size = int(math.ceil(90 / gui.game_mode))
          gui.button_text_size = int(math.ceil(90 / gui.game_mode))
          gui.label_text_size = int(math.ceil(102 / gui.game_mode))

          ## Adjust the location of the textbox.
          gui.textbox_height = int(math.ceil(720 / gui.game_mode))
          gui.name_xpos = int(math.ceil(240 / gui.game_mode))
          gui.text_xpos = int(math.ceil(270 / gui.game_mode))
          gui.text_width = int(math.ceil(3300 / gui.game_mode))

          ## Change the size and spacing of various things.
          gui.slider_size = int(math.ceil(108 / gui.game_mode))

          gui.choice_button_width = int(math.ceil(3720 / gui.game_mode))

          gui.navigation_spacing = int(math.ceil(60 / gui.game_mode))
          gui.pref_button_spacing = int(math.ceil(30 / gui.game_mode))

          gui.history_height = int(math.ceil(570 / gui.game_mode))
          gui.history_text_width = int(math.ceil(2070 / gui.game_mode))

          gui.quick_button_text_size = int(math.ceil(60 / gui.game_mode))

          ## File button layout.
          gui.file_slot_cols = 2
          gui.file_slot_rows = 2

          ## NVL-mode.
          gui.nvl_height = int(math.ceil(510 / gui.game_mode))

          gui.nvl_name_width = int(math.ceil(915 / gui.game_mode))
          gui.nvl_name_xpos = int(math.ceil(975 / gui.game_mode))

          gui.nvl_text_width = int(math.ceil(2745 / gui.game_mode))
          gui.nvl_text_xpos = int(math.ceil(1035 / gui.game_mode))
          gui.nvl_text_ypos = int(math.ceil(15 / gui.game_mode))

          gui.nvl_thought_width = int(math.ceil(3720 / gui.game_mode))
          gui.nvl_thought_xpos = int(math.ceil(60 / gui.game_mode))

          gui.nvl_button_width = int(math.ceil(3720 / gui.game_mode))
          gui.nvl_button_xpos = int(math.ceil(60 / gui.game_mode))

|

RenPy screens.rpy
~~~~~~~~~~~~~~~~~

.. code-block:: python
  :linenos:

  ## Ren'Py screens.rpy
  ## Example: define gui.renpy_ = int(math.ceil( / gui.game_mode))
  define gui.renpy_choices = int(math.ceil(810 / gui.game_mode))
  define gui.renpy_main_menu_frame = int(math.ceil(840 / gui.game_mode))
  define gui.renpy_main_menu_vbox_xoffset = int(math.ceil(-60 / gui.game_mode))
  define gui.renpy_main_menu_vbox_xmaximum = int(math.ceil(2400 / gui.game_mode))
  define gui.renpy_main_menu_vbox_yoffset = int(math.ceil(-60 / gui.game_mode))
  define gui.renpy_outer_frame_bottom_padding = int(math.ceil(90 / gui.game_mode))
  define gui.renpy_outer_frame_top_padding = int(math.ceil(360 / gui.game_mode))
  define gui.renpy_navigation_frame = int(math.ceil(840 / gui.game_mode))
  define gui.renpy_content_frame_left_margin = int(math.ceil(120 / gui.game_mode))
  define gui.renpy_content_frame_right_margin = int(math.ceil(60 / gui.game_mode))
  define gui.renpy_content_frame_top_margin = int(math.ceil(30 / gui.game_mode))
  define gui.renpy_menu_viewport = int(math.ceil(2760 / gui.game_mode))
  define gui.renpy_menu_side = int(math.ceil(30 / gui.game_mode))
  define gui.renpy_menu_label_xpos = int(math.ceil(150 / gui.game_mode))
  define gui.renpy_menu_label_ysize = int(math.ceil(360 / gui.game_mode))
  define gui.renpy_return_button = int(math.ceil(-90 / gui.game_mode))
  define gui.renpy_page_label_xpadding = int(math.ceil(150 / gui.game_mode))
  define gui.renpy_page_label_ypadding = int(math.ceil(10 / gui.game_mode))
  define gui.renpy_pref_label = int(math.ceil(6 / gui.game_mode))
  define gui.renpy_pref_vbox = int(math.ceil(675 / gui.game_mode))
  define gui.renpy_slider_slider = int(math.ceil(1050 / gui.game_mode))
  define gui.renpy_slider_button = int(math.ceil(30 / gui.game_mode))
  define gui.renpy_slider_vbox = int(math.ceil(1350 / gui.game_mode))
  define gui.renpy_help = int(math.ceil(45 / gui.game_mode))
  define gui.renpy_help_button = int(math.ceil(24 / gui.game_mode))
  define gui.renpy_help_label_xsize = int(math.ceil(750 / gui.game_mode))
  define gui.renpy_help_label_right_padding = int(math.ceil(60 / gui.game_mode))
  define gui.renpy_confirm_vbox_spacing = int(math.ceil(90 / gui.game_mode))
  define gui.renpy_confirm_hbox_spacing = int(math.ceil(300 / gui.game_mode))
  define gui.renpy_skip_indicator = int(math.ceil(18 / gui.game_mode))
  define gui.renpy_mobile_pref_vbox_medium = int(math.ceil(1350 / gui.game_mode))
  define gui.renpy_mobile_navigation_frame = int(math.ceil(1020 / gui.game_mode))
  define gui.renpy_mobile_pref_vbox_small = int(math.ceil(1200 / gui.game_mode))
  define gui.renpy_mobile_slider_pref_slider = int(math.ceil(1800 / gui.game_mode))
