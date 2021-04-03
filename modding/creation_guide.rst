.. _create_guide:

Creation Guide
==============

This guide shows how to create events in Renpy, it uses selected parts of Renpy's documentation along with my own knowledge, and tips.

`Renpy Quickstart <https://www.renpy.org/doc/html/quickstart.html#quickstart>`_

|
|

Characters
----------

Ren'Py lets you define characters in advance.
This lets you associate a short name with a character, and to change the color of the character's name.
Characters can have their own font, size, etc. (Check link below)

.. code-block:: python
  :linenos:

  define s = Character('Sylvie', color="#c8ffc8")
  define m = Character('Me', color="#c8c8ff")

  label start:

      s "Hi there! How was class?"

      m "Good..."

      "I can't bring myself to admit that it all went in one ear and out the other."

      s "Are you going home now? Wanna walk back with me?"

      m "Sure!"

The first and second lines define characters.
The first line defines a character with the short name of ``s``, the long name ``Sylvie``, with a name that is shown in a greenish color.
(The colors are red-green-blue hex triples, as used in web pages.)

The second line creates a character with a short name ``m``, a long name ``Me``, with the name shown in a reddish color.
Other characters can be defined by copying one of the character lines, and changing the short name, long name, and color.

`More about Characters <https://www.renpy.org/doc/html/dialogue.html#defining-character-objects>`_

|
|

Menus, Labels, and Jumps
------------------------

These can be used to present user with choices, control flow, and make branching story.

Labels can be understood as point in the story we can jump to. It's created using simple ``label label_name:`` syntax

Take note that in Renpy and Python tabulations are important!

.. code-block:: python
  :linenos:

  s "Sure, but what's a \"visual novel?\""

  menu:

      "It's a videogame.":
          jump game

      "It's an interactive book.":
          jump book

  label game:

      m "It's a kind of videogame you can play on your computer or a console."

      jump marry

  label book:

      m "It's like an interactive book that you can read on a computer or a console."

      jump marry

  label marry:

      "And so, we become a visual novel creating duo."

This example shows how a menu can be used with Ren'Py.
The menu statement introduces an in-game choice.
It takes an indented block of lines, each consisting of a string followed by a colon.
These are the menu choices that are presented to the player.
Each menu choice takes its own indented block of lines, which is run when that menu choices is chosen.

In this example, each of the two menu choices runs a single ``jump`` statement.
The jump statement transfers control to the a label defined using the label statement.
After a jump, script statements following the label are run.

In the example above, after Sylvie asks her question, the player is presented with a menu containing two choices.
If the player picked ``It's a videogame.``, the first jump statement is run, and Ren'Py will jump to the ``game`` label.
This will cause the POV character to say "It's a story with pictures and music.", after which Ren'Py will jump to the ``marry`` label.

If there is no jump statement at the end of the block associated with the label, Ren'Py will continue on to the next statement.
The last jump statement here is technically unnecessary, but is included since it makes the flow of the game clearer.

Labels may be defined in any file that is in the game directory, and ends with .rpy.
The filename doesn't matter to Ren'Py, only the labels contained inside it.
You can think of all the .rpy files as being equivalent to a single big .rpy file, with jumps used to transfer control.
This gives you flexibility in how you organize the script of a larger game.

|
|

Images
------

A visual novel isn't much of a visual novel without pictures. Here's another scene from ``The Question``.
This also includes statements that show images to the player.
This can fully replace the previous section of script, if you want to try it out.

.. code-block:: python
  :linenos:

  define s = Character('Sylvie', color="#c8ffc8")
  define m = Character('Me', color="#c8c8ff")

  label start:

      scene bg meadow

      "After a short while, we reach the meadows just outside the neighborhood where we both live."

      "It's a scenic view I've grown used to. Autumn is especially beautiful here."

      "When we were children, we played in these meadows a lot, so they're full of memories."

      m "Hey... Umm..."

      show sylvie green smile

      "She turns to me and smiles. She looks so welcoming that I feel my nervousness melt away."

      "I'll ask her...!"

      m "Ummm... Will you..."

      m "Will you be my artist for a visual novel?"

      show sylvie green surprised

      "Silence."

This segment of script introduces two new statements.
The ``scene`` statement on line 6 clears all images and displays a background image.
The ``show`` statements on lines 16 and 26 display a sprite on top of the background, and change the displaying sprite, respectively.

