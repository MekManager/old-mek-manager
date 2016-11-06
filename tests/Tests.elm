module Tests exposing (..)

import Test exposing (..)
import Expect
import String

import MekTest
import LocationTest

all : Test
all =
    concat
        [ MekTest.all, LocationTest.all ]
