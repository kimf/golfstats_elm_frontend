module Scorecards.Update exposing (..)

import Scorecards.Messages exposing (Msg(..))
import Scorecards.Models exposing (Scorecard)


update : Msg -> List Scorecard -> ( List Scorecard, Cmd Msg )
update message scorecards =
    case message of
        FetchAllDone scorecards ->
            ( scorecards, Cmd.none )

        FetchAllFail error ->
            ( scorecards, Cmd.none )
