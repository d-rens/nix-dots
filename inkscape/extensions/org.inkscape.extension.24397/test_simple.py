# coding=utf-8
from inkex.tester import ComparisonMixin, TestCase

from grid_perspect2 import Grid_Perspective

class TestPerspectBasic(ComparisonMixin, TestCase):
    effect_class = Grid_Perspective
    compare_file = 'svg/empty.svg'
    comparisons = [(),]

from grid_cartesian2 import Grid_Cartesian

class TestCartesianBasic(ComparisonMixin, TestCase):
    effect_class = Grid_Cartesian
    compare_file = 'svg/empty.svg'
    comparisons = [(),]

from grid_triangular import Grid_Triangular

class TestTriangularBasic(ComparisonMixin, TestCase):
    effect_class = Grid_Triangular
    compare_file = 'svg/empty.svg'
    comparisons = [(),]
