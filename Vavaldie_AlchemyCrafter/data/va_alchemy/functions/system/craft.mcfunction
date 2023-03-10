execute unless data entity @s {item:{tag:{va:{NoEffect:1b}}}} run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 0 0
execute unless data entity @s {item:{tag:{va:{NoEffect:1b}}}} run particle totem_of_undying ~ ~ ~ 0 0 0 1 16 normal @a

#アイテム直貼りの場合
execute if data entity @s item.tag.va.Product_List[0] as @s at @s run function va_alchemy:system/craft_loop

#LootTableの場合
execute if data entity @s item.tag.va.Product_Loot run summon chest_minecart ~ ~ ~ {Tags:["vaAlc_ProductCart"],LootTable:"minecraft:empty"}
execute if data entity @s item.tag.va.Product_Loot run data modify entity @e[tag=vaAlc_ProductCart,distance=..0.1,limit=1] LootTable set from entity @s item.tag.va.Product_Loot
execute if data entity @s item.tag.va.Product_Loot run kill @e[tag=vaAlc_ProductCart,distance=..0.1]
kill @s
