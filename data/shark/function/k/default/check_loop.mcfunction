# shark created via BDEngine

execute as @e[tag=shark_root,type=block_display] if entity @s[tag=animation_loop] at @s run function shark:k/default/keyframe_0
execute as @e[tag=shark_root,type=block_display] unless entity @s[tag=animation_loop] at @s run function shark:_/stop_anim