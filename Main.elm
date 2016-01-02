import Html exposing (..)
import Bit exposing (initialModel, update, view)
import StartApp.Simple exposing (start)

main : Signal Html
main =
  start
    { model = initialModel
    , update = update
    , view = view
    }
