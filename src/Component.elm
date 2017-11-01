module Component exposing (..)


type alias Component =
    { name : String
    , damaged : Bool
    }

{-| A factory function to create a new, undamaged component
-}
factory : String -> Component
factory name =
    Component name False

{-| Convenience wrapper over `factory`
The cause for this is that components almost exclusively work with Maybes. And
doing all of it inline is overly verbose.
-}
maybeFactory : String -> Maybe Component
maybeFactory name =
    Just (factory name)
