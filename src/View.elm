module View exposing (..)

import Html exposing (Html, div, text, button, h1)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Messages exposing (Msg(..))
import Models exposing (Model, Scorecard)
import ScorecardsList
import List exposing (length)


view : Model -> Html Msg
view model =
    if length model.filteredScorecards > 0 then
        div [ class "container" ]
            [ h1 [] [ text model.currentYear ]
            , sidebar model.currentYear model.years
            , page model.filteredScorecards
            ]
    else
        div [] [ text "No data loaded" ]


page : List Scorecard -> Html Msg
page scorecards =
    ScorecardsList.view scorecards


sidebar : String -> List String -> Html Msg
sidebar currentYear years =
    let
        buttons =
            List.map (yearButton currentYear) years
    in
        div [ class "years" ] (buttons)


yearButton : String -> String -> Html Msg
yearButton currentYear year =
    button
        [ classList [ ( "active", currentYear == year ) ]
        , onClick (ChangeCurrentYear year)
        ]
        [ text year
        ]
