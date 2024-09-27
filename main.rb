require_relative 'lib/knight_moves'

include Knight

start = [0,0]
finish = [7,7]

path = knight_moves(start, finish)