module Lob where

---- UPDATE ----

type Action
    = CreateRoom
    | EnterRoom


update : Action -> Model -> Model
update action model = 
  case action of 
    EnterRoom
