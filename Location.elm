module Location exposing (..)

-- TODO: Write the Component module
-- import Component exposing (Component)


-- TODO: These probably need to be Maybe'd
type alias SixSlot =
    { first : Maybe Component
    , second : Maybe Component
    , third : Maybe Component
    , fourth : Maybe Component
    , fifth : Maybe Component
    , sixth : Maybe Component
    }

-- NOTE: What if a TwelveSlot was just two SixSlots...
type alias TwelveSlot =
    { top : SixSlot
    , bottom : SixSlot
    }

{-| Factory function returning a default head
    NOTE: **VERY** Pseudo-code-y right now
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
