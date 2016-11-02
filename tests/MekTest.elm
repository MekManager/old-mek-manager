module MekTest exposing (all)


import Test exposing (concat, describe, test, Test)
import Expect exposing (equal)

import Mek exposing (Mek, weightClass)
import TechBase exposing (..)

all : Test
all =
    Test.concat
        [ basics ]

basics : Test
basics =
    describe "Sanity check tests"
        [ test "A mek should have a technology base" <| \_ ->
              let
                  m = Mek InnerSphere False 50
              in
                  m.techBase `equal` InnerSphere

        , test "A mek should be able to be an omniMech" <| \_ ->
            let
                m = Mek Clan True 50
            in
                m.omniMech `equal` True
        , test "A mek should have a weight" <| \_ ->
            let
                m = Mek InnerSphere False 20
            in
                m.weight `equal` 20
        , test "Weight should have a string representation" <| \_ ->
            let
                m = Mek InnerSphere False 20
            in
                weightClass m `equal` "Light"
        ]
