module Messages exposing (..)

import Http
import Models exposing (Scorecard)


type Msg
    = FetchScorecards (Result Http.Error (List Scorecard))
    | ChangeCurrentYear String
