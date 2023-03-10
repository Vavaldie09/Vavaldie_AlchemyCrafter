data modify storage va_alc: Data set value {NoEffect:1b}

#要求素材
#prepend/appendを使えば、こうして大量のデータを小分けにして追加する事ができます。
#ただしprependした後に"Data set value"すると足したデータが全て上書きされてしまうので気を付けましょう。というかmergeを使いましょう。

data modify storage va_alc: Data.RecipiList prepend value {id:"minecraft:redstone_block",Count:1b}
data modify storage va_alc: Data.RecipiList prepend value {id:"minecraft:redstone_block",Count:1b}
data modify storage va_alc: Data.RecipiList prepend value {id:"minecraft:redstone_block",Count:1b}
data modify storage va_alc: Data.RecipiList prepend value {id:"minecraft:redstone_block",Count:1b}
data modify storage va_alc: Data.RecipiList prepend value {id:"minecraft:orange_dye",Count:1b}
data modify storage va_alc: Data.RecipiList prepend value {id:"minecraft:purple_dye",Count:1b}
data modify storage va_alc: Data.RecipiList prepend value {id:"minecraft:lime_dye",Count:1b}

#完成品ルート
#"Product_Loot"を使えば、完成品に指定したパスのLootTableを仕組むことができます。
#ここでは古代都市のチェストになっていますが、executeでイベントを起こすトリガーとなるアイテムを出したり
#自作アイテムのルートを入れるなど、様々な使い方があることでしょう。知らんけど。
data modify storage va_alc: Data.Product_Loot set value "minecraft:chests/ancient_city"


function va_alchemy:start
