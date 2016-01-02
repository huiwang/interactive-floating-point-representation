module Bit where
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
  div [] [checkbox address model Select]

checkbox : Address Action -> Bool -> (Bool -> Action) -> Html
checkbox address isChecked tag =
  input
    [ type' "checkbox"
    , checked isChecked
    , on "change" targetChecked (Signal.message address << tag)
    ]
    []
