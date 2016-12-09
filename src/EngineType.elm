module EngineType exposing (..)


type EngineType
     = ICE
     | Cell
     | Fission
     | Compact
     | Standard
     | Light
     | XL

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

isFusion : EngineType -> Bool
isFusion e =
  case e of
    Compact  -> True
    Standard -> True
    Light    -> True
    XL       -> True
    _        -> False
