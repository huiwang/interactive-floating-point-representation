module Float(initModel, update, view, view2, rangeBetween) where

import List exposing(..)
import Signal
import Bit
import Html exposing(..)
import Html.Attributes exposing(..)

-- Model
type alias Model = List (ID, Bit.Model)

initModel : Model
initModel =
    repeat 32 Bit.initModel
      |> indexedMap (\ i m -> (31 - i, m))

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

view2 : Signal.Address Action -> Model -> Html
view2 address model =
  let
    bitViews = map (viewCounter address) model
  in
    table []
      [ tbody []
        [ tr []
          [ th [] [text "sign (31)"]
          , th [] [text "exponent (30 - 23)"]
          , th [] [text "fraction (22 - 0)"]
          ]
        , tr []
          [ td [] (rangeBetween 0 1 bitViews)
          , td [] (rangeBetween 1 9 bitViews)
          , td [] (rangeBetween 9 32 bitViews)
          ]
        ]
      ]

rangeBetween : Int -> Int -> List a -> List a
rangeBetween from to list =
  drop from list
    |> take (to - from)

viewCounter : Signal.Address Action -> (ID, Bit.Model) -> Html
viewCounter address (id, model) =
  let
    bitView = Bit.view (Signal.forwardTo address (Toggle id)) model
  in
    div [style [("float", "left")]] [bitView]
