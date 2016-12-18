module Location exposing ( SixSlotComponent
                         , TwelveSlotComponent
                         , arm
                         , centerTorso
                         , head
                         , leg
                         , sideTorso
                         )

import Component exposing (..)
import Maybe exposing (Maybe)


type Location
    = SixSlot SixSlotComponent
    | TwelveSlot TwelveSlotComponent

type alias SixSlotComponent =
    { first : Maybe Component
    , second : Maybe Component
    , third : Maybe Component
    , fourth : Maybe Component
    , fifth : Maybe Component
    , sixth : Maybe Component
    }

type alias TwelveSlotComponent =
    { top : SixSlotComponent
    , bottom : SixSlotComponent
    }

{- Factory function returning a default arm
-}
arm : TwelveSlotComponent
arm =
    TwelveSlotComponent
        (SixSlotComponent
            (Just <| Component.factory "Shoulder")
            (Just <| Component.factory "Upper Arm Actuator")
            (Just <| Component.factory "Lower Arm Actuator")
            (Just <| Component.factory "Hand Actuator")
            Nothing
            Nothing)
        empty

{- Factory function returning a default center torso
-}
centerTorso : TwelveSlotComponent
centerTorso =
    TwelveSlotComponent
        (SixSlotComponent
            (Just <| Component.factory "Engine")
            (Just <| Component.factory "Engine")
            (Just <| Component.factory "Engine")
            (Just <| Component.factory "Gyro")
            (Just <| Component.factory "Gyro")
            (Just <| Component.factory "Gyro"))
        (SixSlotComponent
            (Just <| Component.factory "Gyro")
            (Just <| Component.factory "Engine")
            (Just <| Component.factory "Engine")
            (Just <| Component.factory "Engine")
            Nothing
            Nothing)

{-| Factory function returning a default head
-}
head : SixSlotComponent
head =
    SixSlotComponent
        (Just <| Component.factory "Life Support")
        (Just <| Component.factory "Sensors")
        (Just <| Component.factory "Cockpit")
        Nothing
        (Just <| Component.factory "Sensors")
        (Just <| Component.factory "Life Support")

{- Factory function returning a default leg
-}
leg : SixSlotComponent
leg =
    SixSlotComponent
        (Just <| Component.factory "Hip")
        (Just <| Component.factory "UpperLegActuator")
        (Just <| Component.factory "LowerLegActuator")
        (Just <| Component.factory "FootActuator")
        Nothing
        Nothing

{- Factory function returning a default side torso
-}
sideTorso : TwelveSlotComponent
sideTorso =
    TwelveSlotComponent
        empty
        empty

toList : Location -> List (Maybe Component)
toList location =
    case location of
        SixSlot component ->
            sixToList component
        TwelveSlot component ->
            sixToList component.top ++ sixToList component.bottom

sixToList : SixSlotComponent -> List (Maybe Component)
sixToList c =
    [c.first] ++ [c.second] ++ [c.third] ++ [c.fourth] ++ [c.fifth] ++ [c.sixth]

-- UNEXPOSED --
{-| Factory function returning an empty SixSlot
-}
empty : SixSlotComponent
empty =
    SixSlotComponent
        Nothing
        Nothing
        Nothing
        Nothing
        Nothing
        Nothing
