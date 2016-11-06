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
            (Just Component.Shoulder)
            (Just Component.UpperArmActuator)
            (Just Component.LowerArmActuator)
            (Just Component.HandActuator)
            Nothing
            Nothing)
        empty

{- Factory function returning a default center torso
-}
centerTorso : TwelveSlotComponent
centerTorso =
    TwelveSlotComponent
        (SixSlotComponent
            (Just Component.Engine)
            (Just Component.Engine)
            (Just Component.Engine)
            (Just Component.Gyro)
            (Just Component.Gyro)
            (Just Component.Gyro))
        (SixSlotComponent
            (Just Component.Gyro)
            (Just Component.Engine)
            (Just Component.Engine)
            (Just Component.Engine)
            Nothing
            Nothing)

{-| Factory function returning a default head
-}
head : SixSlotComponent
head =
    SixSlotComponent
        (Just Component.LifeSupport)
        (Just Component.Sensors)
        (Just Component.Cockpit)
        Nothing
        (Just Component.Sensors)
        (Just Component.LifeSupport)

{- Factory function returning a default leg
-}
leg : SixSlotComponent
leg =
    SixSlotComponent
        (Just Component.Hip)
        (Just Component.UpperLegActuator)
        (Just Component.LowerLegActuator)
        (Just Component.FootActuator)
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
