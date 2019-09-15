module Helpers exposing (updateOne, GildedRose, showItem, Quality, SellIn)

import GildedRose exposing (Item(..), updateQuality)
import String exposing (fromInt)

type alias Quality = Int
type alias SellIn = Int

type alias GildedRose =
    List Item

updateOne : Item -> Item
updateOne item =
    updateQuality [ item ]
        |> List.head
        |> Maybe.withDefault item

showItem : Item -> String
showItem (Item name sellIn quality) =
    "ITEM " ++ name ++ ", sellIn " ++ fromInt sellIn ++ ", quality " ++ fromInt quality

