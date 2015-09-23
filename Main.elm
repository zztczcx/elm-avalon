module Avalon where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.Lazy exposing (lazy, lazy2, lazy3)
import Json.Decode as Json
import Signal exposing (Signal, Address)
import String
import Window


import Lob
import Room

type Stage
    = Lob
    | Room
    | Game

---- MODEL ----

type alias Model = 
    { stage : Stage
    }

emptyModel : Model
emptyModel = 
    { stage = Lob
    }

---- UPDATE -----
type Action
    = NoOp
    | ToRoom
    | BeginGame

update : Action -> Model -> Model
update action model =
    case action of
      NoOp -> model


---- VIEW ----

view: Address Action -> Model -> Html
view address model =
  case model.stage of
    Lob ->
      Lob.view address model


---- INPUTS ----

-- wire the entire application together
main : Signal Html
main =
  Signal.map (view actions.address) model


-- manage the model of our application over time
model : Signal Model
model =
  Signal.foldp update initialModel actions.signal


initialModel : Model
initialModel = emptyModel


-- actions from user input
actions : Signal.Mailbox Action
actions =
  Signal.mailbox NoOp
