execute if data storage va_alc: Data.RecipiList[0] run summon item_display ~ ~ ~ {Tags:["vaAlc_Recipi","vaAlc_RecipiS"],item_display:"gui",item:{id:"minecraft:diamond",Count:1b}}
execute if data storage va_alc: Data.RecipiList[0] as @e[tag=vaAlc_RecipiS,distance=..0.1] run data modify entity @s item set from storage va_alc: Data.RecipiList[0]
execute if data storage va_alc: Data.RecipiList[0] as @e[tag=vaAlc_RecipiS,distance=..0.1] unless data entity @s item.tag.RecipiType run data modify entity @s item.tag.RecipiType set value "Vanilla"
execute if data storage va_alc: Data.RecipiList[0] as @e[tag=vaAlc_Core,distance=..0.1] run data modify entity @s item.id set from storage va_alc: Data.RecipiList[0].id
execute if data storage va_alc: Data.RecipiList[0] as @e[tag=vaAlc_Core,distance=..0.1] run data modify entity @s item.tag.CustomModelData set from storage va_alc: Data.RecipiList[0].tag.CustomModelData
execute if data storage va_alc: Data.RecipiList[0] as @e[tag=vaAlc_RecipiS,distance=..0.1] run data merge entity @s {transformation:{translation:[0.0f,0.25f,1.0f],scale:[0.2f,0.2f,0.2f]}}
execute if data storage va_alc: Data.RecipiList[0] as @e[tag=vaAlc_RecipiS,distance=..0.1] run tag @s remove vaAlc_RecipiS
execute if data storage va_alc: Data.RecipiList[0] as @e[tag=vaAlc_Recipi,distance=..0.1] at @s run teleport @s ~ ~0.0001 ~ ~-14.4 0

execute if data storage va_alc: Data.RecipiList[0] run data remove storage va_alc: Data.RecipiList[0]
execute if data storage va_alc: Data.RecipiList[0] as @s at @s run function va_alchemy:system/set_loop

execute unless data storage va_alc: Data.RecipiList[0] as @e[tag=vaAlc_Recipi,distance=0.000000001..0.1,sort=nearest,limit=1] run data modify entity @s Glowing set value 1b
execute unless data storage va_alc: Data.RecipiList[0] run function va_alchemy:system/loop
