module Tests exposing (..)

import Test exposing (..)
import Expect
import String

import MekTest


all : Test
all =
    concat
        [ MekTest.all ]
