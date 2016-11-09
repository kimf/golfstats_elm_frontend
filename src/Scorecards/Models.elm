module Scorecards.Models exposing (..)

import Array exposing (Array)
import Date exposing (Date)


type GameStatus
    = Unknown
    | NotStarted
    | Started


type alias ScorecardId =
    Int


type alias Scorecard =
    { id : ScorecardId
    , date : Date
    , course : String
    , golfshot_id : String
    , par : Int
    , strokes_out : Int
    , strokes_in : Int
    , strokes : Int
    , points : Int
    , putts : Int
    , putts_avg : Float
    , putts_out : Int
    , putts_in : Int
    , girs : Int
    , firs : Int
    , strokes_over_par : Int
    , scores_count : Int
    , not_par_three_holes : Int
    , distance : Int
    , consistency : List Int
    , scores : List Int
    , scoring_distribution : List Int
    , putts_gir_avg : Float
    }
