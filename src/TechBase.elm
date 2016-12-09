module TechBase exposing (..)

import List


type TechBase
    = InnerSphere
    | Clan

list : List TechBase
list =
  [ InnerSphere, Clan ]

toString : TechBase -> String
toString t =
    case t of
        InnerSphere -> "Inner Sphere"
        Clan        -> "Clan"
