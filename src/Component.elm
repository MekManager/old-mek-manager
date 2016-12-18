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
