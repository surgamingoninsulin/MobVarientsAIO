# elephant_leg created via BDEngine

execute as @e[tag=elephant_leg_root,type=block_display] if entity @s[tag=animation_loop] at @s run function elephant_leg:k/default/keyframe_0
execute as @e[tag=elephant_leg_root,type=block_display] unless entity @s[tag=animation_loop] at @s run function elephant_leg:_/stop_anim