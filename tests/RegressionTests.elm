module RegressionTests exposing (suite)

import Expect
import GildedRose exposing (Item(..))
import Helpers exposing (updateOne)
import Test exposing (Test, describe, test)


suite : Test
suite =
    describe "The Gilded Rose"
        [ describe "update special items"
            [ test "'Sulfuras' never decreases in quality (and sellin is ignored)" <|
                \_ ->
                    let
                        item =
                            Item "Sulfuras, Hand of Ragnaros" 80 0

                        item_ =
                            updateOne (updateOne item)
                    in
                    Expect.equal (Item "Sulfuras, Hand of Ragnaros" 80 0)
                        item_
            , test "'Aged Brie' increases in quality by 1 if sellin > 10" <|
                \_ ->
                    let
                        item =
                            Item "Aged Brie" 42 12

                        item_ =
                            updateOne (updateOne item)
                    in
                    Expect.equal (Item "Aged Brie" 44 10) item_
            , test "'Backstage passes to a TAFKAL80ETC concert' increases in quality by 1 if sellin > 10" <|
                \_ ->
                    let
                        item =
                            Item "Backstage passes to a TAFKAL80ETC concert" 20 12

                        item_ =
                            updateOne (updateOne item)
                    in
                    Expect.equal (Item "Backstage passes to a TAFKAL80ETC concert" 22 10) item_
            , test "'Backstage passes to a TAFKAL80ETC concert' increases in quality by 2 if sellin > 5 and <= 10" <|
                \_ ->
                    let
                        item =
                            Item "Backstage passes to a TAFKAL80ETC concert" 20 10

                        item_ =
                            updateOne (updateOne item)
                    in
                    Expect.equal (Item "Backstage passes to a TAFKAL80ETC concert" 24 8) item_
            , test "'Backstage passes to a TAFKAL80ETC concert' increases in quality by 3 if sellin <= 5 and > 0" <|
                \_ ->
                    let
                        item =
                            Item "Backstage passes to a TAFKAL80ETC concert" 20 5

                        item_ =
                            updateOne (updateOne item)
                    in
                    Expect.equal (Item "Backstage passes to a TAFKAL80ETC concert" 26 3) item_
            , test "'Backstage passes to a TAFKAL80ETC concert' drops to quality 0 if after sellin" <|
                \_ ->
                    let
                        item =
                            Item "Backstage passes to a TAFKAL80ETC concert" 20 0

                        item_ =
                            updateOne (updateOne item)
                    in
                    Expect.equal (Item "Backstage passes to a TAFKAL80ETC concert" 0 -2) item_
            , describe "update normal items"
                (let
                    name =
                        "Normal Item"
                 in
                 [ test (name ++ " degrade in quality by 1 before sellin") <|
                    \_ ->
                        let
                            item =
                                Item name 20 42

                            item_ =
                                updateOne (updateOne item)
                        in
                        Expect.equal (Item name 18 40) item_
                 , test (name ++ " degrade in quality by 2 after sellin") <|
                    \_ ->
                        let
                            item =
                                Item name 20 0

                            item_ =
                                updateOne (updateOne item)
                        in
                        Expect.equal (Item name 16 -2) item_
                 ]
                )
            ]
        ]



-- TODO many more tests
