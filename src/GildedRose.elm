module GildedRose exposing (Item(..), updateQuality)

-- exposing list = Public API !


type Item
    = Item String Int Int


updateQuality : List Item -> List Item
updateQuality =
    List.map updateQualityItem


updateQualityItem (Item name quality sellIn) =
    let
        quality_ =
            if name /= "Aged Brie" && name /= "Backstage passes to a TAFKAL80ETC concert" then
                if quality > 0 then
                    if name /= "Sulfuras, Hand of Ragnaros" then
                        quality - 1

                    else
                        quality

                else
                    quality

            else if quality < 50 then
                quality
                    + 1
                    + (if name == "Backstage passes to a TAFKAL80ETC concert" then
                        if sellIn < 11 then
                            if quality < 49 then
                                1
                                    + (if sellIn < 6 then
                                        if quality < 48 then
                                            1

                                        else
                                            0

                                       else
                                        0
                                      )

                            else
                                0

                        else
                            0

                       else
                        0
                      )

            else
                quality

        sellIn_ =
            if name /= "Sulfuras, Hand of Ragnaros" then
                sellIn - 1

            else
                sellIn
    in
    if sellIn_ < 0 then
        if name /= "Aged Brie" then
            if name /= "Backstage passes to a TAFKAL80ETC concert" then
                if quality_ > 0 then
                    if name /= "Sulfuras, Hand of Ragnaros" then
                        Item name (quality_ - 1) sellIn_

                    else
                        Item name quality_ sellIn_

                else
                    Item name quality_ sellIn_

            else
                Item name (quality_ - quality_) sellIn_

        else if quality_ < 50 then
            Item name (quality_ + 1) sellIn_

        else
            Item name quality_ sellIn_

    else
        Item name quality_ sellIn_
