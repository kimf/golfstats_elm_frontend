module Scorecards.Update exposing (..)

import Scorecards.Messages exposing (Msg(..))
import Scorecards.Models exposing (Scorecard)


update : Msg -> List Scorecard -> List Int -> String -> ( List Scorecard, Cmd Msg )
update message scorecards years currentYear =
    case message of
        FetchScorecards (Ok scorecards) ->
            ( scorecards, Cmd.none )

        FetchScorecards (Err _) ->
            ( scorecards, Cmd.none )
