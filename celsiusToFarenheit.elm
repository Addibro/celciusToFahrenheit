module Main exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (placeholder, type_, class, name, value)


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
    { celcius : Float
    }


init : ( Model, Cmd Msg )
init =
    ( Model 0, Cmd.none )



-- UPDATE


type Msg
    = ConvertValue String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ConvertValue newValue ->
            case String.toFloat newValue of
                Ok value ->
                    ( { model | celcius = value }, Cmd.none )

                Err errmsg ->
                    ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


convert : Float -> Float
convert f =
    f * 9 / 5 + 32



-- VIEW


view : Model -> Html Msg
view model =
    div
        [ class "window" ]
        [ h2 [] [ text "Enter celcius to be converted:" ]
        , input
            [ onInput ConvertValue, type_ "text", name "inputField", placeholder "0" ]
            []
        , h2 [] [ text "Fahrenheit:" ]
        , p [] [ text <| toString <| convert model.celcius ]
        ]
