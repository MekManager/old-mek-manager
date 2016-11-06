-- NOTE: This file is not subject to an 80 character line maximum.
module Translator exposing (..)

import Translateable exposing (..)


{-| English language translator.
-}
english : Translateable -> String
english trans =
    case trans of
        Blank ->
            ""
        InvalidWeightFactor ->
            "This mek's weight is not a factor of 5!"
        InvalidWeightRange ->
            "This mek's weight is outside of the valid range!"
        InvalidWeightFactorAndRange ->
            "This mek's weight is not a factor of 5, and outside of valid ranges!"

{-| Spanish language translator.
  NOTE: I don't speak Spanish, these seem right (ish). They're really just
        placeholders to prove that the translation is working.
-}
spanish : Translateable -> String
spanish trans =
    case trans of
        Blank ->
            ""
        InvalidWeightFactor ->
            "¡El peso de este mek no es un factor de 5!"
        InvalidWeightRange ->
            "¡El peso de este mek está fuera del rango válido!"
        InvalidWeightFactorAndRange ->
            "¡El peso de este mek no es un factor de 5, y fuera de rangos válidos!"
