Traders & Items
===============

.. _new_items:

Adding & changing new items
---------------------------

Adding new item is simple, we need to add our item to a dictionary ``goods_list``.

.. code-block:: python

  init 11 python:

    #######
    # ADD #
    #######

    # It adds new item -> SuperSecretNewItem, it has base price of 1 and belongs to Quest category.
    # You can add your own categories by simply assigning items to it.
    # Syntax is like this: goods_list.update({"NewItem": [base_price, "Category"]})
    goods_list.update({"SuperSecretNewItem": [1, "Quest"]})

    ##########
    # CHANGE #
    ##########

    # This changes wood's base price to 5
    goods_list.update({"Wood": [5, "Materials"]})

    # Alternative way to change price
    goods_list["Wood"][0] = 5

    # To change category with above method, change [0] to [1]
    # This changes wood's category to new - Basic Materials category.
    goods_list["Wood"][1] = "Basic Materials"

|
|

Change existing trader
----------------------

* :ref:`Trader class attributes <trader_attributes>`
* :ref:`Triggers <tab_triggers>`

.. code-block:: python
  :linenos:

  # Traders aren't created in init time,
  # they are unique to all saves,
  # we need to changed them at save load (it'll work only after first game load (no new game, for now))
  # Player can start new game, save and load.
  # We need to create our after_load label, don't use name after_load, add prefix

  label sample_after_load:
    python:
      # Check Trader class attributes for things to change, what they do and their type
      # This adds 10 Mysterious Coins to Hollow Market
      hollow_market.sta_goods.update({"Mysterious Coin": 10})

    # It's important to return at the end of your after_load label, otherwise game won't start correctly
    return

  init 11 python:
    # Now we need to add our after_load to execute on my after_load, we can do this with trigger system
    code = 'renpy.call("sample_after_load")'
    com_code = compile(code, "triggers", "exec")

    trigger.add("after_load_start", com_code)

    # Done! now our prefix_after_load label will execute (within python block) at the start of loading a save
|
|

List of traders
---------------

.. code-block:: python
  :linenos:

  # Traders, they are all called with default statement #
  mysterious_trader = Trader(name = "Mysterious Trader", include = ["Mysterious Coin"], sta_goods = {"Wood": 100, "Stone": 100, "Cloth": 100, "Metal": 100}, sta_cards = [Vampirism()], cards_value = {"Vampirism": 10}, rate_sell = 1.0,
    relations_dif = 10, discount_max = 0.0)

  debug_trader = Trader(name = "Debug Trader", sta_goods = {"Wood": 100, "Stone": 100, "Cloth": 100, "Metal": 100, "Mysterious Coin": 100, "Ice Creams": 10}, sta_cards = [Vampirism()], cards_value = {"Vampirism": 10}, rate_sell = 0.75, relations_dif = 10, discount_max = 0.0)
  al_7_tr = Trader(name = "Alice", sta_goods = {"Cloth": 1, "Mysterious Coin": 1}, include = [""], rate_sell = 1.0, value_player_offset = 1, goods_value = {"Mysterious Coin": 1}, locked = True, label_deal = "al7f1")
  al_7_tr2 = Trader(name = "Alice", avoid_cat = "Quest", rate_sell = 1.0, value_trader_offset = 1, locked = True, label_deal = "al7f2")

  hollow_market = Trader(name = "Hollow Market", include_cat = ["Materials"], sta_goods = {"Wood": 500, "Stone": 500, "Metal": 500, "Cloth": 500}, rate_sell = 0.5, unique = True,
    relations_dif = 25, relations_threshold = 100, discount_max = 0.1, label_exit = "")

  wanderer_trader = Trader(name = "Wandering Trader", sta_goods = {"Wood": 10, "Stone": 10, "Metal": 10, "Cloth": 10}, goods_chance = {"Mysterious Coin": [1, 1, 0.25], "Wood": [0, 5, 1.0], "Stone": [0, 5, 1.0],
    "Metal": [0, 5, 1.0], "Cloth": [0, 5, 1.0], "Ice Creams": [1, 1, 0.5], "Antibiotics": [1, 1, 0.5]})

  wanderer_daughter = Trader(name = "Wandering Trader", rate_sell = 1.0, label_exit = "exp_friendly_wanderers.trademenu", use_relations = wanderer_trader)

|
|

Defining new trader
-------------------

