module Models exposing (..)

import Scorecards.Models exposing (Scorecard)


type alias Model =
    { scorecards : List Scorecard
    }


initialModel : Model
initialModel =
    { scorecards = []
    }
