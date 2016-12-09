module EngineTonnageTest exposing (all)

import Test exposing (concat, describe, test, Test)
import Expect exposing (equal)

import EngineTonnage
import EngineType

all : Test
all = Test.concat [ basics ]

basics : Test
basics =
    describe "Sanity check tests"
        [ test "A 100 rated standard engine weights 3 tons" <| \_ ->
            EngineTonnage.for 100 EngineType.Standard
              |> Expect.equal 3.0
        , test "A 360 rated XL engine weights 16.5 tons" <| \_ ->
            EngineTonnage.for 360 EngineType.XL
              |> Expect.equal 16.5
        , test "A 25 rated Light engine weights 0.5 tons" <| \_ ->
            EngineTonnage.for 25 EngineType.Light
              |> Expect.equal 0.5
        , test "A 200 rated ICE engine weights 17 tons" <| \_ ->
            EngineTonnage.for 200 EngineType.ICE
              |> Expect.equal 17.0
        , test "A 500 rated Standard engine should return 0.0" <| \_ ->
            EngineTonnage.for 500 EngineType.Standard
              |> Expect.equal 0.0
        ]
