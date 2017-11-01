import Html as H exposing (Html, text)
import Html.Attributes as A
import Html.Events as E

import List

import Mek exposing (Mek)
import TechBase exposing (TechBase)

main : Program Never Mek Msg
main =
    H.beginnerProgram { model = Mek.factory
                      , view = view
                      , update = update
                      }

view : Mek -> Html Msg
view model =
    H.div []
        [ H.h1 [] [ text "Mek Designer" ]
        , H.h3 [ A.style [ ("margin", "0") ] ] [ text "Debug info:" ]
        , debugInfo "Techbase: " (TechBase.toString model.techBase)
        , debugInfo "Omnimech: " (toString model.omniMech)
        , debugInfo "Weight: " (toString model.weight)
        , H.br [] []
        , H.b [] [ text "Select Tech Base: " ]
        , H.select [ E.onInput ChangeTechBase ] <| techBaseSelect
        , H.br [] []
        , H.b [] [ text "Change Omni Status: " ]
        , H.fieldset []
                     [ H.label []
                               [ H.input
                                 [ A.type_ "radio"
                                 , A.name "omni"
                                 , A.checked False
                                 , E.onClick (ChangeOmni True)
                                 ]
                                 []
                               , text "True"
                               ]
                     , H.label []
                               [ H.input
                                 [ A.type_ "radio"
                                 , A.name "omni"
                                 , A.checked True
                                 , E.onClick (ChangeOmni False)
                                 ]
                                 []
                               , text "False"
                               ]
                     ]
        , H.br [] []
        , H.b [] [ text "Change Weight: " ]
        , H.button [ E.onClick IncreaseWeight ] [ text "Increase" ]
        , H.button [ E.onClick DecreaseWeight ] [ text "Decrease" ]
        ]

techBaseSelect : List (Html Msg)
techBaseSelect =
  List.map (\t -> H.option [] [ text <| TechBase.toString t ]) TechBase.list

debugInfo : String -> String -> Html Msg
debugInfo description value =
    H.div []
        [ H.b [] [ text description ]
        , H.p [ A.style [ ("display", "inline-block")
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
