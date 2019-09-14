module Item exposing (Item(..))


type Item
    = Item
        { name : String
        , quality : Int
        , sellIn : Int
        }
