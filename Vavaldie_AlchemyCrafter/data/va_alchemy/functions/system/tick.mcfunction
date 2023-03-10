execute as @e[tag=vaAlc_Recipi,distance=..0.1] at @s run teleport @s ~ ~ ~ ~5 0

execute as @e[tag=vaAlc_Recipi,distance=..0.1,limit=1,sort=nearest] at @s if entity @e[type=item,tag=!vaAlc_NotRecipi,distance=..1] run function va_alchemy:system/check
execute unless entity @e[tag=vaAlc_Recipi,distance=..0.1] as @s at @s run function va_alchemy:system/craft

execute unless entity @a[distance=..4] as @s at @s run function va_alchemy:system/end
