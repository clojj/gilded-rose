Fuzz Testing

```
module FuzzTests exposing (suite)

import Expect
import Fuzz exposing (frequency, intRange)
import GildedRose exposing (Item, makeItem, updateQuality)
import GildedRoseRefactored exposing (updateQualityRefactored)
import Test exposing (Test, describe, fuzzWith)


suite : Test
suite =
    describe "GildedRose"
        [ describe "updateQuality"
            [ fuzzWith { runs = 100 }
                (frequency
                    [ ( 1, intRange -100 -1 )
                    , ( 1, intRange 0 9 )
                    , ( 5, intRange 10 11 )
                    , ( 1, intRange 12 47 )
                    , ( 5, intRange 48 49 )
                    , ( 1, intRange 50 100 )
                    ]
                )
                "updateQuality equals updateQualityRefactored"
              <|
                \sellIn ->
                    let
                        gildedRose =
                            [ makeItem "Sulfuras, Hand of Ragnaros" (Debug.log "sellIn" sellIn) 80 ]
                    in
                    Expect.equal (updateQuality gildedRose) (updateQualityRefactored gildedRose)
            ]
        ]

```
