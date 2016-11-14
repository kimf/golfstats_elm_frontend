module Scorecards.List exposing (..)

import Html exposing (..)
import Html.Attributes
import Html.Events exposing (onClick)
import Scorecards.Messages exposing (..)
import Scorecards.Models exposing (Scorecard)
import Functions exposing (..)
import String exposing (join)
import List exposing (sortWith)


--ROUNDS 202
--AVG. SCORE 90
--GIR 27.6%
--FIR 46%
--AVG. PUTTS 1.84
--AVG. GIR PUTTS 1.9


view : List Scorecard -> Html Msg
view scorecards =
    let
        scorecardsLength =
            listLengthAsString scorecards
    in
        Html.div [ Html.Attributes.attribute "class" "scorecards container" ]
            [ Html.h2 []
                [ Html.span [] [ Html.text scorecardsLength ]
                , Html.text " Rounds"
                ]
            , list (sortWith dateSort scorecards)
            ]


list : List Scorecard -> Html Msg
list items =
    let
        scorecardItems =
            List.map scorecardRow items
    in
        Html.table [ Html.Attributes.attribute "cellspacing" "0", Html.Attributes.attribute "cellpadding" "0" ]
            [ Html.thead []
                [ Html.tr []
                    [ Html.th [] [ Html.text "Date" ]
                    , Html.th [] [ Html.text "Course" ]
                    , Html.th [] [ Html.text "Score" ]
                    , Html.th [] [ Html.text "To Par" ]
                    ]
                ]
            , Html.tbody
                []
                (scorecardItems)
            ]


scorecardRow : Scorecard -> Html msg
scorecardRow scorecard =
    Html.tr []
        [ Html.td [] [ Html.text (toDateString scorecard.date) ]
        , Html.td [] [ Html.text scorecard.course ]
        , Html.td [] [ Html.text (toString scorecard.strokes) ]
        , Html.td [] [ Html.text (toString scorecard.strokes_over_par) ]
        ]
