module Main exposing (main)

-- IMPORTS

import Html exposing (..)
import Html.Attributes



-- MAIN


main : Html a
main =
    div [ Html.Attributes.class "flex" ]
        [ content
        , sidebar
        ]



-- CONTENT


content : Html a
content =
    div [ Html.Attributes.class "bg-white h-screen w-1/2" ]
        [ div [ Html.Attributes.class "px-16 pt-16" ]
            [ header
            , subheader
            , emoji
            ]
        ]


header : Html a
header =
    h1 [ Html.Attributes.class "font-black leading-none text-6xl" ]
        [ text "Orlando Indie Hackers" ]


subheader : Html a
subheader =
    p [ Html.Attributes.class "font-medium mt-10" ]
        [ span [] [ text "Orlando's official " ]
        , a
            [ Html.Attributes.class "border-solid border-b-4 border-red-500 hover:border-red-300"
            , Html.Attributes.href "https://indiehackers.com"
            ]
            [ text "Indie Hackers" ]
        , span [] [ text " community for aspiring entrepreneurs and early founders of profitable businesses." ]
        ]


emoji : Html a
emoji =
    div [ Html.Attributes.class "mt-10" ]
        [ span [ Html.Attributes.class "text-6xl" ]
            [ text "🚀" ]
        ]



-- SIDEBAR


sidebar : Html a
sidebar =
    div [ Html.Attributes.class "bg-indigo-900 h-screen w-1/2" ]
        [ image ]


image : Html a
image =
    img
        [ Html.Attributes.class "h-screen"
        , Html.Attributes.src "../wall-of-products.jpg"
        ]
        []
