module Scorecards.Messages exposing (..)

import Http
import Scorecards.Models exposing (ScorecardId, Scorecard)


type Msg
    = FetchAllDone (List Scorecard)
    | FetchAllFail Http.Error
