module Main exposing (main)

-- IMPORTS

import Html exposing (..)
import Html.Attributes



-- MAIN


main : Html a
main =
    div []
        [ header ]


header : Html a
header =
    h1 []
        [ text "Home" ]
