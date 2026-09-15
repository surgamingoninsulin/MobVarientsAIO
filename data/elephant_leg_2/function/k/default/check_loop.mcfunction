# elephant_leg_2 created via BDEngine

execute as @e[tag=elephant_leg_2_root,type=block_display] if entity @s[tag=animation_loop] at @s run function elephant_leg_2:k/default/keyframe_0
execute as @e[tag=elephant_leg_2_root,type=block_display] unless entity @s[tag=animation_loop] at @s run function elephant_leg_2:_/stop_anim