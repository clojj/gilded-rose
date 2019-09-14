module Main exposing (main)

import GildedRose exposing (Item, showItem, updateQuality)
import Html
import List exposing (map)
import String exposing (join)


main : Html.Html msg
main =
    Html.text <| join "," <| map showItem (updateQuality [ Item "Backstage passes to a TAFKAL80ETC concert" 10 41 ])
