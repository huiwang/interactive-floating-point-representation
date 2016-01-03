module Float(initModel, update, view) where

import List exposing(..)
import Signal
import Bit
import Html exposing(..)
import Html.Attributes exposing(..)

-- Model
type alias Model = List (ID, Bit.Model)

initModel : Model
initModel =
    repeat 23 Bit.initModel
      |> indexedMap (\ i m -> (i, m))

-- Update
type alias ID = Int
type Action =
  Toggle ID Bit.Action

update : Action -> Model -> Model
update action bits =
  case action of
    Toggle i bAction ->
      map (\(j, b) -> (j, if(i==j) then (Bit.update bAction b) else b)) bits

-- View
view : Signal.Address Action -> Model -> Html
view address model =
  div [] (List.map (viewCounter address) model)

viewCounter : Signal.Address Action -> (ID, Bit.Model) -> Html
viewCounter address (id, model) =
  let
    bitView = Bit.view (Signal.forwardTo address (Toggle id)) model
  in
    div [style [("float", "left")]] [bitView]
