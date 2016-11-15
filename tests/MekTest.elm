module MekTest exposing (all)

import Tuple

import Test exposing (concat, describe, test, Test)
import Expect exposing (equal)

import Mek exposing (Mek, weightClass, validWeight)
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
              equal mek.techBase  InnerSphere

          , test "A mek should be able to be an omniMech" <| \_ ->
              let
                  m = { mek | omniMech = True }
              in
                  equal m.omniMech  True
          , test "A mek should have a weight" <| \_ ->
              equal mek.weight 50
          , test "Weight should have a string representation" <| \_ ->
              equal (weightClass mek) "Medium"
          , test "A 35 ton mek should be a light mek" <| \_ ->
              let
                  m = { mek | weight = 35 }
              in
                  equal (weightClass m) "Light"
          , test "A 50 ton mek should be a medium mek" <| \_ ->
              equal (weightClass mek) "Medium"
          , test "A 65 ton mek should be a heavy mek" <| \_ ->
              let
                  m = { mek | weight = 65 }
              in
                  equal (weightClass m) "Heavy"
          , test "A 90 ton mek should be an assualt mek" <| \_ ->
              let
                  m = { mek | weight = 90 }
              in
                  equal (weightClass m) "Assault"
          , test "A 10 ton mek should be invalid" <| \_ ->
              let
                  m = { mek | weight = 10 }
              in
                  equal (weightClass m) "Invalid"
          , test "A 200 ton mek should be invalid" <| \_ ->
              let
                  m = { mek | weight = 200 }
              in
                  equal (weightClass m) "Invalid"
          ]

validation : Test
validation =
    let
        mek = Mek InnerSphere False 50
    in
      describe "Validation tests"
          [ test "A mek that weights 50 tons should be valid" <| \_ ->
                equal (Tuple.first (validWeight mek)) True
          , test "A mek with a weight of 110 tons is out of the valid range" <|
              \_ ->
                  let
                      validation = validWeight { mek | weight = 110 }
                  in
                      equal (Tuple.first validation) False
          , test "A mek with a weight of 51 should be an invalid weight factor" <|
              \_ ->
                  let
                      validation = validWeight { mek | weight = 51 }
                  in
                      equal (Tuple.first validation) False
          , test "A mek with a weight of 112 should be in an invalid range, and factor" <|
              \_ ->
                  let
                      validation = validWeight { mek | weight = 112 }
                  in
                      equal (Tuple.first validation) False
          ]
