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
            , next
            , rsvpButton
            , newsletterButton
            , emoji
            ]
        ]


header : Html a
header =
    h1 [ Html.Attributes.class "font-black leading-none text-5xl" ]
        [ span [] [ text "Orlando" ]
        , br [] []
        , span [] [ text "Indie Hackers" ]
        ]


subheader : Html a
subheader =
    div [ Html.Attributes.class "mt-8" ]
        [ p [ Html.Attributes.class "font-medium" ]
            [ span [] [ text "Orlando's official " ]
            , a
                [ Html.Attributes.class "border-solid border-b-4 border-red-500 hover:border-red-300"
                , Html.Attributes.href "https://indiehackers.com"
                ]
                [ text "Indie Hackers" ]
            , span [] [ text " community for aspiring entrepreneurs and early founders of profitable businesses." ]
            ]
        ]


next : Html a
next =
    div [ Html.Attributes.class "mt-8" ]
        [ strong [ Html.Attributes.class "" ]
            [ text "Next Meeting:" ]
        , p [ Html.Attributes.class "italic" ]
            [ text "Monday August 12th // 7pm - 9pm // @ TBD" ]
        ]



-- BUTTONS


rsvpButton : Html a
rsvpButton =
    div [ Html.Attributes.class "mt-12" ]
        [ a
            [ Html.Attributes.class "bg-indigo-700 font-semibold hover:bg-indigo-900 px-12 py-4 rounded-full text-xl text-white uppercase"
            , Html.Attributes.href "https://www.meetup.com/orlando-indie-hackers/events"
            ]
            [ text "RSVP on Meetup" ]
        ]


newsletterButton : Html a
newsletterButton =
    div [ Html.Attributes.class "mt-12" ]
        [ a
            [ Html.Attributes.class "bg-gray-600 font-semibold hover:bg-indigo-700 px-12 py-4 rounded-full text-xl text-white uppercase"
            , Html.Attributes.href "https://convertkit.com"
            ]
            [ text "Newsletter Sign-up" ]
        ]


emoji : Html a
emoji =
    div [ Html.Attributes.class "mt-8 rocket" ]
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
