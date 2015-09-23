module Room where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.Lazy exposing (lazy, lazy2, lazy3)
import Json.Decode as Json
import Signal exposing (Signal, Address)
import String
import Window
import Main exposing( Action, Model)

---- UPDATE -----

---- VIEW ----

view: Address Action -> Model -> Html
view address model =
  div 
    []
    [ text "room" ]

