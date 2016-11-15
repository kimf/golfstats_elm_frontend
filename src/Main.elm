module Main exposing (..)

import Html
import Messages exposing (Msg(..))
import Models exposing (Model, initialModel)
import View exposing (view)
import Update exposing (update)
import Commands exposing (fetchAll)


init : ( Model, Cmd Msg )
init =
    ( initialModel, fetchAll )


subscriptions : Model -> Sub msg
subscriptions model =
    Sub.none



-- MAIN


main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
