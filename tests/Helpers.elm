module Helpers exposing (updateOne)

import GildedRose exposing (Item, updateQuality)


updateOne : Item -> Item
updateOne item =
    updateQuality [ item ]
        |> List.head
        |> Maybe.withDefault item
