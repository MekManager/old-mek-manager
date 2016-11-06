module LocationTest exposing (all)


import Test exposing (concat, describe, test, Test)
import Expect exposing (equal)

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
            head.first `equal` Just Component.LifeSupport
        , test "A default head's last component should be life support" <| \_ ->
            head.sixth `equal` Just Component.LifeSupport
        , test "A default head should have an empty slot" <| \_ ->
            head.fourth `equal` Nothing
        ]
