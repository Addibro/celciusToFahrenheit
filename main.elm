module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (placeholder)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { someString : String
    }


init : ( Model, Cmd Msg )
init =
    ( Model "Initial string", Cmd.none )



-- UPDATE


type Msg
    = ChangeString String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeString newString ->
            ( { model | someString = newString }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ p [] [ text model.someString ]
        , input
            [ onInput ChangeString
            , placeholder "Type something here!"
            ]
            []
        ]