In Ren'Py, each image has a name.
The name consists of a tag, and optionally one or more attributes.
Both the tag and attributes should begin with a letter, and contain letters, numbers, and underscores.
For example:

In the scene statement on line 6, the tag is ``bg``, and the attribute is ``meadow.`` By convention, background images should use the tag bg.

In the first show statement on line 16, the tag is ``sylvie``, and the attributes are ``green`` and ``smile``.

In the second show statement on line 26, the tag is ``sylvie``, and the attributes are ``green`` and ``surprised``.

Only one image with a given tag can be shown at the same time. When a second image with the same tag is show, it replaces the first image, as happens on line 26.

Ren'Py searches for image files in the images directory, which can be found by selecting ``images`` in the ``Open Directory`` section of the launcher.
Ren'Py expects character art to be an PNG or WEBP file, while background art should be a JPG, JPEG, PNG, or WEBP file.
The name of a file is very important – the extension is removed, the file name is forced to lowercase, and that's used as the image name.

For example, the following files, placed in the images directory, define the following images.

* "bg meadow.jpg" -> ``bg meadow``
* "sylvie green smile.png" -> ``sylvie green smile``
* "sylvie green surprised.png" -> ``sylvie green surprised``

Since the filenames are lowercase, the following also holds.

*"Sylvie Green Surprised.png" -> ``sylvie green surprised``

Images can be placed in subdirectories (subfolders) under the images directory. The directory name is ignored and only the filename is used to define the image name.

|

Hide Statement
~~~~~~~~~~~~~~

Ren'Py also supports a ``hide`` statement, which hides the given image.

.. code-block:: python
  :linenos:

  label leaving:

    s "I'll get right on it!"

    hide sylvie

    "..."

    m "That wasn't what I meant!"

It's actually pretty rare that you'll need to use hide.
Show can be used when a character is changing emotions, while scene is used when everyone leaves.
You only need to use hide when a character leaves and the scene stays the same.

|

Image Statement
~~~~~~~~~~~~~~~

Sometimes, a creator might not want to let Ren'Py define images automatically.
This is what the ``image`` statement is for.
It should be at the top level of the file (unindented, and before label start), and can be used to map an image name to an image file.
For example:

.. code-block:: python

  image logo = "renpy logo.png"
  image eileen happy = "eileen_happy_blue_dress.png"

The image statement is run at init time, before label start and the rest of the game script that interacts with the player.

The image statement can also be used for more complex tasks.

`More on Image statement <https://www.renpy.org/doc/html/displaying_images.html#displaying-images>`_

|

Positions
~~~~~~~~~

By default, images are shown centered horizontally, and with their bottom edge touching the bottom of the screen.
This is usually okay for backgrounds and single characters, but when showing more than one character on the screen it probably makes sense to do it at another position.
It also might make sense to reposition a character for story purposes.

.. code-block:: python

  show sylvie green smile at right

To do this repositioning, add an ``at`` clause to a show statement.
The at clause takes a position, and shows the image at that position.
Ren'Py includes several predefined positions: ``left`` for the left side of the screen, ``right`` for the right side, ``center`` for centered horizontally (the default), and ``truecenter`` for centered horizontally and vertically.

Creators can define their own positions, and event complicated moves, but that's outside of the scope of this quickstart.

|
|

Transitions
-----------

In the script above, pictures pop in and out instantaneously.
Since changing location or having a character enter or leave a scene is important, Ren'Py supports transitions that allow effects to be applied when what is being shown changes.

Transitions change what is displayed from what it was at the end of the last interaction (dialogue, menu, or transition – among other statements) to what it looks like after scene, show, and hide statements have run.

.. code-block:: python
  :linenos:

  label start:

    scene bg meadow
    with fade

    "After a short while, we reach the meadows just outside the neighborhood where we both live."

    "It's a scenic view I've grown used to. Autumn is especially beautiful here."

    "When we were children, we played in these meadows a lot, so they're full of memories."

    m "Hey... Umm..."

    show sylvie green smile
    with dissolve

    "She turns to me and smiles. She looks so welcoming that I feel my nervousness melt away."

    "I'll ask her...!"

    m "Ummm... Will you..."

    m "Will you be my artist for a visual novel?"

