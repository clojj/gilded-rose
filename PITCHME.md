#### The Gilded Rose in Elm

Link [Github](https://github.com/emilybache/GildedRose-Refactoring-Kata) ...in vielen Sprachen

### Public API

```elm
module GildedRose exposing (GildedRose, Item(..))

type Item
    = Item String Int Int

updateQuality : GildedRose -> GildedRose
-- etc.    
```
@[1](public API)
@[3-4](Item with exposed constructor)
@[6-](update method)
