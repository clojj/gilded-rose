module RegressionTests exposing (suite)

import Expect
import GildedRose exposing (Item(..))
import Helpers exposing (updateOne)
import Test exposing (Test, describe, test)


suite : Test
suite =
    describe "Special Items"
        [ test "updateQuality for 'Sulfuras' never decreases in quality and doesn't change sellin" <|
            \_ ->
                let
                    item =
                        Item "Sulfuras, Hand of Ragnaros" 1 42

                    item_ =
                        updateOne item
                in
                Expect.equal (Item "Sulfuras, Hand of Ragnaros" 1 42)
                    item_
        , test
            "updateQuality for 'Aged Brie' increases in quality"
          <|
            \_ ->
                let
                    item =
                        Item "Aged Brie" 1 42

                    item_ =
                        updateOne item
                in
                Expect.equal (Item "Aged Brie" 0 43) item_
        ]



-- TODO many more tests
