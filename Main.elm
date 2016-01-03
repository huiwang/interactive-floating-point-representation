import Html exposing (..)
import Float exposing (initModel, update, view, view2)
import StartApp.Simple exposing (start)

main : Signal Html
main =
  start
    { model = initModel
    , update = update
    , view = view2
    }
