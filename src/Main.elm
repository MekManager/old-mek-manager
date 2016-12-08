import Html exposing ( Html
                     , b
                     , div
                     , fieldset
                     , h1
                     , h3
                     , option
                     , p
                     , select
                     , button
                     , label
                     , br
                     , text
                     , input
                     )
import Mek exposing (Mek)
import TechBase exposing (TechBase)
import Html.Attributes exposing (style, type_, name, checked)
import Html.Events exposing (onClick, onInput)

main : Program Never Mek Msg
main =
    Html.beginnerProgram { model = Mek.factory
                         , view = view
                         , update = update
                         }

view : Mek -> Html Msg
view model =
    div []
        [ h1 [] [ text "Mek Designer" ]
        , h3 [ style [ ("margin", "0") ] ] [ text "Debug info:" ]
        , debugInfo "Techbase: " (TechBase.toString model.techBase)
        , debugInfo "Omnimech: " (toString model.omniMech)
        , debugInfo "Weight: " (toString model.weight)
        , br [] []
        , b [] [ text "Select Tech Base: " ]
        , select [ onInput ChangeTechBase ]
                 [ option [] [ text "Inner Sphere" ]
                 , option [] [ text "Clan" ]
                 ]
        , br [] []
        , b [] [ text "Change Omni Status: " ]
        , fieldset []
                   [ label []
                           [ input [ type_ "radio", name "omni", checked False, onClick (ChangeOmni True) ] []
                           , text "True"
                           ]
                   , label []
                           [ input [ type_ "radio", name "omni", checked True, onClick (ChangeOmni False) ] []
                           , text "False"
                           ]
                   ]
        , br [] []
        , b [] [ text "Change Weight: "]
        , button [ onClick IncreaseWeight ] [ text "Increase" ]
        , button [ onClick DecreaseWeight ] [ text "Decrease" ]
        ]

debugInfo : String -> String -> Html Msg
debugInfo description value =
    div []
        [ b [] [ text description ]
        , p [ style [ ("display", "inline-block")
                    , ("margin", "0")
                    ]
            ]
            [ text value ]
        ]

type Msg = ChangeTechBase String
         | ChangeOmni Bool
         | IncreaseWeight
         | DecreaseWeight

update : Msg -> Mek -> Mek
update msg model =
    case msg of
        ChangeTechBase base ->
            case base of
                "Clan" ->
                    { model | techBase = TechBase.Clan }
                _ ->
                    { model | techBase = TechBase.InnerSphere }
        DecreaseWeight ->
            if model.weight == 20 then
                model
            else
                { model | weight = model.weight - 5 }
        IncreaseWeight ->
            if model.weight == 100 then
                model
            else
                { model | weight = model.weight + 5 }
        ChangeOmni value ->
            { model | omniMech = value }
