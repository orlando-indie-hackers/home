module Main exposing (main)

-- IMPORTS

import Html exposing (..)
import Html.Attributes
import Icon
import Svg
import Svg.Attributes



-- MAIN


main : Html a
main =
    div [ Html.Attributes.class "flex flex-row-reverse flex-wrap" ]
        [ splash
        , content
        ]



-- SPLASH IMAGE


splash : Html a
splash =
    div [ Html.Attributes.class "bg-indigo-900 h-64 sm:h-screen sm:w-1/2 w-full" ]
        [ image ]


image : Html a
image =
    img
        [ Html.Attributes.class "h-screen object-cover"
        , Html.Attributes.src "https://createwithelm.s3.amazonaws.com/indie-hackers/wall-of-products.jpg"
        ]
        []



-- CONTENT


content : Html a
content =
    div [ Html.Attributes.class "bg-white sm:h-screen sm:w-1/2 w-full" ]
        [ div [ Html.Attributes.class "px-16 pt-16" ]
            [ header
            , subheader
            , next
            , rsvpButton
            , newsletterButton
            , contact
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
                , Html.Attributes.target "_blank"
                , Html.Attributes.title "Go to indiehackers.com"
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
    div [ Html.Attributes.class "mt-10" ]
        [ a
            [ Html.Attributes.class "bg-indigo-700 flex flex-no-wrap font-semibold hover:bg-indigo-900 items-center justify-center max-w-sm px-10 py-4 rounded-full text-xl text-white uppercase"
            , Html.Attributes.href "https://www.meetup.com/orlando-indie-hackers/events"
            ]
            [ span [ Html.Attributes.class "mr-1 text-red-500" ]
                [ Icon.meetup ]
            , span []
                [ text "RSVP on Meetup" ]
            ]
        ]


newsletterButton : Html a
newsletterButton =
    div [ Html.Attributes.class "mt-6" ]
        [ a
            [ Html.Attributes.class "bg-gray-600 flex flex-no-wrap font-semibold hover:bg-indigo-700 items-center justify-center max-w-sm px-10 py-4 rounded-full text-xl text-white uppercase"
            , Html.Attributes.href "https://convertkit.com"
            ]
            [ span [ Html.Attributes.class "mr-1 text-white" ]
                [ Icon.email ]
            , span []
                [ text "Newsletter Sign-up" ]
            ]
        ]



-- CONTACT


contact : Html a
contact =
    div [ Html.Attributes.class "mt-10" ]
        [ a
            [ Html.Attributes.class "mr-2 hover:text-blue-300"
            , Html.Attributes.href "https://twitter.com/bijanbwb"
            ]
            [ Icon.twitter
            ]
        , a
            [ Html.Attributes.class "mr-2 hover:text-pink-300"
            , Html.Attributes.href "mailto:bijanbwb@gmail.com"
            ]
            [ Icon.email ]
        , a
            [ Html.Attributes.class "mr-2 hover:text-gray-300"
            , Html.Attributes.href "https://github.com/orlando-indie-hackers"
            ]
            [ Icon.github ]
        ]



-- FUN


emoji : Html a
emoji =
    div [ Html.Attributes.class "mt-8 rocket" ]
        [ span [ Html.Attributes.class "text-6xl" ]
            [ text "🚀" ]
        ]
