module I18n exposing (translate)

import Language exposing (Language)
import Translateable exposing (Translateable)
import Translator


translate : Language -> Translateable -> String
translate lang trans =
    case lang of
        Language.Spanish ->
            Translator.spanish trans
        _ ->
            Translator.english trans
