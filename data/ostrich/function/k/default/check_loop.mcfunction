# ostrich created via BDEngine

execute as @e[tag=ostrich_root,type=block_display] if entity @s[tag=animation_loop] at @s run function ostrich:k/default/keyframe_0
execute as @e[tag=ostrich_root,type=block_display] unless entity @s[tag=animation_loop] at @s run function ostrich:_/stop_anim