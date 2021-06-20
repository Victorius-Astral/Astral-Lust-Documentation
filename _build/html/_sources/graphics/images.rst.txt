Images and wallpapers
=====================

Replace game images
-------------------

To replace game image check .rpy files or use developer tools to find what name the image has,
now we only need to use ``image name = "path/image"`` statements. As name we use the image's you want to change name.
You should change it using code instead of just replacing images because after removing your mod the game will be vanilla again.
To change defined images (like animations) ``init offset = 1`` is required.

.. code-block:: python

  init offset = 1

  # Change player's room day image
  image bg hotel player = "mods/MyMod/new hotel image.webp"

|
|

Add wallpaper
-------------

Warning!
For now, removing the wallpaper images will cause error even if mod was removed, so don't delete the wallpapers.

.. code-block:: python
  :linenos:

  init 11 python:
    # This adds new wallpaper to our game
    wallpapers_update.update({"My wallpaper name": [
      None, # [0] Code
      False, # [1] Unlocked, set to True to be unlocked from the start
      False # [2] Movie, set true if you have animated version, not animated is still required
    ]})

|

If you want your wallpaper to be unlockable with code, use a string with code's hash, use this in `python 2.7 online interpreter <https://repl.it/languages/python>`_ to get hash code:

.. code-block:: python

  x = hashlib.sha224(b"code").hexdigest() # change code to your own
  print(x)
