# jellyfish created via BDEngine

execute as @e[tag=jellyfish_root,type=block_display] at @s run tag @s remove animation_pause
execute as @e[tag=jellyfish_root,type=block_display] at @s run tag @s remove animation_loop
execute as @e[tag=jellyfish_root,type=block_display] at @s run data modify entity @e[type=minecraft:block_display,tag=jellyfish_camera,limit=1,sort=nearest] teleport_duration set value 0
schedule function jellyfish:k/default/start 0.1s
