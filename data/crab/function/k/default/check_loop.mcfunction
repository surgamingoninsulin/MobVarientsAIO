# crab created via BDEngine

execute as @e[tag=crab_root,type=block_display] if entity @s[tag=animation_loop] at @s run function crab:k/default/keyframe_0
execute as @e[tag=crab_root,type=block_display] unless entity @s[tag=animation_loop] at @s run function crab:_/stop_anim