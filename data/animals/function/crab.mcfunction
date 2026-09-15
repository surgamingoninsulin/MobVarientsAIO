execute as @s positioned ~ ~0.5 ~ run function crab:_/create
execute as @s positioned ~ ~0.5 ~ run summon cow ~ ~ ~ {Tags:["crab"],Silent:1b,DeathLootTable:"minecraft:empty",PersistenceRequired:1b,CustomName:"Crab",active_effects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:0b}],attributes:[{id:"minecraft:scale",base:0.5}]}
execute as @s run kill @s