# elephant_body created via BDEngine

execute as @e[tag=elephant_body_root,type=block_display] if entity @s[tag=animation_loop] at @s run function elephant_body:k/default/keyframe_0
execute as @e[tag=elephant_body_root,type=block_display] unless entity @s[tag=animation_loop] at @s run function elephant_body:_/stop_anim