module Location exposing ( Location
                         , SixSlot
                         , TwelveSlot
                         , arm
                         , centerTorso
                         , head
                         , leg
                         , sideTorso
                         )

import Component exposing (..)


type Location = SixSlot | TwelveSlot

type alias SixSlot =
    { first : Maybe Component
    , second : Maybe Component
    , third : Maybe Component
    , fourth : Maybe Component
    , fifth : Maybe Component
    , sixth : Maybe Component
    }

type alias TwelveSlot =
    { top : SixSlot
    , bottom : SixSlot
    }

{-| Factory function returning a default arm
-}
arm : TwelveSlot
arm =
    TwelveSlot
        SixSlot
            Just Shoulder
            Just UpperArmActuator
            Just LowerArmActuator
            Just HandActuator
            Nothing
            Nothing
        empty

{-| Factory function returning a default center torso
-}
centerTorso : TwelveSlot
centerTorso =
    TwelveSlot
        SixSlot
            Just Engine
            Just Engine
            Just Engine
            Just Gyro
            Just Gyro
            Just Gyro
        SixSlot
            Just Gyro
            Just Engine
            Just Engine
            Just Engine
            Nothing
            Nothing

{-| Factory function returning a default head
-}
head : SixSlot
head =
    SixSlot
        Just LifeSupport
        Just Sensors
        Just Cockpit
        Nothing
        Just Sensors
        Just LifeSupport

{-| Factory function returning a default leg
-}
leg : SixSlot
leg =
    SixSlot
        Just Hip
        Just UpperLegActuator
        Just LowerLegActuator
        Just FootActuator
        Nothing
        Nothing

{-| Factory function returning a default side torso
-}
sideTorso : TwelveSlot
sideTorso =
    TwelveSlot
        empty
        empty

-- UNEXPOSED --
{-| Factory function returning an empty SixSlot
-}
empty : SixSlot
empty =
    SixSlot
        Nothing
        Nothing
        Nothing
        Nothing
        Nothing
        Nothing
