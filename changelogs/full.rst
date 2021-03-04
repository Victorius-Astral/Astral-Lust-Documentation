Changelog - Full
================

0.1.3a
------

Added
~~~~~

* around 20 images
* You can check drawers in player's room now
* alice's shelf
* now you can read the document on Lexi's desk
* burning immunity status effect
* Sample Mod, it adds one weird dream and a nice card to drop from melee bandits
* transitions to praying and mirror

Changed
~~~~~~~

* noon -> afternoon
* succubus threesome talk renders
* one grace's tip to make it more clear on time
* you can shot at the sky with Shot card now
* buffed dragon, added ultimate moves
* terror now has 50% chance to trigger
* improved animation of some scenes

Fixed
~~~~~

* over a hundred spelling mistakes or improved the dialogue's flow, thanks to Strectmar's initial screening
* error on trying to save the woman
* possible error when fighting ghouls
* error on generic combat after loading old save
* error on Mina noticing us
* enemies life not being reset in random combat encounter
* stomping sound continuing after choosing to hide in encounter with chimera
* dream end dialogue triggering twice
* possible bug causing dialogue window do disappear only after combat has started
* terror chance of losing a turn in tooltip
* error when fighting dragon
* mysterious trader corruption decrease needed 2 coins
* spelling mistake in one of Alice's question
* Alice's is no longer so nice to give you a foot job before answering her questions
* dragon card check
* mina's repeatable boob job
* now you can't change girl's petname at 24 trust

Mods - Added
~~~~~~~~~~~~

* Sample Mod to mods/ folder, check it, it's heavily commented to explain everything going on
* after_load _start & _end triggers
* triggers during combat initialization

Mods - Changed
~~~~~~~~~~~~~~

