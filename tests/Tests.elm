module Tests exposing (..)

import Test exposing (..)
import Expect
import String

import MekTest
import LocationTest
import EngineTest
import EngineTonnageTest

all : Test
all = concat
      [ MekTest.all
      , LocationTest.all
      , EngineTest.all
      , EngineTonnageTest.all
      ]
