# Vavaldie_AlchemyCrafter
魔法みたいなクラフトシステムを作る基礎となるデタパです。<br>
<br>
## 【なんぞこれ】<br>
某ボタニカルなMODのクラフトに似たシステム「を実装する時」に使えるデタパ…そんなライブラリです。<br>
クラフトレシピの作り方などのシステム全般がここにぎゅぎゅっと詰まっていて、<br>
あとはクラフトレシピ呼び出す方法と演出をお好みで添えるだけです。<br>
<br>
## 【使い方】<br>
data modifyでストレージ"va_alc:"内のレシピデータを定義してからfunctionを実行するだけで、<br>
簡単お手軽にクラフトを開始できます。<br>
基本的にはデータパック内の"va_alchemy:recipi/sample01,2,3"を見れば<br>
大体の使い方が学べます。流れとしては…<br>
・data modify storage va_alc: Data set value {...}でレシピデータをセット<br>
・function va_alchemy:startを実行<br>
これさえ掴めていればOK!<br>
<br>
## 【利用可能なデータ】<br>
data modify storage va_alc: Data.(ここにデータを入れて、クラフトレシピを作りましょう。)<br>
```
Data.NoEffect
{Data:{NoEffect:1b}}
```
効果音やパーティクルを実行しなくなります。<br>
自分で演出を0から作りたい人におススメ<br>
因みに書かないとNoEffect:0bが勝手に入ります。省略可。
<br><br>
```
Data.NoText
{Data:{NoText:1b}}
```
【素材を投入してください】の文字が消えます。<br>
因みに書かないとNoText:0bが勝手に入ります。省略可。<br>
<br><br>
```
Data.Text
{Data:{Text:'{"text":"【ここでテキストを変更できます】","color":"#ffff00"}'}}
```
【素材を投入してください】の文字を変更します。
<br><br>
```
Data.RecipiList
{Data:{RecipiList:[{id:"minecraft:gold_ingot",Count:1b},{id:"minecraft:apple",Count:1b}]}}
```
素材リストです。<br>
因みにここのアイテムがそのままレシピ兼表示されるアイテムになります。<br>
必要に応じてCustomModelDataなどを入れておきましょう。
<br><br>
```
Data.RecipiList[n].tag.RecipiType
{Data:{RecipiList:[{id:"minecraft:gold_ingot",Count:1b,tag:{RecipiType:"Vanilla"}}]}}
```
上級者向けテクニックです。<br>
このデタパでは何も指定がない限り自動ででRecipiType:"Vanilla"が入り、<br>
アイテムのidが一致すればエンチャントが違っても名前が違っても「一致」として処理します。<br>
でも自作アイテムを素材としてクラフトする際、自作したtagを使って「一致」を取る条件にしたい！って時あるじゃないすか。<br>
そんなときは"function va_alchemy:if"にちょちょいと記述して、そこで使う条件式にてこの値を使います。<br>
"function va_alchemy:if"の中身はこんな感じ。
<details>
<summary>(クリックで展開)</summary>

```
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
```

</details>

これを読んで「？？？？？」ってなった人はそっと目をそらすか作者に質問投げてください。<br>
出来る限りのお手伝いをしましょう。
<br><br>
```
Data.Product_List[]
{Data:{Product_List:[{id:"minecraft:golden_apple",Count:1b,tag:{display:{Name:'{"text":"脱法金リンゴ","italic":false}'}}}]}}
```
完成品です。よく見る形そのままです。<br>
リスト型なので、複数個のアイテムを指定できます。
<br><br>
```
Data.Product_Loot
{Data:{Product_Loot:"vavaldie:loot/test"}}
```
完成品をルートテーブルで指定します。<br>
パスを入れればそのルートを呼び出すので、ガチャも作れます。
<br><br>
<br>
…で。

```
data modify storage va_alc: Data set value {NoEffect:1b, NoText:1b, Text:'{"text":"【ここでテキストを変更できます】","color":"#ffff00"}', RecipiList:[{id:"minecraft:gold_ingot",Count:1b},{id:"minecraft:apple",Count:1b}], Product_List:[{id:"minecraft:golden_apple",Count:1b,tag:{display:{Name:'{"text":"脱法金リンゴ","italic":false}'}}}]}
function va_alchemy:start
```
これで、「演出なし、指示テキストなし、金インゴット1つとリンゴ1つで『脱法金リンゴ』を作るレシピ」になりました。<br>
とりあえず初めは冒頭でも言ったサンプルのファンクションを読みましょう。<br>
<br>
## 【Credit】
-Vavaldie_AlchemyCrafter-<br>
作者:Vavaldie<br>
Twitter:[@vavaldie09](https://twitter.com/vavaldie09)<br><br>
データパックは作者詐称などの常識的に考えてアカン行為をしない限り、二次配布も解剖も自由とします。<br><br>
ヴァヴァルディさんは未来ある有望なコマンダーの卵たちを応援しています。<br>
