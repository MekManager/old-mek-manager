module LocationTest exposing (all)


import Test exposing (concat, describe, test, Test)
import Expect exposing (equal)
import Maybe

import Component
import Location exposing (..)

all : Test
all =
    Test.concat
        [ basics ]

basics : Test
basics =
    describe "Sanity Checks"
        [ test "A default head's first component should be life support" <| \_ ->
              let
                  comp = Maybe.withDefault (Component.factory "") head.first
              in
                  Expect.equal comp.name "Life Support"
        , test "A default head's last component should be life support" <| \_ ->
              let
                  comp = Maybe.withDefault (Component.factory "") head.sixth
              in
                  Expect.equal comp.name "Life Support"
        , test "A default head should have an empty slot" <| \_ ->
              let
                  comp = Maybe.withDefault (Component.factory "") head.fourth
              in
                  Expect.equal comp.name ""
        ]
