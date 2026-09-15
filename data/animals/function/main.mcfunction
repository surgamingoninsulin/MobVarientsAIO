#SPAWN FREQUENCY
execute as @a if score @s timer_animals matches 7000..10000 run scoreboard players reset @s timer_animals
execute as @r at @s if score @s timer_animals matches 500..501 run function animals:random
execute as @r at @s if score @s timer_animals matches 5000..5001 run function animals:random
execute as @r at @s if score @s timer_animals matches 2000..2001 run function animals:random
#ELEPHANT
execute as @e[type=cow,tag=elephant] at @s run teleport @e[type=block_display,tag=elephant_root,sort=nearest,limit=1] ^ ^ ^ ~ 0
execute as @e[type=cow,tag=elephant] store result score @s elephant_motion run data get entity @s Motion[0] 100
execute as @e[type=cow,tag=elephant] at @s if score @s elephant_motion matches 1..2 run function elephant:a/default/play_anim
execute as @e[type=cow,tag=elephant] at @s if score @s elephant_motion matches -2..-1 run function elephant:a/default/play_anim
execute as @e[type=cow,tag=elephant] at @s if score @s elephant_motion matches 8..9 run function elephant:a/default/play_anim
execute as @e[type=cow,tag=elephant] at @s if score @s elephant_motion matches -9..-8 run function elephant:a/default/play_anim
execute as @e[type=cow,tag=elephant] if score @s elephant_motion matches 50..20000 run scoreboard players reset @s elephant_motion
execute as @e[type=cow,tag=elephant] store result score @s healthelephant_npc run data get entity @s Health 1.0
execute as @e[type=cow,tag=elephant] at @s if score @s healthelephant_npc matches 0..8 run kill @e[tag=elephant,distance=..2]
#JELLYFISH
execute as @e[type=drowned,tag=jellyfish] at @s run teleport @e[type=block_display,tag=jellyfish_root,sort=nearest,limit=1] ^ ^ ^ ~ ~
execute as @r at @s if score @s timer_jellyfish_anim matches 0..1 run function jellyfish:a/default/play_anim
execute as @a if score @s timer_jellyfish_anim matches 61..1000 run scoreboard players reset @a timer_jellyfish_anim
execute as @e[type=drowned,tag=jellyfish] store result score @s healthjellyfish_npc run data get entity @s Health 1.0
execute as @e[type=drowned,tag=jellyfish] at @s if score @s healthjellyfish_npc matches 0..8 run kill @e[tag=jellyfish,distance=..2]
#SHARK
execute as @e[type=drowned,tag=shark] at @s run teleport @e[type=block_display,tag=shark_root,sort=nearest,limit=1] ^ ^ ^ ~-90 ~
execute as @r at @s if score @s timer_shark_anim matches 0..1 run function shark:a/default/play_anim
execute as @a if score @s timer_shark_anim matches 43..1000 run scoreboard players reset @a timer_shark_anim
execute as @e[type=drowned,tag=shark] store result score @s healthshark_npc run data get entity @s Health 1.0
execute as @e[type=drowned,tag=shark] at @s if score @s healthshark_npc matches 0..8 run kill @e[tag=shark,distance=..2]
#CRAB
execute as @e[type=cow,tag=crab] at @s run teleport @e[type=block_display,tag=crab_root,sort=nearest,limit=1] ^ ^ ^ ~ 0
execute as @e[type=cow,tag=crab] store result score @s crab_motion run data get entity @s Motion[0] 100
execute as @e[type=cow,tag=crab] at @s if score @s crab_motion matches 1..2 run function crab:a/default/play_anim
execute as @e[type=cow,tag=crab] at @s if score @s crab_motion matches -2..-1 run function crab:a/default/play_anim
execute as @e[type=cow,tag=crab] at @s if score @s crab_motion matches 8..9 run function crab:a/default/play_anim
execute as @e[type=cow,tag=crab] at @s if score @s crab_motion matches -9..-8 run function crab:a/default/play_anim
execute as @e[type=cow,tag=crab] if score @s crab_motion matches 50..20000 run scoreboard players reset @s crab_motion
execute as @e[type=cow,tag=crab] store result score @s healthcrab_npc run data get entity @s Health 1.0
execute as @e[type=cow,tag=crab] at @s if score @s healthcrab_npc matches 0..8 run kill @e[tag=crab,distance=..2]
#OSTRICH
execute as @e[type=cow,tag=ostrich] at @s run teleport @e[type=block_display,tag=ostrich_root,sort=nearest,limit=1] ^ ^ ^ ~-180 0
execute as @e[type=cow,tag=ostrich] store result score @s ostrich_motion run data get entity @s Motion[0] 100
execute as @e[type=cow,tag=ostrich] at @s if score @s ostrich_motion matches 1..2 run function ostrich:a/default/play_anim
execute as @e[type=cow,tag=ostrich] at @s if score @s ostrich_motion matches -2..-1 run function ostrich:a/default/play_anim
execute as @e[type=cow,tag=ostrich] at @s if score @s ostrich_motion matches 8..9 run function ostrich:a/default/play_anim
execute as @e[type=cow,tag=ostrich] at @s if score @s ostrich_motion matches -9..-8 run function ostrich:a/default/play_anim
execute as @e[type=cow,tag=ostrich] if score @s ostrich_motion matches 50..20000 run scoreboard players reset @s crab_motion
execute as @e[type=cow,tag=ostrich] store result score @s healthostrich_npc run data get entity @s Health 1.0
execute as @e[type=cow,tag=ostrich] at @s if score @s healthostrich_npc matches 0..8 run kill @e[tag=ostrich,distance=..2]
#LAG PREVENTION
execute as @e[tag=elephant] at @s unless entity @a[distance=0..200] run kill @s
execute as @e[tag=jellyfish] at @s unless entity @a[distance=0..200] run kill @s
execute as @e[tag=shark] at @s unless entity @a[distance=0..200] run kill @s
execute as @e[tag=crab] at @s unless entity @a[distance=0..200] run kill @s
execute as @e[tag=ostrich] at @s unless entity @a[distance=0..200] run kill @s