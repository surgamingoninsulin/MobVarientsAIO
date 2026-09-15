# jellyfish created via BDEngine

execute as @e[tag=jellyfish_root,type=block_display] if entity @s[tag=animation_loop] at @s run function jellyfish:k/default/keyframe_0
execute as @e[tag=jellyfish_root,type=block_display] unless entity @s[tag=animation_loop] at @s run function jellyfish:_/stop_anim