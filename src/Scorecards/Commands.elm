module Scorecards.Commands exposing (..)

import Http
import Array exposing (Array)
import Json.Decode.Extra exposing (date, (|:))
import Json.Decode exposing (Decoder, decodeValue, succeed, string, null, list, bool, int, float, (:=))
import Task
import Scorecards.Models exposing (ScorecardId, Scorecard)
import Scorecards.Messages exposing (..)


fetchAll : Cmd Msg
fetchAll =
    Http.get collectionDecoder fetchAllUrl
        |> Task.perform FetchAllFail FetchAllDone


fetchAllUrl : String
fetchAllUrl =
    "http://golfstats.fransman.se/scorecards"


collectionDecoder : Decoder (List Scorecard)
collectionDecoder =
    ("scorecards" := list scorecard)


scorecard : Decoder Scorecard
scorecard =
    succeed Scorecard
        |: ("id" := int)
        |: ("date" := date)
        |: ("course" := string)
        |: ("golfshot_id" := string)
        |: ("par" := int)
        |: ("strokes_out" := int)
        |: ("strokes_in" := int)
        |: ("strokes" := int)
        |: ("points" := int)
        |: ("putts" := int)
        |: ("putts_avg" := float)
        |: ("putts_out" := int)
        |: ("putts_in" := int)
        |: ("girs" := int)
        |: ("firs" := int)
        |: ("strokes_over_par" := int)
        |: ("scores_count" := int)
        |: ("not_par_three_holes" := int)
        |: ("distance" := int)
        |: ("consistency" := list int)
        |: ("scores" := list int)
        |: ("scoring_distribution" := list int)
        |: ("putts_gir_avg" := float)
