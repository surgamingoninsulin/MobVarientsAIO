# elephant_head created via BDEngine

execute as @e[tag=elephant_head_root,type=block_display] if entity @s[tag=animation_loop] at @s run function elephant_head:k/default/keyframe_0
execute as @e[tag=elephant_head_root,type=block_display] unless entity @s[tag=animation_loop] at @s run function elephant_head:_/stop_anim