function va_alchemy:if

execute if score vaMISS va_Test matches 0 as @e[tag=vaAlc_TargetItem,distance=..1] run data modify entity @e[tag=vaAlc_Core,distance=..0.1,limit=1] item.tag.ItemTMPList prepend from entity @s Item 
execute if score vaMISS va_Test matches 0 as @e[tag=vaAlc_TargetItem,distance=..1] run data modify entity @e[tag=vaAlc_Core,distance=..0.1,limit=1] item.tag.ItemTMPList[0].Count set value 1b
execute if score vaMISS va_Test matches 0 as @e[tag=vaAlc_TargetItem,distance=..1] store result score vaCountTMP va_Test run data get entity @s Item.Count
execute if score vaMISS va_Test matches 0 run scoreboard players remove vaCountTMP va_Test 1
execute if score vaMISS va_Test matches 0 as @e[tag=vaAlc_TargetItem,distance=..1] store result entity @s Item.Count byte 1 run scoreboard players get vaCountTMP va_Test
execute if score vaMISS va_Test matches 0 as @e[tag=vaAlc_Recipi,distance=0.000000001..0.1,sort=nearest,limit=1] run data modify entity @s Glowing set value 1b
execute if score vaMISS va_Test matches 0 as @e[tag=vaAlc_Recipi,distance=0.000000001..0.1,sort=nearest,limit=1] run data modify entity @e[tag=vaAlc_Core,distance=..0.1,limit=1] item.id set from entity @s item.id
execute if score vaMISS va_Test matches 0 as @e[tag=vaAlc_Recipi,distance=0.000000001..0.1,sort=nearest,limit=1] run data modify entity @e[tag=vaAlc_Core,distance=..0.1,limit=1] item.tag.CustomModelData set from entity @s item.tag.CustomModelData
execute if score vaMISS va_Test matches 0 as @e[tag=vaAlc_NotRecipi,distance=..1] run tag @s remove vaAlc_NotRecipi
execute if score vaMISS va_Test matches 0 as @e[tag=vaAlc_Core,distance=..0.1,limit=1] unless data entity @s {item:{tag:{va:{NoEffect:1b}}}} run particle end_rod ~ ~0.1 ~ 0.1 0 0.1 0.02 4 normal @a
execute if score vaMISS va_Test matches 0 as @e[tag=vaAlc_Core,distance=..0.1,limit=1] unless data entity @s {item:{tag:{va:{NoEffect:1b}}}} run playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 1 2 0
execute if score vaMISS va_Test matches 0 run kill @s

execute if score vaMISS va_Test matches 1 as @e[tag=vaAlc_TargetItem,distance=..1] run tag @s add vaAlc_NotRecipi

#お片付け
scoreboard players reset vaMISS va_Test
scoreboard players reset vaCountTMP va_Test
data remove storage va_tmp: Data
execute as @e[tag=vaAlc_TargetItem,distance=..1] run tag @s remove vaAlc_TargetItem
