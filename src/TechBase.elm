module TechBase exposing (..)


type TechBase
    = InnerSphere
    | Clan

toString : TechBase -> String
toString t =
    case t of
        InnerSphere -> "Inner Sphere"
        Clan        -> "Clan"
