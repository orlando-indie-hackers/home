module Main exposing (main)

-- IMPORTS

import Browser
import Html exposing (..)
import Html.Attributes
import Html.Events
import Icon



-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- MODEL


type alias Model =
    { invokedFunTimes : Bool
    }


initialModel : Model
initialModel =
    { invokedFunTimes = False
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( initialModel
    , Cmd.none
    )



-- UPDATE


type Msg
    = UserClickedEmoji


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UserClickedEmoji ->
            ( { model | invokedFunTimes = True }
            , Cmd.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div [ Html.Attributes.class "flex flex-row-reverse flex-wrap" ]
        [ splash
        , content model
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


content : Model -> Html Msg
content { invokedFunTimes } =
    div [ Html.Attributes.class "bg-white sm:h-screen sm:w-1/2 w-full" ]
        [ div [ Html.Attributes.class "px-8 pt-6 sm:px-16 sm:pt-16" ]
            [ header
            , subheader
            , next
            , rsvpButton
            , newsletterButton
            , description
            , contact
            , emoji invokedFunTimes
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
    div [ Html.Attributes.class "max-w-md mt-8" ]
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
            , Html.Attributes.target "_blank"
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
            [ Html.Attributes.attribute "data-formkit-toggle" "a233cf9015"
            , Html.Attributes.class "bg-gray-600 flex flex-no-wrap font-semibold hover:bg-indigo-700 items-center justify-center max-w-sm px-10 py-4 rounded-full text-xl text-white uppercase"
            , Html.Attributes.href "https://pages.convertkit.com/a233cf9015/d07126d248"
            , Html.Attributes.target "_blank"
            ]
            [ span [ Html.Attributes.class "mr-1 text-white" ]
                [ Icon.email ]
            , span []
                [ text "Newsletter Sign-up" ]
            ]
        ]



-- DESCRIPTION


description : Html a
description =
    div [ Html.Attributes.class "max-w-md mt-10" ]
        [ ul [ Html.Attributes.class "list-disc list-inside" ]
            [ li [ Html.Attributes.class "leading-tight" ]
                [ text "🚀 If you're an aspiring entrepreneur or building a side project, join us to share what you're working on and get feedback and encouragement." ]
            , li [ Html.Attributes.class "leading-tight mt-2" ]
                [ text "📈 If you're already running a profitable business, come share your story and your experience as you continue growing your business." ]
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


emoji : Bool -> Html Msg
emoji invokedFunTimes =
    div
        [ Html.Attributes.class "cursor-pointer mt-8"
        , Html.Attributes.classList [ ( "rocket", invokedFunTimes ) ]
        , Html.Events.onClick UserClickedEmoji
        ]
        [ span [ Html.Attributes.class "text-6xl" ]
            [ text "🚀" ]
        ]
