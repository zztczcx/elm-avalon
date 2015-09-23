module Lob where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.Lazy exposing (lazy, lazy2, lazy3)
import Json.Decode as Json
import Signal exposing (Signal, Address)
import String
import Window


---- Model -----
type Stage
    = Lob
    | Room
    | Game

type alias Model = 
    { stage : Stage
    }

init: Model
init = 
  { stage = Lob

  }

---- UPDATE -----
type Action
    = CreateRoom
    | EnterRoom
    | StartGame

update : Action -> Model -> Model
update action model =
  case action of
    EnterRoom ->
      { model | stage <- Room }
    StartGame ->
      { model | stage <- Game }

---- VIEW ----

view: Address Action -> Model -> Html
view address model =
  case model.stage of 
    Lob ->
      div 
        []
        [ ul 
            []
            [li [] [button [ onClick address CreateRoom ] [ text "CreateRoom" ]]
            ,li [] [button [ onClick address EnterRoom ] [ text "EnterRoom" ]]
            ]
        ]
    Room ->
      div 
        []
        [text "Room"
        ,button [ onClick address StartGame ] [ text "StartGame" ]
        ]

    Game ->
      div
        []
        [text "Game"]
