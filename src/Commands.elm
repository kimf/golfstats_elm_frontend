module Commands exposing (..)

import Http
import Array exposing (Array)
import Json.Decode.Extra exposing (date, (|:))
import Json.Decode exposing (Decoder, decodeValue, succeed, string, null, list, int, float, field)
import Task
import Models exposing (Scorecard)
import Messages exposing (..)


fetchAll : Cmd Msg
fetchAll =
    let
        url =
            "http://golfstats.fransman.se/scorecards"
    in
        Http.send FetchScorecards (Http.get url collectionDecoder)


collectionDecoder : Decoder (List Scorecard)
collectionDecoder =
    (field "scorecards" (list scorecard))


scorecard : Decoder Scorecard
scorecard =
    succeed Scorecard
        |: (field "id" int)
        |: (field "date" date)
        |: (field "course" string)
        |: (field "golfshot_id" string)
        |: (field "par" int)
        |: (field "strokes_out" int)
        |: (field "strokes_in" int)
        |: (field "strokes" int)
        |: (field "points" int)
        |: (field "putts" int)
        |: (field "putts_avg" float)
        |: (field "putts_out" int)
        |: (field "putts_in" int)
        |: (field "girs" int)
        |: (field "firs" int)
        |: (field "strokes_over_par" int)
        |: (field "scores_count" int)
        |: (field "not_par_three_holes" int)
        |: (field "distance" int)
        |: (field "consistency" (list int))
        |: (field "scores" (list int))
        |: (field "scoring_distribution" (list int))
        |: (field "putts_gir_avg" float)
