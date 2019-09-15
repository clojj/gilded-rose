module Item exposing (Item(..))


import Helpers exposing (Quality, SellIn)
type Item
    = Item
        { name : String
        , quality : Quality
        , sellIn : SellIn
        }
