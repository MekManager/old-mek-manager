module EngineType exposing (..)

import TechBase exposing (TechBase)

type EngineType
     = ICE
     | Cell
     | Fission
     | Compact
     | Standard
     | Light
     | XL

{-| Returns the name of the given `EngineType` as a String
-}
toString : EngineType -> String
toString e =
  case e of
    ICE      -> "ICE"
    Cell     -> "Cell"
    Fission  -> "Fission"
    Compact  -> "Compact"
    Standard -> "Standard"
    Light    -> "Light"
    XL       -> "XL"

{-| Returns a list of `EngineType`s that are available to a tech base
-}
availableFor : TechBase -> List EngineType
availableFor base =
  case base of
    TechBase.Clan ->
      [ Standard, XL ]
    TechBase.InnerSphere ->
      [ Standard, XL, Light, Compact ]

{-| Deterines if the given `EngineType` is a style of fusion engine
-}
isFusion : EngineType -> Bool
isFusion e =
  case e of
    Compact  -> True
    Standard -> True
    Light    -> True
    XL       -> True
    _        -> False
