module View exposing (..)

import Html exposing (Html, div, text)
import Html.Attributes
import Messages exposing (Msg(..))
import Models exposing (Model)
import Scorecards.Models exposing (Scorecard)
import Scorecards.List
import Scorecards.Filter
import List exposing (length)


view : Model -> Html Msg
view model =
    if length model.scorecards > 0 then
        Html.div [ Html.Attributes.attribute "class" "container" ]
            [ Html.div [ Html.Attributes.attribute "class" "filters" ]
                [ sidebar model.years model.currentYear ]
            , Html.div [ Html.Attributes.attribute "class" "list" ]
                [ page model.scorecards ]
            ]
    else
        Html.div [] [ Html.text "No data loaded" ]


page : List Scorecard -> Html Msg
page scorecards =
    Html.map ScorecardsMsg (Scorecards.List.view scorecards)


sidebar : List Int -> String -> Html Msg
sidebar years currentYear =
    Html.map ScorecardsMsg (Scorecards.Filter.view years currentYear)
