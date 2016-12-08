module Mek exposing (Mek
                    , factory
                    , weightClass
                    , validWeight
                    )

import TechBase exposing (TechBase)
import Translateable exposing (..)


type alias Mek =
    { techBase : TechBase
    , omniMech : Bool
    , weight : Int
    }

factory : Mek
factory =
    Mek TechBase.InnerSphere False 20

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
