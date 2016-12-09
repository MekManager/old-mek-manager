module Engine exposing (Engine, factory, rating, weight, valid)

import EngineTonnage
import EngineType exposing (EngineType)
import TechBase exposing (TechBase)

-- TODO: There are probably going to be some other state related things that
-- this needs, like hits taken or something? Just not sure what that looks
-- like yet.
type alias Engine =
    { techBase: TechBase
    , type_ : EngineType
    , walkingSpeed : Int
    , unitWeight : Int
    }

factory : Engine
factory =
    Engine TechBase.InnerSphere EngineType.Standard 5 50

rating : Engine -> Int
rating e =
    e.unitWeight * e.walkingSpeed

valid : Engine -> Bool
valid e =
    weight e /= 0.0

weight : Engine -> Float
weight e =
    EngineTonnage.for (rating e) (.type_ e)
