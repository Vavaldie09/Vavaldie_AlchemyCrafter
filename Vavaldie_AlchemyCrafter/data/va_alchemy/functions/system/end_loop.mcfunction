summon item ~ ~ ~ {Tags:["vaAlc_ReleaseItemS"],Item:{id:"minecraft:stone",Count:1b}}
data modify entity @e[tag=vaAlc_ReleaseItemS,distance=..0.1,limit=1] Item set from entity @s item.tag.ItemTMPList[0]
data remove entity @s item.tag.ItemTMPList[0]
execute as @e[tag=vaAlc_ReleaseItemS] run tag @s remove vaAlc_ReleaseItemS
execute if data entity @s item.tag.ItemTMPList[0] as @s at @s run function va_alchemy:system/end_loop
