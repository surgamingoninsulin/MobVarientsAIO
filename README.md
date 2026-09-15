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
> pack (data component syntax, `chicken/variant`, `select`-model item
> overrides, component-matching recipe ingredients) is written against the
> 26.x data-driven format, not the legacy 1.21.x one.

Load it as a combined pack (it ships both `assets/` and `data/`, so drop the
whole folder into your world's `datapacks/` folder, or zip it and use it as
both a data pack and resource pack).

## What's included

### Duck (chicken variant)

- Adds **Duck** as a new `minecraft:chicken/variant`, spawning in rivers,
  swamps, mangrove swamps, and plains villages, with its own entity texture
  and a "cold"-family egg-laying model.
- Ducks lay a reskinned **Duck Egg** (`minecraft:egg` restyled via
  `custom_model_data`/`item_name`, same pattern vanilla uses for
  brown/blue chicken eggs) instead of a regular egg.
- Killing a duck drops **Raw Duck** instead of raw chicken (a reskinned
  `minecraft:chicken`), and killing one while it's on fire drops
  **Cooked Duck** directly (a reskinned `minecraft:cooked_chicken`),
  matching vanilla's on-fire-drop behavior for chicken.
- **Raw Duck cooks into Cooked Duck**, not plain cooked chicken — custom
  furnace, smoker, and campfire recipes match on the item's
  `custom_model_data` component so only Raw Duck (not regular raw chicken)
  converts, and the output carries the Cooked Duck name/model. Vanilla raw
  chicken keeps smelting into vanilla cooked chicken as normal.
- Recipes unlock automatically (added to the recipe book) the first time a
  player picks up a Raw Duck.
- Duck Spawn Eggs are available via
  `/function mobvarientsaio:give_duck_spawn_egg`.

### Why items are "reskinned" vanilla items, not brand-new item IDs

Vanilla data packs can't register new item types — only new *variants* of
existing items using data components (`custom_model_data`, `item_name`,
etc.). This pack follows that constraint everywhere: Duck Egg is still
`minecraft:egg`, Raw Duck is still `minecraft:chicken`, and Cooked Duck is
still `minecraft:cooked_chicken` under the hood, just re-skinned and
renamed. This keeps full compatibility with anything that expects those
base items (composters, campfires, hoppers/comparators counting food, other
data packs' recipes, etc.).

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
`assets/minecraft/items/<base_item>.json` select-model override and
`data/minecraft/loot_table/entities/<mob>.json` override pattern used for
chicken/raw_duck/cooked_duck in this pack.

## On datapack libraries (Bookshelf, etc.)

Everything in this pack is implemented with pure vanilla data-driven
mechanics (data components, `select`-model item overrides, loot table
`entity_properties`/`components` predicates, and component-matching
recipe ingredients) — no external library dependency (e.g.
[Bookshelf](https://github.com/G-rositea/Bookshelf)) is required for
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
  `custom_model_data`). If a specific 26.x build you're targeting (26.0 and
  up, not the old 1.21.x line) doesn't
  support component predicates on cooking ingredients, those three recipe
  files are the only thing to revisit — everything else (variant
  definition, egg laying, death drops) uses well-established
  entity-loot-table component predicates already proven by this pack's
  duck-egg mechanic.
