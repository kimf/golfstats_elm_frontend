module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model)
import Scorecards.Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ScorecardsMsg subMsg ->
            let
                ( updatedScorecards, cmd ) =
                    Scorecards.Update.update subMsg model.scorecards
            in
                ( { model | scorecards = updatedScorecards }, Cmd.map ScorecardsMsg cmd )
