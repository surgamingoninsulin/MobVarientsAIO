# MobVarientsAIO

**MobVarientsAIO** ("Mob Varients All-In-One") is a combined data pack + resource
pack for Minecraft **26.0+** that adds new visual/behavioral variants of vanilla
mobs on top of the game's native mob-variant system (the same system used for
vanilla chicken variants, cow variants, etc.), without spawning any new custom
entities.

- **Author:** SurGamingOnInsulin
- **Target version:** Minecraft **26.0+** (`pack_format` 88–107)

> **Version note:** Minecraft moved from the old `1.xx.xx` versioning scheme
> to a new `YY.release` scheme starting with **26.0**. This pack targets
> that new **26.x** line specifically — do not confuse `26.0`/`26.1`/`26.2`
> with the old-style `1.21.11`/`1.21.x` numbering; they are different
> versioning eras with different `pack_format` ranges. Everything in this
> pack (data component syntax, `chicken/variant`, `minecraft:item_model`,
> component-matching recipe ingredients) is written against the 26.x
> data-driven format, not the legacy 1.21.x one.

Load it as a combined pack (it ships both `assets/` and `data/`, so drop the
whole folder into your world's `datapacks/` folder, or zip it and use it as
both a data pack and resource pack).

## What's included

### Duck (chicken variant)

- Adds **Duck** as a new `minecraft:chicken/variant`, spawning in rivers,
  swamps, mangrove swamps, and plains villages, with its own entity texture
  and a "cold"-family egg-laying model.
- Ducks lay a reskinned **Duck Egg** (`minecraft:egg` restyled via the
  `minecraft:item_model` + `minecraft:item_name` components, same idea
  vanilla uses for brown/blue chicken eggs) instead of a regular egg.
- Killing a duck drops **Raw Duck** instead of raw chicken (a reskinned
  `minecraft:chicken`), and killing one while it's on fire drops
  **Cooked Duck** directly (a reskinned `minecraft:cooked_chicken`),
  matching vanilla's on-fire-drop behavior for chicken.
- **Raw Duck cooks into Cooked Duck**, not plain cooked chicken — custom
  furnace, smoker, and campfire recipes match on the item's
  `minecraft:item_model` component so only Raw Duck (not regular raw
  chicken) converts, and the output carries the Cooked Duck name/model.
  Vanilla raw chicken keeps smelting into vanilla cooked chicken as normal.
- Recipes unlock automatically (added to the recipe book) the first time a
  player picks up a Raw Duck.
- Duck Spawn Eggs are available via
  `/function mobvarientsaio:give_duck_spawn_egg`.

### Why items are "reskinned" vanilla items, not brand-new item IDs

Vanilla data packs can't register new item types — only new *variants* of
existing items using data components. This pack follows that constraint
everywhere: Duck Egg is still `minecraft:egg`, Raw Duck is still
`minecraft:chicken`, and Cooked Duck is still `minecraft:cooked_chicken`
under the hood, just re-skinned and renamed. This keeps full compatibility
with anything that expects those base items (composters, campfires,
hoppers/comparators counting food, other data packs' recipes, etc.).

### `minecraft:item_model` + `minecraft:item_name`, not `custom_model_data`

Every reskin in this pack is done with two components set directly on the
item stack:

- **`minecraft:item_model`** — points straight at the model to render
  (e.g. `mobvarientsaio:item/duck_egg`), no indirection needed.
- **`minecraft:item_name`** — the display name, rendered like a normal
  (non-italic) item name rather than a player-given rename.

Earlier drafts of this pack used the older `custom_model_data` pattern —
give the item a `custom_model_data` string, then add a `select`-model
override at `assets/minecraft/items/<base_item>.json` that maps that
string to a model. That's still how a few unrelated vanilla items
(potions, some spawn eggs pre-26.x) resolve their models, but it has two
real downsides here:

1. It requires **owning and overwriting a shared vanilla file**
   (`assets/minecraft/items/egg.json`, `chicken.json`,
   `chicken_spawn_egg.json`, `cooked_chicken.json`). Any other resource
   pack or data pack that also reskins eggs/chicken/cooked chicken has to
   overwrite the *same* file, and only one pack's version wins — that's
   exactly how the original "Clucking Ducks" file this project started
   from ended up with a dead `earth_animals:` case baked into it.
2. It's an unnecessary extra hop: `custom_model_data` is meant for
   *choosing between* several possible models on the base item; when you
   just want "this specific stack always renders as this specific model,"
   `item_model` sets that directly and needs no shared override file at
   all.

So this pack no longer ships anything under `assets/minecraft/`. Every
model swap and every recipe/loot-table/advancement condition that used to
key off `custom_model_data` now keys off `minecraft:item_model` instead —
same component doubles as both "what to render" and "what to match
against."

## Give commands

```
/function mobvarientsaio:give_duck_spawn_egg
/function mobvarientsaio:give_duck_egg
/function mobvarientsaio:give_raw_duck
/function mobvarientsaio:give_cooked_duck
```

## Roadmap: more variants

MobVarientsAIO is meant to grow beyond ducks. Planned/likely future
variants follow the same "remodel + retexture an existing vanilla mob"
approach used for ducks, for example:

- **Tiger** — a `minecraft:cow/variant` remodel + retexture (new stripes
  texture, tiger-shaped model swap) rather than a new entity.
- Additional chicken/cow/pig/etc. variants as the vanilla mob-variant
  system expands to more base mobs.

Each new variant should follow the existing project layout:

```
data/mobvarientsaio/<mob>_variant/<variant_name>.json   # variant definition + spawn conditions
assets/mobvarientsaio/textures/entity/<mob>/<variant_name>.png
assets/mobvarientsaio/models/item/<variant_name>_spawn_egg.json
data/mobvarientsaio/function/give_<variant_name>_spawn_egg.mcfunction
```

Plus, when a variant needs its own "drops something different" or
"cooks into something different" mechanic (like ducks do), mirror the
`minecraft:item_model` reskin + `data/minecraft/loot_table/entities/<mob>.json`
override pattern used for chicken/raw_duck/cooked_duck in this pack —
never add a file under `assets/minecraft/`.

## On datapack libraries (Bookshelf, etc.)

Everything in this pack is implemented with pure vanilla data-driven
mechanics (data components, `minecraft:item_model`/`minecraft:item_name`,
loot table `entity_properties`/`components` predicates, and
component-matching recipe ingredients) — no external library dependency
(e.g. [Bookshelf](https://github.com/G-rositea/Bookshelf)) is required for
variant reskinning, egg-laying, drops, or cooking.

A library like Bookshelf becomes worth pulling in once future variants
need things vanilla data packs can't express on their own — persistent
per-player/per-entity state beyond a component, complex scoreboard-driven
logic, or shared utility functions across many variant packs. If/when a
future variant (tiger, etc.) needs that, add it as a separate dependency
data pack rather than folding its internals into this one.

## Notes / known limitations

- `pack.png`, `raw_duck.png`, and `cooked_duck.png` textures included here
  are functional placeholders (flat pixel-art) — swap them for final art
  before release.
- The furnace/smoker/campfire recipes rely on component-aware ingredient
  matching (matching `minecraft:chicken` items by their
  `minecraft:item_model`). If a specific 26.x build you're targeting (26.0
  and up, not the old 1.21.x line) doesn't support component predicates on
  cooking ingredients, those three recipe files are the only thing to
  revisit — everything else (variant definition, egg laying, death drops)
  uses well-established entity-loot-table component predicates already
  proven by this pack's duck-egg mechanic.
