module Scorecards.Models exposing (..)


type alias ScorecardId =
    Int


type alias Scorecard =
    { id : ScorecardId
    , course : String
    , strokes_over_par : Int
    }
