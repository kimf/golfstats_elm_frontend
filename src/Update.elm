module Update exposing (..)

import Messages exposing (Msg(..))
import Models exposing (Model, Scorecard)
import Functions exposing (uniqueYears, isMatchingYear)
import List exposing (filter, head, length)


lastElem : List a -> Maybe a
lastElem =
    List.foldl (Just >> always) Nothing


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FetchScorecards (Ok scorecards) ->
            let
                years =
                    (uniqueYears scorecards) ++ [ "All" ]
            in
                ( Model "All" years scorecards scorecards, Cmd.none )

        FetchScorecards (Err _) ->
            ( model, Cmd.none )

        ChangeCurrentYear currentYear ->
            let
                filteredScorecards =
                    if currentYear == "All" then
                        model.scorecards
                    else
                        filter (isMatchingYear currentYear) model.scorecards
            in
                ( Model currentYear model.years model.scorecards filteredScorecards, Cmd.none )
