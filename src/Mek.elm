module Mek exposing (Mek
                    , factory
                    , weightClass
                    , validWeight
                    , weightRange
                    , light
                    )

import TechBase exposing (TechBase)
import Translateable exposing (..)

import Engine exposing (Engine)
import EngineType

type alias Mek =
    { techBase : TechBase
    , omniMech : Bool
    , weight : Int
    , engine : Engine
    }

factory : Mek
factory =
    let
      techBase = TechBase.InnerSphere
      weight   = 20
      engine   = Engine techBase EngineType.Standard 1 weight
    in
      Mek techBase False weight engine

installEngine : Mek -> Engine -> Mek
installEngine mek engine =
    { mek | engine = engine }

weightClass : Mek -> String
weightClass mek =
    if mek.weight >= 20 && mek.weight <= 35 then
        "Light"
    else if mek.weight >= 40 && mek.weight <= 55 then
        "Medium"
    else if mek.weight >= 60 && mek.weight <= 75 then
        "Heavy"
    else if mek.weight >= 80 && mek.weight <= 100 then
        "Assault"
    else
        "Invalid"

betterWeightClass : Mek -> String
betterWeightClass mek =
    if light mek.weight then
      "Light"
    else if medium mek.weight then
      "Medium"
    else if heavy mek.weight then
      "Heavy"
    else if assault mek.weight then
      "Assault"
    else
      "Invalid"

weightRange : Int -> Int -> Int -> Bool
weightRange from to val =
  val >= from && val <= to

light : Int -> Bool
light =
  weightRange 20 35

medium : Int -> Bool
medium =
  weightRange 40 55

heavy : Int -> Bool
heavy =
  weightRange 60 75

assault : Int -> Bool
assault =
  weightRange 80 100


validWeight : Mek -> (Bool, Translateable)
validWeight mek =
    let
        validations = (validWeightRange mek, validWeightFactor mek)
    in
        case validations of
            (False, False) -> (False, InvalidWeightFactorAndRange)
            (False, _)     -> (False, InvalidWeightRange)
            (_, False)     -> (False, InvalidWeightFactor)
            _              -> (True, Blank)

-- UNEXPOSED --
{-| Validates that a Mek's weight is a factor of 5
 -}
validWeightFactor : Mek -> Bool
validWeightFactor mek =
    mek.weight % 5 == 0

{-| Validates that a Mek is within the correct weight range.
-}
validWeightRange : Mek -> Bool
validWeightRange mek =
    mek.weight >= 20 && mek.weight <= 100
