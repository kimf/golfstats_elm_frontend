module Scorecards.Commands exposing (..)

import Http
import Json.Decode as Decode exposing ((:=))
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


collectionDecoder : Decode.Decoder (List Scorecard)
collectionDecoder =
    ("scorecards" := Decode.list memberDecoder)


memberDecoder : Decode.Decoder Scorecard
memberDecoder =
    Decode.object3 Scorecard
        ("id" := Decode.int)
        ("course" := Decode.string)
        ("strokes_over_par" := Decode.int)
