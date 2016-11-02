module Mek exposing (Mek, weightClass)


import TechBase exposing (TechBase)


type alias Mek =
    { techBase : TechBase
    , omniMech : Bool
    , weight : Int
    }


{-| Gets the name of the weight class for a given mek
  TODO: I want to make it so that particular weights are not valid; and to
        reduce the amount of guard code that's going on here.
-}
weightClass : Mek -> String
weightClass mek =
    if mek.weight >= 20 && mek.weight <= 35 then
        "Light"
    else if mek.weight >= 40 && mek.weight <= 55 then
        "Medium"
    else if mek.weight >= 60 && mek.weight <= 75 then
        "Heavy"
    else
        "Assault"
