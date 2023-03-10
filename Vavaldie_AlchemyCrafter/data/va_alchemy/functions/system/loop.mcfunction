execute as @e[tag=vaAlc_Core] at @s run function va_alchemy:system/tick
execute if entity @e[tag=vaAlc_Core] run schedule function va_alchemy:system/loop 1t replace
