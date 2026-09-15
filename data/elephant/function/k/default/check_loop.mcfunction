# elephant created via BDEngine

execute as @e[tag=elephant_root,type=block_display] if entity @s[tag=animation_loop] at @s run function elephant:k/default/keyframe_0
execute as @e[tag=elephant_root,type=block_display] unless entity @s[tag=animation_loop] at @s run function elephant:_/stop_anim