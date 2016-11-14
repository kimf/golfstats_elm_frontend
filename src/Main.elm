module Main exposing (..)

import Html
import Messages exposing (Msg(..))
import Models exposing (Model, initialModel)
import View exposing (view)
import Update exposing (update)
import Scorecards.Commands exposing (fetchAll)


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.map ScorecardsMsg fetchAll )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
