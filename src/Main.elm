module Main exposing (Model, Msg(..), init, main, mainContent, subscriptions, update, view, viewAlerts, viewHeader, viewSidenav, viewSubnav)

-- lib
-- app

import Browser
import ClarityUI.CDN
import ClarityUI.Header exposing (HeaderColor(..))
import ClarityUI.Layout
import ClarityUI.Sidenav exposing (NavItem(..))
import ClarityUI.Subnav
import Html exposing (..)


-- main : Program Never Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



type Msg
    = NoOp


update : Msg -> ( Model, Cmd Msg ) -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( {}, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view : ( Model, Cmd Msg ) -> Html Msg
view (model, _) =
    div []
        [ ClarityUI.CDN.styles
        , ClarityUI.CDN.icons
        , ClarityUI.Layout.layout
            { alerts = [ viewAlerts model ]
            , header = viewHeader model
            , subnav = [ viewSubnav model ]
            , sidenav = [ viewSidenav model ]
            , main = [ mainContent model ]
            }
        , ClarityUI.CDN.iconsJS
        , ClarityUI.CDN.iconsCEP
        ]


viewAlerts : Model -> Html Msg
viewAlerts model =
    div [] []


viewHeader : Model -> Html Msg
viewHeader model =
    ClarityUI.Header.header
        HC6
        { branding = { icon = "vm-bug", title = "Elm Clarity UI" }
        , nav = []
        , search = []
        , actions = []
        }


viewSubnav : Model -> Html Msg
viewSubnav model =
    ClarityUI.Subnav.subnav
        [ { link = "#", text = "Example1" }
        , { link = "#", text = "Example2" }
        , { link = "#", text = "Example3" }
        , { link = "#", text = "Example4" }
        ]


mainContent : Model -> Html Msg
mainContent model =
    div [] []


viewSidenav : Model -> Html Msg
viewSidenav model =
    ClarityUI.Sidenav.sidenav
        [ Link { link = "#", text = "Nav Element 1" }
        , Link { link = "#", text = "Nav Element 2" }
        , Group
            { id = "tab1"
            , label = "Collapsible Nav Element"
            , collapsible = True
            , navList =
                [ { link = "#", text = "Link 1" }
                , { link = "#", text = "Link 2" }
                ]
            }
        , Group
            { id = "tab2"
            , label = "Default Nav Element"
            , collapsible = False
            , navList =
                [ { link = "#", text = "Link 1" }
                , { link = "#", text = "Link 2" }
                , { link = "#", text = "Link 3" }
                , { link = "#", text = "Link 4" }
                , { link = "#", text = "Link 5" }
                , { link = "#", text = "Link 6" }
                ]
            }
        ]