.. code-block:: python
  :linenos:

  init 11 python:
    # This trader has 100% chance to have between 3 to 8 wood on restock
    my_trader = Trader("TraderName", goods_chance = {"Wood": [3, 8, 1.0]})

|
|

.. _trader_attributes:

Trader class attributes
-----------------------

.. code-block:: python
  :linenos:

  class Trader(object):
    def __init__(self, name, sta_goods = {}, goods_chance = {}, sta_cards = [], relation_goods = {}, avoid = [], include = [], avoid_cat = [], include_cat = [], goods_value = {}, cards_value = {}, rate_sell = 0.75, rate_buy = 1.0, value_player_offset = 0, value_trader_offset = 0, locked = False, unique = False, label_deal = None, label_exit = None, discount = 0.001, discount_lock = True, use_relations = None, relations_dif = 6, relations_threshold = 0, discount_max = 1.0):
      self.name = name # Shop / trader name
      self.sta_goods = sta_goods # Dict {item: amount} Starting goods, used when restock is triggered
      self.sta_cards = sta_cards # List [card] Starting cards, used when restock is triggered
      self.goods_chance = goods_chance # Dict {item: [min, max, chance]} chance is float 0.0 - 1.0
      self.relation_goods = relation_goods # Dict {item: [min, max, chance, required_relation]}

      self.avoid = avoid # List of item names that can't be traded with. Those items would be excluded.
      self.include = include # List of items that can be traded with. Only those items can be used.

      self.avoid_cat = avoid_cat # List of categories to exclude.
      self.include_cat = include_cat # List of categories to include.

      self.goods_value = goods_value # Dict {item: price} Overrides default items price.
      self.cards_value = cards_value # Dict {card: price} Overrides default card price.

      self.rate_sell = rate_sell # Float, percent value player goods sell for.
      self.rate_buy = rate_buy # Float, percent value trader merchandise costs.

      self.value_player_offset = value_player_offset # With no items in deposit, player trade value = offset
      self.value_trader_offset = value_trader_offset # With no items selected, trader goods value = offset

      self.locked = locked # If player can quit the trade without making a deal
      self.unique = unique # if it has its own screen and shouldn't call trading screen instead returns categorized list [player goods, trader goods]

      # Labels to jump to after trade depending on outcome #
      self.label_deal = label_deal
      self.label_exit = label_exit

      self.discount = discount # percent of discount per one point of relation, default 0.1% per relation
      self.relations_dif = relations_dif # amount of $ traded to increase relations by 1, default 6
      self.relations_threshold = relations_threshold # relations start to increase after x$ trade value, default 0
      self.discount_max = discount_max # maximum discount, float 0.0 to 1.0. 1.0 is 100% discount
      self.discount_lock = discount_lock # Boolean, if discount is locked to min of rate_buy
      self.use_relations = use_relations # trader whose relations are used and increased

      self.goods = {}
      self.cards = []

      self.deposit_goods = {} # Item: amount
      self.deposit_cards = [] # Card

      self.selected_goods = {} # Item: amount
      self.selected_cards = [] # Card

      self.value_player = 0
      self.value_trader = 0

      self.allowed_goods = []

      self.relations = 0
      self.disc_price = 0.0

      if self.use_relations == None:
          self.use_relations = self

      self.restock()
      self.calc_discount()

|
|

Trader class methods
--------------------

* ``improve_relations(self, worth, who)``

  * ``worth`` - calculate relations improvement from this amount
  * ``who`` - which trader relations to increase

* ``calc_discount(self, who = None)``

  * ``who`` - if not None, sets trader whose relations to use

* ``restock(self, who = None, replace = True)``

  * ``who`` - which trader relations to use for relation based functions
  * ``replace`` - if True replaces items trader has

* ``rand_goods(self, min = 1, max = 10, what = None)``

  * ``min`` - minimum amount of material
  * ``max`` - maximum amount of material
  * ``what`` - if not None, it takes a list of items to randomize amount, if None it randomizes all items

* ``start_trade(self)``
* ``value(self)``
* ``deal(self)``
* ``cancel(self)``
* ``exit(self, deal = False)``

  * ``deal`` - if True it jumps to label_deal, if label_exit is defined it jumps to it otherwise it returns

* ``add_deposit(self, what, amt)``
* ``add_selected(self, what, amt)``
* ``add_inventory(self, what, amt)``
* ``add_goods(self, what, amt, rest = False)``
* ``calc_dep(self, x, mode)``
* ``calc_sel(self, x, mode)``