The with statement takes the name of a transition to use.
The most common one is ``dissolve`` which dissolves from one screen to the next.
Another useful transition is ``fade`` which fades the screen to black, and then fades in the new screen.

When a transition is placed after multiple scene, show, or hide statements, it applies to them all at once. If you were to write:

.. code-block:: python

  scene bg meadow
  show sylvie green smile
  with dissolve

Both the ``bg meadow`` and ``sylvie green smile`` images would be dissolved in at the same time.
To dissolve them in one at a time, you need to write two with statements:

.. code-block:: python

  scene bg meadow
  with dissolve
  show sylvie green smile
  with dissolve

This first dissolves in the meadow, and then dissolves in sylvie. If you wanted to instantly show the meadow, and then show sylvie, you could write:

.. code-block:: python

  scene bg meadow
  with None
  show sylvie smile
  with dissolve

Here, None is used to indicate a special transition that updates Ren'Py's idea of what the prior screen was, without actually showing anything to the player.

|
|

End Event
---------

You can end the event by running the ``return`` statement, without having called anything.

.. code-block:: python

  ".:. Good Ending."

  return

|
|

Flags
-----

While some events can be made by only using the statements given above, other games requires data to be stored and recalled later.
For example, it might make sense for a game to remember a choice a player has made, return to a common section of the script, and act on the choice later.
This is one of the reasons why Ren'Py has embedded Python support.

Here, we'll show how to store a flag containing information about a choice the player has made.
To initialize the flag, use the ``default`` statement, before label start.

.. code-block:: python

  # True if the player has decided to compare a VN to a book.
  default book = False

  label start:

    s "Hi there! How was class?"

The book flag starts off initialized to the special value ``False`` (as with the rest of Ren'Py, capitalization matters), meaning that it is not set.
If the book path is chosen, we can set it to True using a Python assignment statement.

.. code-block:: python

  label book:

    $ book = True

    m "It's like an interactive book that you can read on a computer or a console."

    jump marry

Lines beginning with a dollar-sign are interpreted as Python statements.
The assignment statement here assigns a value to a variable.
Ren'Py has support for other ways of including Python, such as a multi-line Python statement, that are discussed in other sections of this manual.
Ren'Py supports Python 2.7, though we strongly recommend you write Python that runs in Python 2 and Python 3.

To check the flag, use the ``if`` statement:

.. code-block:: python

  if book:

    "Our first game is based on one of Sylvie's ideas, but afterwards I get to come up with stories of my own, too."

If the condition is true, the block of script is run. If not, it is skipped. The ``if`` statement can also take an ``else`` clause, that introduced a block of script that is run if the condition is false.

.. code-block:: python

  if book:

    "Our first game is based on one of Sylvie's ideas, but afterwards I get to come up with stories of my own, too."

  else:

      "Sylvie helped with the script on our first video game."

Python variables need not be simple True/False values.
Variables can be used to store the player's name, a points score, or for any other purpose.
Since Ren'Py includes the ability to use the full Python programming language, many things are possible.

|
|

Music and Sound
---------------

Most Ren'Py games play music in the background.
Music is played with the ``play music`` statement.
The play music statement takes a filename that is interpreted as an audio file to play.
Audio filenames are interpreted relative to the game directory.
Audio files should be in opus, ogg vorbis, or mp3 format.

For example:

.. code-block:: python

  play music "illurock.ogg"

When changing music, one can supply a ``fadeout`` and a ``fadein`` clause, which are used to fade out the old music and fade in the new music.

.. code-block:: python

  play music "illurock.ogg" fadeout 1.0 fadein 1.0

The ``queue music`` statement plays an audio file after the current file finishes playing.

.. code-block:: python

   queue music "next_track.opus"

Music can be stopped with the ``stop music`` statement, which can also optionally take a fadeout clause.

.. code-block:: python

  stop music

Sound effects can be played with the ``play sound`` statement. Unlike music, sound effects do not loop.

.. code-block:: python

  play sound "effect.ogg"

|
|

Pause Statement
---------------

The ``pause`` statement causes Ren'Py to pause until the mouse is clicked.

.. code-block:: python

  pause

If a number is given, the pause will end when that number of seconds have elapsed.

.. code-block:: python

  pause 3.0
