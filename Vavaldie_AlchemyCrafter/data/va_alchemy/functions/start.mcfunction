execute as @e[tag=vaAlc_Core,distance=..0.1] at @s run function va_alchemy:system/end
execute unless data storage va_alc: Data.RecipiList[0] run scoreboard players set vaEroor va_Test 1
execute if data storage va_alc: Data.RecipiList[24] run scoreboard players set vaEroor va_Test 2

execute unless score vaEroor va_Test matches 1.. unless entity @e[tag=vaAlc_Core,distance=..0.1] run summon minecraft:item_display ~ ~ ~ {CustomNameVisible:1b,CustomName:'{"text":"【素材を投入してください】"}',Tags:["vaAlc_Core"],item_display:"gui",billboard:"vertical",item:{id:"minecraft:diamond",Count:1b}}
execute unless score vaEroor va_Test matches 1.. as @e[tag=vaAlc_Core,distance=..0.1] run data merge entity @s {transformation:{scale:[0.5f,0.5f,0.5f]}}
execute unless score vaEroor va_Test matches 1.. as @e[tag=vaAlc_Core,distance=..0.1] run data modify entity @s item.tag.va.Product_Loot set from storage va_alc: Data.Product_Loot
execute unless score vaEroor va_Test matches 1.. as @e[tag=vaAlc_Core,distance=..0.1] run data modify entity @s item.tag.va.Product_List set from storage va_alc: Data.Product_List
execute unless score vaEroor va_Test matches 1.. as @e[tag=vaAlc_Core,distance=..0.1] store result entity @s item.tag.va.NoEffect byte 1 run data get storage va_alc: Data.NoEffect 1
execute unless score vaEroor va_Test matches 1.. as @e[tag=vaAlc_Core,distance=..0.1] if data storage va_alc: Data.Text run data modify entity @s CustomName set from storage va_alc: Data.Text
execute unless score vaEroor va_Test matches 1.. as @e[tag=vaAlc_Core,distance=..0.1] if data storage va_alc: {Data:{NoText:1b}} run data modify entity @s CustomName set value ''
execute unless score vaEroor va_Test matches 1.. as @e[tag=vaAlc_Core,distance=..0.1,sort=nearest] at @s run function va_alchemy:system/set_loop

execute if score vaEroor va_Test matches 1 run tellraw @a {"text":"[!Eroor!]レシピがありません","color":"red"}
execute if score vaEroor va_Test matches 2 run tellraw @a {"text":"[!Eroor!]レシピが長すぎます!レシピにするアイテムの最大数は24個です。","color":"red"}
scoreboard players reset vaEroor va_Test
data remove storage va_alc: Data
