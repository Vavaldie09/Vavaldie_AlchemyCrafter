#比較対象をストレージにコピー
execute as @e[type=item,tag=!vaAlc_NotRecipi,limit=1,distance=..1] run tag @s add vaAlc_TargetItem
data modify storage va_tmp: Data.Item02 set value "Null"



#------------------------------------------------------------------------
#レシピの一致条件を増やしたい方は、下記の例に倣って記述を追加していってください
#------------------------------------------------------------------------
#Vanilla(アイテムidでチェック)
#Vanillaの3行目に、"tag.va"のつくアイテムを除外するifがあります。
#条件を追加する際は必ずバニラアイテムに巻き込まれないよう、ここで除外しましょう。
execute if data entity @s {item:{tag:{RecipiType:"Vanilla"}}} run data modify storage va_tmp: Data.Item01 set from entity @s item.id
execute if data entity @s {item:{tag:{RecipiType:"Vanilla"}}} as @e[tag=vaAlc_TargetItem,distance=..1] run data modify storage va_tmp: Data.Item02 set from entity @s Item.id
execute if data entity @s {item:{tag:{RecipiType:"Vanilla"}}} as @e[tag=vaAlc_TargetItem,distance=..1] if data entity @s Item.tag.va run scoreboard players set vaMISS va_Test 1


#va(自作タグ"va.id"でチェック)
execute if data entity @s {item:{tag:{RecipiType:"va"}}} run data modify storage va_tmp: Data.Item01 set from entity @s item.tag.va.id
execute if data entity @s {item:{tag:{RecipiType:"va"}}} as @e[tag=vaAlc_TargetItem,distance=..1] run data modify storage va_tmp: Data.Item02 set from entity @s Item.tag.va.id


#------------------------------------------------------------------------
#------------------------------------------------------------------------



#同じデータはコピーに失敗する特性を生かして、successでif分岐(vaMISS va_Test=0で成功)
execute unless score vaMISS va_Test matches 0.. store success score vaMISS va_Test run data modify storage va_tmp: Data.Item01 set from storage va_tmp: Data.Item02