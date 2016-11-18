import Html exposing (div, button, br, text)
import Html.Events exposing (onClick)

{-| This is just a basic application to that Webpack is setup correctly.
  It's just the HTML button page from the Elm examples.
-}
main : Program Never Int Msg
main =
    Html.beginnerProgram { model = 0, view = view, update = update }


view : Int -> Html.Html Msg
view model =
    div []
        [ button [ onClick Reset ] [ text "Reset" ]
        , br [] []
        , button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (toString model) ]
        , button [ onClick Increment ] [ text "+" ]
        , br [] []
        , button [ onClick Reset ] [ text "Reset" ]
        ]

type Msg = Increment | Decrement | Reset

update : Msg -> Int -> Int
update msg model =
    case msg of
        Increment ->
            model + 1
        Decrement ->
            model - 1
        Reset ->
            0
