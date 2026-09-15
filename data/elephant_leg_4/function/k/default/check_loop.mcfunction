# elephant_leg_4 created via BDEngine

execute as @e[tag=elephant_leg_4_root,type=block_display] if entity @s[tag=animation_loop] at @s run function elephant_leg_4:k/default/keyframe_0
execute as @e[tag=elephant_leg_4_root,type=block_display] unless entity @s[tag=animation_loop] at @s run function elephant_leg_4:_/stop_anim