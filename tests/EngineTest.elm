module EngineTest exposing (all)

import Expect
import Test exposing (describe, test, Test)

import Engine exposing (Engine)


all :  Test
all =
    Test.concat [ basics ]

basics : Test
basics =
    describe "Sanity check tests"
        [ test "The factory function produces a valid engine" <| \_ ->
            Engine.factory
              |> Engine.valid
              |> Expect.equal True
        , test "The default engine should have a rating of 250" <| \_ ->
            Engine.factory
              |> Engine.rating
              |> Expect.equal 250
        , test "The default engine should weight 12.5 tons" <| \_ ->
            Engine.factory
              |> Engine.weight
              |> Expect.equal 12.5
        ]