* for triggers you can now either use a string or (much better for performance) use compiled (at init time) code object (check documentation's trigger tab)
* now adding enemies to random combat encounter requires to add them as strings instead of objects
* now terror tooltip reflects changes to terror chance properly

Mods - Fixed
~~~~~~~~~~~~

* spelling mistakes in a few image names, to make it easier for you to not use wrong name

|
|

0.1.3
-----

Major
~~~~~

* added dreams, there is a chance every time you sleep for a dream, dreams mode released
* implemented prisoners system
* you can catch succubi and play with them in the dungeon and playroom, 13 H scenes, they have their own lust mechanic
* added extensive modding support, check modding documentation to find a way to make your own mods (doesn't require programming skills, link in modding section of changelog)
* added over 500 images
* added over 100 animations, almost doubling animations amount
* added 49 events/scenes

Added
~~~~~

* dreams mode (Patrons)
* 6 dreams, one with 5 variants
* 4 audio tracks
* 7 exploration events
* 5 new enemies orc group & dragon & stickman & ghouls & succubus B, make classes, add card lootlists
* Alice event
* Grace event
* Mina event
* prisoners system, for now it's used only for succubus
* catching succubus, playing with them in the dungeon and the playroom
* dungeon expansion - playroom
* 13 H succubus scenes
* Mina, Alice and Grace showering
* 5 new arenas + 2 variants
* 3 new status effects - Terror (chance to skip turn), Stun Immunity, Fury (Gain x strength on receiving damage)
* 2 new items
* 4 new cards
* 8 wallpapers, 2 animated
* new tags - group (FFM) & BDSM & Pet Play & Orgasm Denial
* Help appearing on catching first succubus
* Succubus lust mechanics
* Grace's repeatable H scene, 4 variants
* transitions to Alice's shower scene
* you can give main girls petnames if their trust is at least 25, check the mirror
* Mina's repeatable H scene, 3 variants

Changed
~~~~~~~

* now generic combat has flat 45% chance of happening
* notification assumes different position if in combat
* reticulate you -> riddle you with bullets
* now frail along with armor can't lower your block
* dungeon looks
* lowered chance to drop mysterious coin from cultist
* tweaked every exploration event chance
* now effects which being is immune to won't be granted instead of disappearing on being's turn
* Alice's schedule

Fixed
~~~~~

* lowered size of old animations (4K: 1.58GB -> 0.88GB, 1080P: 604MB -> 320MB)
* overlapping tooltip in character screen

Mods - Released
~~~~~~~~~~~~~~~

* online documentation, it shows how to make your mod with new dreams, events, cards, enemies, etc.
* source code for people with Mod Developer role on Discord
* AL card templates
* mod_toolkit script (for now it only enables dev tools & console in AL)

Mods - Added
~~~~~~~~~~~~

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

|
|

0.1.2d
------

Major
~~~~~

* Improved/Changed/Fixed over 1000 dialogue lines. All thanks to Strectmar - new editor
* added story mode - disables generic combat event (toggled in preferences)
* now you can spare human enemies to stop corruption from increasing (no materials)

Added
~~~~~

* new audio track
* few new images
* Now you can seal pinky promise with a kiss if she trusts you enough

Changed
~~~~~~~

* some dialogue & renders in Alice's 8th event to make it better
* Mina's 4th journal tip is now much more clear on what you need to do
* added new audio track to lexi's first event
* now generic combat has 45% chance of appearing
* peeking at Alice showering now increases corruption
* Mina's 5th event renders a little to make the flow better
* Now rape gives corruption even if you have beyond 50% corruption
* a few status effect tooltips, to make them more clear

Fixed
~~~~~

* wheel of fortune & lycanthropy & healing card mistakes
* wandering trader intro playing out every time
* Resurrect effect spelling mistake
* Vulnerable tooltip spelling mistake
* Unique cards from cheat codes disappearing on death (use code again)
* market scenes looking weird
* getting kicked in the balls is no longer so painful that it raises an error
* improved/fixed dozens of codex entries

|
|

0.1.2c
------

Changed
~~~~~~~

* now sleeping with a girl increases sanity by additional 3%, there is 50% chance for corruption to decrease by 2%

Fixed
~~~~~

* cat name changing after using a vault, load game and the name will be back
* some repeatable events (like trust events) being hidden
* weird looking sequence in sleepover
* dozens of spelling mistakes

|
|

0.1.2b
------

Changed
~~~~~~~

* now you need to only answer 3 of Alice questions
* trader now by default doesn't keep (when restocking) items given to him by the player

Fixed
~~~~~

* traders not restocking correctly
* traders not using randomized goods
* getting blowjob after trading with trader
* error on asking for wanderer trader daughter
* exploit at alice questions
* omitted dialogue lines in alice 7th event

|
|

0.1.2a
------

Major
~~~~~

* fixed false positive virus detection (this time for real) by removing custom game icon

Fixed
~~~~~

* Faceless card not exhausting and often costing spirit
* Hypnotise stunning player instead of enemy
* reaching 100% corruption not causing game over
* about page legal section

|
|

0.1.2
-----

Major
~~~~~

* new location for freeroam - library
* implemented complex trading system along with a few traders
* added codex, place to gather knowledge you came upon in the Astral Lust with over 90 entries (sleep to update if using old save)
* implemented unique cards (stay after death) and tarot cards (weird effects)
* implemented cheat codes system (check pc, codes available on Discord & Patreon)
* you can now sleep with one of the girls (sleepover, 3 variants)
* added 9 story events, exploration event, 3 repeatable events
* added 30 animations
* added over 330 images
* added 6 H scenes + 2 erotic scenes + 4 H scenes variants
* added 25 cards
* added 7 collectibles and 6 wallpapers
* added 16 cheat codes (free/patron codes all available on Discord and Patreon)
* updated Ren'py, it should fix false positive virus detections.
* optimization of card loading, cards now load about 2x faster, useful with large decks.
* new tags/fetishes - feet, anal

Added
~~~~~

* new location - library
* talk with Kiara
* codex with over 90 entries
* new emoticon - codex entry
* repeatable work for Kiara
* praying at the altar
* 2 Kiara story events
* Kiara scenes to gallery
* Kiara to journal
* Kiara desk sex as repeatable
* 7 collectibles, 2 animated
* 16 cheat codes
* reminder for people using console and a warning to not run auto_destruct(), seriously, don't
* hover tooltips to character menu
* movie icon if wallpaper / collectible is animated
* 3 unique cards
* 22 tarot cards
* Forbid Tarot status effect
* Mysterious Trader, appearing sometimes at the library
* Kiara to the wardrobe
* 6 wallpapers, 1 unlockable only through combat, 2 animated
* Hollow Market - exchange tab, check the pc.
* 2 alice events
* alice repeatable H, 3 scenes, one with 5 variants
* alice taking showers at the evening
* 3 sounds
* main story 2 events
* grace event
* exploration event - friendly wanderers, 2 H scenes
* codex entries for previous content
* 2 mina events
* 9 events to the gallery
* sleepover with Mina, 3 variations depending on trust and rng

Changed
~~~~~~~

* death on Mina's 5th event no longer resets your deck
* now the same things when looted are summed up
* the way enemy loot works, now every item has independent chance to drop
* text when trying to build a forge / dungeon, now it's more clear about rooms current functionality
* added [Corruption / Madness] to warehouse attack choices
* slight optimization of save loading
* notifications no longer overlap with day counter and enemy effects first line
* lowered corruption increase after killing humans
* inventory now sums up quest items
* vault now uses modified trading system GUI
* improved inventory, character, girls, characteristics, deck and wardrobe screens
* now you can hide quest items in vault
* Cease Fire Treaty rebalanced - cost 0 -> 1, now it removes Invulnerability, it's destroyed instead of exhausted
* journal no longer resizes itself depending on content
* true damage no longer scales with Vulnerable, Strength and Weak effects
* sacrifice no longer scales with Strength and Weak effects
* refreshed about page

Fixed
~~~~~

* enemy still hitting you after dying from thorns
* attacking a few times after enemy health hits 0 no longer triggers thorn damage
* now killing humans always trigger corruption increase
* pc icons not showing up after inserting wallpaper code and using exit icon
* possible bug causing day counter to not appear after combat
* stun effect not having effect on player
* sacrifice no longer triggers thorn damage
* stun effect ticking down 2 stacks / turn
* some spelling and grammar mistakes

|
|

0.1.1
-----

Major
~~~~~

* added 7 story events
* added over 200 images
* added over 20 animations
* added 3 animated H scenes
* added 6 repeatable H scenes variants
* added 2 outfits

Added
~~~~~

* Lexi's 6th and 7th story events
* Mina's 6th and 7th story events
* Grace's 6th and 7th story events
* Alice's 6th story event
* you can now train at the gym with Alice
* Alice can now appear at the gym
* repeatable Grace event
* repeatable Lexi event
* Alice gym outfit
* Grace maid outfit
* Gym outfit support for Alice blowjob
* new story events added to gallery
* 2 new fully animated arenas for generic combat
* 6 outfits to wardrobe

Changed
~~~~~~~

* now you can't have fun with girls if their trust is zero or negative
* now fights with giants take place in designated arena which emphasizes their size

Fixed
~~~~~

* hp bar shows full hp before taking damage / healing
* emoticons not disappearing after rollback

|
|

0.1.0a
------

Major
~~~~~

* implemented journal and help (press 'Q')
* you can now escape generic combat
* enemies drop loot
* expanded and enhanced some events
* emoticons added
* unification of saves from 1080p and 2160p (4k) branch
* bugfixes and QoL features

Added
~~~~~

* transitions to all events that didn't have them
* Critic effect (deal x times the damage next time you deal damage)
* Forbid debuffs (can't play cards of given category)
* replay icon
* help shows after intro, it can also be found on pc or by pressing 'Q'
* checking girls stats through girls menu (heart)
* defeated enemies drop loot (materials, will change to unique materials after card crafting is implemented)
* ability to (try to) run during generic combat encounter, agility increases chance (20% + 2% per agility point), capped at 65%
* fridge implemented, you can have a snack in a kitchen now
* healing now gives indications in fight
* support for cards that cause drawing card
* journal, check progress and find tips about new events
* expanded 2nd Lexi event
* faint whispers now haunt you outside
* sound when losing girl stats
* animated scenes option support for grace massage
* emoticons appear on girl stat change
* shop icon to pc
* easy rescaling all game screens for dev and modders, designed for increased compatibility between versions and possible 720p, compressed web and mobile versions.
* Life Steal implemented
* some enemies start combat with status effects
* Patreon and Discord buttons to menu
* Astral Lust keymap in Help menu

Changed
~~~~~~~

* enemy battle animations are now slower
* starting player max hp 100 -> 50
* replay gallery now as pc app
* made "quiet" text bigger
* removed lust need for 4th Alice event
* removed black screen from generic combat
* notifications at the middle of the screen duration 6.0s -> 4.0s
* 4th Lexi event now requires Mina affection 1 instead of 4
* now menu's are above most other screens
* it's now impossible to trigger Grace events in her room when she is cleaning 1st floor
* sleep now heals fixed 30hp instead of 100% hp
* enemy faction now displays in other color
* tweaked corruption and sanity change on killing humans
* max hand 9 -> 7
* some effects can now take negative values
* now at the beginning of your turn you draw at least 1 card
* 1st Lexi and 1st Dog events enhanced a little
* enemy intention changes position when menu is expanded
* increased loot chance at the market
* orgasms are no longer cutscenes, they can be clicked through
* now you can still train after reaching cap, but it won't increase stats
* Bite sp cost 2 -> 1
* now 1080p and 2160p use the same save folder in appdata, they are fully compatible
* way cards behave in combat (drawing)
* slightly increased Scavengers damage
* in-game discord link
* vertical spacing between enemy effects increased
* now it's much easier to find ice creams
* other minor changes

Fixed
~~~~~

* card destroying in forge
* re-rendered grace massage animation to delete artifacts
* error on clicking cupboard in the f1(b) corridor
* error on trying to enter preferences
* many grammar mistakes
* gallery screen not hiding correctly
* day counter not appearing after combat
* bandit girl displaying as bandit group
* Kiara sex scene
* error at 3rd mina and lexi event
* error at 5th mina event and one image showing out of sequence
* text position being a little off in vault
* loading game after deleting persistent data causes NameError if didn't start new game at least once
* strength effect displaying with decimal part
* cards healing causing errors
* damage indications 'flying from corner' in 1080p version
* 4th mina event not setting flag correctly
* possible bug causing cutscenes to not play
* now you can't make outfit you already have
* possible error when meeting bandits
* you can no longer spam end turn
* some cards not giving described effect
* error on using some cards
* player healing throwing error on 2160p branch
* cards attacking few times attacking at the same time so it shows indications on top of one another
* card loot containing less than 3 cards in some cases
* Faceless Giant stealing boolean type effects as integers
* cards 'redrawing' themselves after using a card to the left of them
* a few other bugs

|
|

0.1.0
-----

Initial Release
