module Scorecards.Messages exposing (..)

import Http
import Scorecards.Models exposing (Scorecard)


type Msg
    = FetchScorecards (Result Http.Error (List Scorecard))
