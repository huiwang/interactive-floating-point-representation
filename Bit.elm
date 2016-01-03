module Bit (initialModel, update, view) where
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (on, targetChecked)
import Signal exposing (Address)

-- MODEL
type alias Model = Bool

initialModel : Model
initialModel = False


-- UPDATE
type Action
  = Select Bool

update : Action -> Model -> Model
update action model =
  case action of
    Select bool -> bool

-- VIEW
view: Address Action -> Model -> Html
view address model =
  let
    bit = if model then "1" else "0"
    box = checkbox address model Select
  in
    div
      []
      [ span [style (centeredStyle ++ fontStyle)] [text bit]
      , div [style centeredStyle] [box]
      ]

checkbox : Address Action -> Bool -> (Bool -> Action) -> Html
checkbox address isChecked tag =
  input
    [ type' "checkbox"
    , checked isChecked
    , on "change" targetChecked (Signal.message address << tag)
    ]
    []

centeredStyle : List (String, String)
centeredStyle =
  [ ("text-align", "center")
  , ("display", "block")
  ]

fontStyle : List (String, String)
fontStyle =
  [ ("font-size", "2em")]
