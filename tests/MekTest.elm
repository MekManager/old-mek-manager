module MekTest exposing (all)


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
              mek.techBase `equal` InnerSphere

          , test "A mek should be able to be an omniMech" <| \_ ->
              let
                  m = { mek | omniMech = True }
              in
                  m.omniMech `equal` True
          , test "A mek should have a weight" <| \_ ->
              mek.weight `equal` 50
          , test "Weight should have a string representation" <| \_ ->
              weightClass mek `equal` "Medium"
          , test "A 35 ton mek should be a light mek" <| \_ ->
              let
                  m = { mek | weight = 35 }
              in
                  weightClass m `equal` "Light"
          , test "A 50 ton mek should be a medium mek" <| \_ ->
              weightClass mek `equal` "Medium"
          , test "A 65 ton mek should be a heavy mek" <| \_ ->
              let
                  m = { mek | weight = 65 }
              in
                  weightClass m `equal` "Heavy"
          , test "A 90 ton mek should be an assualt mek" <| \_ ->
              let
                  m = { mek | weight = 90 }
              in
                  weightClass m `equal` "Assault"
          , test "A 10 ton mek should be invalid" <| \_ ->
              let
                  m = { mek | weight = 10 }
              in
                  weightClass m `equal` "Invalid"
          , test "A 200 ton mek should be invalid" <| \_ ->
              let
                  m = { mek | weight = 200 }
              in
                  weightClass m `equal` "Invalid"
          ]

validation : Test
validation =
    let
        mek = Mek InnerSphere False 50
    in
      describe "Validation tests"
          [ test "A mek that weights 50 tons should be valid" <| \_ ->
                fst (validWeight mek) `equal` True
          , test "A mek with a weight of 110 tons is out of the valid range" <|
              \_ ->
                  let
                      validation = validWeight { mek | weight = 110 }
                  in
                      fst validation `equal` False
          , test "A mek with a weight of 51 should be an invalid weight factor" <|
              \_ ->
                  let
                      validation = validWeight { mek | weight = 51 }
                  in
                      fst validation `equal` False
          , test "A mek with a weight of 112 should be in an invalid range, and factor" <|
              \_ ->
                  let
                      validation = validWeight { mek | weight = 112 }
                  in
                      fst validation `equal` False
          ]
