module Main exposing (main)

-- IMPORTS

import Browser
import Html exposing (..)
import Html.Attributes
import Html.Events
import Icon
import Svg exposing (Svg)
import Svg.Attributes



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


type alias Meeting =
    { date : String
    , time : String
    , location : ( String, String )
    }


type alias Model =
    { invokedFunTimes : Bool
    , nextMeeting : Meeting
    }


initialModel : Model
initialModel =
    { invokedFunTimes = False
    , nextMeeting =
        { date = "September 17th"
        , time = "6pm - 8pm"
        , location = ( "Venture X", "https://venturex.com/locations/florida/downtown-orlando" )
        }
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
content { invokedFunTimes, nextMeeting } =
    div [ Html.Attributes.class "bg-white sm:h-screen sm:w-1/2 w-full" ]
        [ div [ Html.Attributes.class "px-8 pt-6 sm:px-16 sm:pt-16" ]
            [ header
            , subheader
            , next nextMeeting
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
            [ span [] [ text "Orlando's " ]
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


next : Meeting -> Html a
next { date, time, location } =
    let
        ( venue, link ) =
            location
    in
    div [ Html.Attributes.class "max-w-sm mt-8" ]
        [ strong []
            [ text "Next Meeting:" ]
        , p [ Html.Attributes.class "italic" ]
            [ span [] [ text date ]
            , span [] [ text " // " ]
            , span [] [ text time ]
            , span [] [ text " // @ " ]
            , span []
                [ a
                    [ Html.Attributes.alt venue
                    , Html.Attributes.class "border-solid border-b-4 border-red-300 hover:border-red-500"
                    , Html.Attributes.href link
                    , Html.Attributes.target "_blank"
                    , Html.Attributes.title venue
                    ]
                    [ text venue ]
                ]
            ]
        ]



-- BUTTONS


rsvpButton : Html a
rsvpButton =
    div [ Html.Attributes.class "mt-10" ]
        [ a
            [ Html.Attributes.alt "Meetup.com"
            , Html.Attributes.class "bg-indigo-700 flex flex-no-wrap font-semibold hover:bg-indigo-900 items-center justify-center max-w-sm px-10 py-4 rounded-full text-xl text-white uppercase"
            , Html.Attributes.href "https://www.meetup.com/orlando-indie-hackers/events"
            , Html.Attributes.target "_blank"
            , Html.Attributes.title "Visit our Meetup.com page!"
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
            , Html.Attributes.alt "Newsletter Sign-up"
            , Html.Attributes.class "bg-indigo-500 flex flex-no-wrap font-semibold hover:bg-indigo-700 items-center justify-center max-w-sm px-10 py-4 rounded-full text-xl text-white uppercase"
            , Html.Attributes.href "https://pages.convertkit.com/a233cf9015/d07126d248"
            , Html.Attributes.target "_blank"
            , Html.Attributes.title "Sign up for occasional email updates!"
            ]
            [ span [ Html.Attributes.class "mr-2 text-white" ]
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
        , p [ Html.Attributes.class "italic mt-6" ]
            [ span [] [ text "Stop by to visit" ]
            , span [] [ mickey ]
            , span [] [ text " and stay for the community!" ]
            ]
        ]


mickey : Svg msg
mickey =
    Html.span [ Html.Attributes.title "Mickey Mouse" ]
        [ Svg.svg
            [ Svg.Attributes.class "inline ml-1 -mr-1"
            , Svg.Attributes.fill "black"
            , Svg.Attributes.width "40"
            , Svg.Attributes.height "40"
            , Svg.Attributes.viewBox "0 0 2000 2000"
            ]
            [ Svg.path [ Svg.Attributes.d "m1621.5 748.5c14.3 124.7-98 245.6-236.8 240.9-21.6-.7-23.1 4.2-16.3 23.6 84.1 240.8-69.5 496.6-319.7 542.3-290.1 52.9-571.6-225.1-461.7-545.3 7.4-21.4.3-21.5-17-21.3-128 1.6-223.4-76.6-244-199-20.8-123.5 71.6-269.1 191.9-305.7 56.7-17.2 112.3-23.9 170.1-5.4 108 34.6 171.5 129.4 163.8 247.7-1.8 27.5-1.8 27.5 24.7 21.1 65.4-15.9 130.9-16.2 196.5-1.2 27.4 6.3 28.2 6.2 25.9-23-4.9-63.9 8.9-123.4 51.6-171.4 68.3-76.9 154.5-100.3 254.4-75.4 95.4 23.8 160.9 81.5 198.7 171.4 14.1 33.4 23.3 67.8 17.9 100.7z" ]
                []
            ]
        ]



-- CONTACT


contact : Html a
contact =
    div [ Html.Attributes.class "mt-8" ]
        [ a
            [ Html.Attributes.alt "Twitter"
            , Html.Attributes.class "mr-2 hover:text-blue-300"
            , Html.Attributes.href "https://twitter.com/bijanbwb"
            , Html.Attributes.title "Say hi on Twitter!"
            ]
            [ Icon.twitter
            ]
        , a
            [ Html.Attributes.alt "Email"
            , Html.Attributes.class "mr-2 hover:text-pink-300"
            , Html.Attributes.href "mailto:bijanbwb@gmail.com"
            , Html.Attributes.title "Say hello via email!"
            ]
            [ Icon.email ]
        , a
            [ Html.Attributes.alt "GitHub"
            , Html.Attributes.class "mr-2 hover:text-gray-300"
            , Html.Attributes.href "https://github.com/orlando-indie-hackers"
            , Html.Attributes.title "View our GitHub org!"
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
