module Scorecards.Filter exposing (..)

import Html exposing (..)
import Html.Attributes
import Html.Events exposing (onClick)
import Scorecards.Messages exposing (..)


view : List Int -> String -> Html Msg
view years currentYear =
    let
        buttons =
            List.map (yearButton currentYear) years
    in
        Html.div [ Html.Attributes.attribute "class" "years" ] (buttons)


yearButton : String -> Int -> Html msg
yearButton currentYear year =
    let
        className =
            if currentYear == toString year then
                "active"
            else
                ""
    in
        Html.button [ Html.Attributes.attribute "class" (className) ] [ Html.text (toString year) ]
