module Functions exposing (..)

import List exposing (length)
import String exposing (padLeft, join)
import Set exposing (Set, fromList)
import Date exposing (Date, toTime)


padWith : Char -> a -> String
padWith c =
    padLeft 2 c << toString


unique : List comparable -> List comparable
unique list =
    uniqueHelp identity Set.empty list


uniqueHelp : (a -> comparable) -> Set comparable -> List a -> List a
uniqueHelp f existing remaining =
    case remaining of
        [] ->
            []

        first :: rest ->
            let
                computedFirst =
                    f first
            in
                if Set.member computedFirst existing then
                    uniqueHelp f existing rest
                else
                    first :: uniqueHelp f (Set.insert computedFirst existing) rest


dateSort : { a | date : Date.Date } -> { b | date : Date.Date } -> Order
dateSort a b =
    Basics.compare (toTime b.date) (toTime a.date)


toDateString : Date -> String
toDateString d =
    let
        year =
            d |> toYearString

        month =
            d |> Date.month |> toString

        day =
            d |> Date.day |> padWith '0'
    in
        join " " [ day, month, year ]


toYearString : Date -> String
toYearString d =
    d |> Date.year |> toString


uniqueYears : List { a | date : Date } -> List String
uniqueYears datedList =
    List.map .date datedList
        |> List.map toYearString
        |> unique


listLengthAsString : List a -> String
listLengthAsString list =
    toString (length list)
