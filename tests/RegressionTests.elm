module RegressionTests exposing (suite)

import Expect
import GildedRose exposing (Item(..))
import Helpers exposing (updateOne)
import Test exposing (Test, test)


suite : Test
suite =
    test "updateQuality for Sulfuras never decreases quality or sell-in" <|
        \_ ->
            let
                item =
                    Item "Sulfuras, Hand of Ragnaros" 1 42

                item_ =
                    updateOne item
            in
            Expect.equal (Item "Sulfuras, Hand of Ragnaros" 1 42) item_



-- TODO many more tests
