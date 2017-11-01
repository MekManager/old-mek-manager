module Location exposing ( SixSlotComponent
                         , TwelveSlotComponent
                         , arm
                         , centerTorso
                         , head
                         , leg
                         , sideTorso
                         )

import Component exposing (..)
import List.Extra exposing ((!!))
import Maybe exposing (Maybe, withDefault)


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

{-| Syntax sugar because withDefault is so verbose
-}
(~>) : a -> Maybe a -> a
(~>) = withDefault

{-| Monoid transformer for building Locations.
-}
(|->) : Location -> Maybe Component -> Location
(|->) location component =
  let
      locationList = toList location
  in
      case (List.length locationList) of
        6 ->
          location
        _ ->
          locationList ++ [component]
          |> fromList

{-| Factory function returning a default arm
-}
arm : TwelveSlotComponent
arm =
    TwelveSlotComponent
        (SixSlotComponent
            (Component.maybeFactory "Shoulder")
            (Component.maybeFactory "Upper Arm Actuator")
            (Component.maybeFactory "Lower Arm Actuator")
            (Component.maybeFactory "Hand Actuator")
            Nothing
            Nothing)
        empty

{-| Factory function returning a default center torso
-}
centerTorso : TwelveSlotComponent
centerTorso =
    TwelveSlotComponent
        (SixSlotComponent
            (Component.maybeFactory "Engine")
            (Component.maybeFactory "Engine")
            (Component.maybeFactory "Engine")
            (Component.maybeFactory "Gyro")
            (Component.maybeFactory "Gyro")
            (Component.maybeFactory "Gyro"))
        (SixSlotComponent
            (Component.maybeFactory "Gyro")
            (Component.maybeFactory "Engine")
            (Component.maybeFactory "Engine")
            (Component.maybeFactory "Engine")
            Nothing
            Nothing)

{-| Factory function returning a default head
-}
head : SixSlotComponent
head =
    SixSlotComponent
        (Component.maybeFactory "Life Support")
        (Component.maybeFactory "Sensors")
        (Component.maybeFactory "Cockpit")
        Nothing
        (Component.maybeFactory "Sensors")
        (Component.maybeFactory "Life Support")

{- Factory function returning a default leg
-}
leg : SixSlotComponent
leg =
    SixSlotComponent
        (Component.maybeFactory "Hip")
        (Component.maybeFactory "UpperLegActuator")
        (Component.maybeFactory "LowerLegActuator")
        (Component.maybeFactory "FootActuator")
        Nothing
        Nothing

{- Factory function returning a default side torso
-}
sideTorso : TwelveSlotComponent
sideTorso =
    TwelveSlotComponent
        empty
        empty

{-| Turns a location into a list of Maybe Components.
-}
toList : Location -> List (Maybe Component)
toList location =
    case location of
        SixSlot component ->
            sixToList component
        TwelveSlot component ->
            sixToList component.top ++ sixToList component.bottom

{-| Takes a list of Maybe Components and turns them into a SixSlot location.
-}
fromList : List (Maybe Component) -> Location
fromList list =
  SixSlotComponent
    (Nothing ~> (list !! 0))
    (Nothing ~> (list !! 1))
    (Nothing ~> (list !! 2))
    (Nothing ~> (list !! 3))
    (Nothing ~> (list !! 4))
    (Nothing ~> (list !! 5))
    |> SixSlot

sixToList : SixSlotComponent -> List (Maybe Component)
sixToList c =
    [c.first] ++ [c.second] ++ [c.third] ++ [c.fourth] ++ [c.fifth] ++ [c.sixth]

-- UNEXPOSED --
{-| Factory function returning an empty SixSlot
-}
keys: List (
  { b
  | first : a
  , second : a
  , third : a
  , fourth : a
  , fifth : a
  , sixth : a
  } -> a)
keys =
  [.first, .second, .third, .fourth, .fifth, .sixth]

empty : SixSlotComponent
empty =
    SixSlotComponent
        Nothing
        Nothing
        Nothing
        Nothing
        Nothing
        Nothing
