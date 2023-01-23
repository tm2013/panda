import time

from panda import PandaSerial
from .helpers import test_all_gps_pandas, panda_connect_and_init

import pytest

@test_all_gps_pandas
@panda_connect_and_init
def test_abc(p):
  print("abc", p)