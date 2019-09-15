module Types exposing (Item, nameOf, qualityOf, createItem)

import GildedRose as GR
import Helpers exposing (Quality, SellIn)


type Item
    = Item
        { rule : Rule
        , quality : Quality
        }


type Rule
    = Normal String SellIn
    | BackstagePass SellIn
    | AgedBrie SellIn
    | Sulfuras


nameOf : Item -> String
nameOf (Item { rule }) =
    case rule of
        Normal name _ ->
            name

        BackstagePass _ ->
            "Backstage passes to a TAFKAL80ETC concert"

        AgedBrie _ ->
            "Aged Brie"

        Sulfuras ->
            "Sulfuras, Hand of Ragnaros"


qualityOf : Item -> Quality
qualityOf (Item { quality }) =
    quality


createItem : GR.Item -> Item
createItem (GR.Item name quality sellIn) =
    case name of
        "Sulfuras, Hand of Ragnaros" ->
            Item
                { rule = Sulfuras
                , quality = quality
                }
        "Aged Brie" ->
            Item
                { rule = AgedBrie sellIn
                , quality = quality
                }
        "Backstage passes to a TAFKAL80ETC concert" ->
            Item
                { rule = BackstagePass sellIn
                , quality = quality
                }
        _ ->
            Item
                { rule = Normal name sellIn
                , quality = quality
                }
