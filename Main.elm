import Html exposing (..)
import Float exposing (initModel, update, view)
import StartApp.Simple exposing (start)

main : Signal Html
main =
  start
    { model = initModel
    , update = update
    , view = view
    }
