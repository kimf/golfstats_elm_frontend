module Models exposing (..)

import Time
import Scorecards.Models exposing (Scorecard)


type alias Model =
    { scorecards : List Scorecard
    , years : List Int
    , currentYear : String
    }


initialModel : Model
initialModel =
    { scorecards = []
    , years = []
    , currentYear = ""
    }
