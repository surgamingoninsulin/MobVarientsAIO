execute as @s positioned ~ ~0.5 ~ run function elephant:_/create
execute as @s positioned ~ ~0.5 ~ run summon cow ~ ~ ~ {Tags:["elephant"],Silent:1b,DeathLootTable:"minecraft:empty",PersistenceRequired:1b,CustomName:"Elephant",active_effects:[{id:"minecraft:invisibility",amplifier:0,duration:-1,show_particles:0b}],attributes:[{id:"minecraft:scale",base:2}]}
execute as @s run kill @s