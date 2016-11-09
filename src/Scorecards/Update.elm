module Scorecards.Update exposing (..)

import Scorecards.Messages exposing (Msg(..))
import Scorecards.Models exposing (Scorecard)
import List exposing (sortWith)
import Date exposing (toTime)


dateSort : { a | date : Date.Date } -> { b | date : Date.Date } -> Order
dateSort a b =
    Basics.compare (toTime b.date) (toTime a.date)


update : Msg -> List Scorecard -> ( List Scorecard, Cmd Msg )
update message scorecards =
    case message of
        FetchAllDone scorecards ->
            ( (sortWith dateSort scorecards), Cmd.none )

        FetchAllFail error ->
            ( scorecards, Cmd.none )
