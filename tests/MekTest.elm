module MekTest exposing (all)

import Tuple

import Test exposing (describe, test, Test)
import Expect

import Mek exposing (Mek, factory, weightClass, validWeight)
import TechBase exposing (..)

all : Test
all =
    Test.concat
        [ basics, validation ]

basics : Test
basics =
    let
        mek = Mek InnerSphere False 50
    in
      describe "Sanity check tests"
          [ test "A mek should have a technology base" <| \_ ->
              mek.techBase |> Expect.equal InnerSphere
          , test "A mek should be able to be an omniMech" <| \_ ->
              { mek | omniMech = True }
                |> .omniMech
                |> Expect.equal True
          , test "A mek should have a weight" <| \_ ->
              mek.weight
                |> Expect.equal 50
          , test "Weight should have a string representation" <| \_ ->
              weightClass mek
                |> Expect.equal "Medium"
          , test "A 35 ton mek should be a light mek" <| \_ ->
              { mek | weight = 35 }
                |> weightClass
                |> Expect.equal "Light"
          , test "A 50 ton mek should be a medium mek" <| \_ ->
              weightClass mek |> Expect.equal "Medium"
          , test "A 65 ton mek should be a heavy mek" <| \_ ->
              { mek | weight = 65 }
                |> weightClass
                |> Expect.equal "Heavy"
          , test "A 90 ton mek should be an assualt mek" <| \_ ->
              { mek | weight = 90 }
                |> weightClass
                |> Expect.equal "Assault"
          , test "A 10 ton mek should be invalid" <| \_ ->
              { mek | weight = 10 }
                |> weightClass
                |> Expect.equal "Invalid"
          , test "A 200 ton mek should be invalid" <| \_ ->
              { mek | weight = 200 }
                |> weightClass
                |> Expect.equal "Invalid"
          ]

validation : Test
validation =
    let
        mek = Mek InnerSphere False 50
    in
      describe "Validation tests"
          [ test "A mek that weights 50 tons should be valid" <| \_ ->
                Expect.equal (Tuple.first (validWeight mek)) True
          , test "A mek with a weight of 110 tons is out of the valid range" <|
              \_ ->
                  validWeight { mek | weight = 110 }
                    |> Tuple.first
                    |> Expect.equal False
          , test "A mek with a weight of 51 should be an invalid weight factor" <|
              \_ ->
                  validWeight { mek | weight = 51 }
                    |> Tuple.first
                    |> Expect.equal False
          , test "A mek with a weight of 112 should be in an invalid range, and factor" <|
              \_ ->
                  validWeight { mek | weight = 112 }
                    |> Tuple.first
                    |> Expect.equal False
          , test "The factory should produce a valid mek" <| \_ ->
              validWeight factory
                |> Tuple.first
                |> Expect.equal True
          ]
