#上級者向けテクニックです。
#"RecipiType"を使えば、「レシピで一致するか」を参照する条件を変えることが出来ます。
#このデタパでは何の指定もない場合「"Item.id"が一致すれば、多少エンチャしてあったり名前が違ったりしても『レシピ通り』とする」という作りになっていて、
#ここの条件式は"function va_alchemy:if"で確認する事ができます。
#"function va_alchemy:if"を見て「あーなるほど完全に理解した」と言えるコマンダーのみ使いましょう。
#分からないけど使いたい場合は、作者に直接聞くと教えてくれます。

data modify storage va_alc: Data set value {}

#要求素材
data modify storage va_alc: Data.RecipiList prepend value {id:"minecraft:iron_ingot",Count:1b,tag:{RecipiType:"va",CustomModelData:101001,va:{id:"Bonium"}}}
data modify storage va_alc: Data.RecipiList prepend value {id:"minecraft:iron_ingot",Count:1b,tag:{RecipiType:"va",CustomModelData:101001,va:{id:"Bonium"}}}
data modify storage va_alc: Data.RecipiList prepend value {id:"minecraft:iron_ingot",Count:1b,tag:{RecipiType:"va",CustomModelData:101001,va:{id:"Bonium"}}}
data modify storage va_alc: Data.RecipiList prepend value {id:"minecraft:iron_ingot",Count:1b,tag:{RecipiType:"va",CustomModelData:101001,va:{id:"Bonium"}}}
data modify storage va_alc: Data.RecipiList prepend value {id:"minecraft:iron_ingot",Count:1b,tag:{RecipiType:"va",CustomModelData:101001,va:{id:"Bonium"}}}
data modify storage va_alc: Data.RecipiList prepend value {id:"minecraft:iron_ingot",Count:1b,tag:{RecipiType:"va",CustomModelData:101001,va:{id:"Bonium"}}}
data modify storage va_alc: Data.RecipiList prepend value {id:"minecraft:iron_ingot",Count:1b,tag:{RecipiType:"va",CustomModelData:101001,va:{id:"Bonium"}}}
data modify storage va_alc: Data.RecipiList prepend value {id:"minecraft:iron_ingot",Count:1b,tag:{RecipiType:"va",CustomModelData:101001,va:{id:"Bonium"}}}
data modify storage va_alc: Data.RecipiList prepend value {id:"minecraft:gold_ingot",Count:1b}
data modify storage va_alc: Data.RecipiList prepend value {id:"minecraft:gold_ingot",Count:1b}
data modify storage va_alc: Data.RecipiList prepend value {id:"minecraft:gold_ingot",Count:1b}
data modify storage va_alc: Data.RecipiList prepend value {id:"minecraft:gold_ingot",Count:1b}
data modify storage va_alc: Data.RecipiList prepend value {id:"minecraft:redstone_block",Count:1b}

#完成品のloot_tableパス
data modify storage va_alc: Data.Product_Loot set value "va_item:weapon/puppet/bone"
function va_alchemy:start
