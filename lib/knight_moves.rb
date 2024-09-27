module Knight
  KNIGHT_MOVES = [
    [1, 2], [2, 1],
    [-1, 2], [-2, 1],
    [1, -2], [2, -1],
    [-1, -2], [-2, -1]
  ]

  def valid_knight_moves(position)
    x, y = position

    KNIGHT_MOVES.map { |dx, dy| [x + dx, y + dy] } 
                .select { |new_x, new_y| (0..7).cover?(new_x) && (0..7).cover?(new_y) }
  end

  def knight_moves(start, finish)
    return 0 if start == finish

    queue = [[start, 0, [start]]]
    visited = Set.new([start])
    paths = []

    until queue.empty?
      current_position, moves, current_path = queue.shift

      valid_moves = valid_knight_moves(current_position)

      valid_moves.each do |move|
        if move == finish
          paths << (current_path + [move])
        else
          unless visited.include?(move)
            visited.add(move)
            queue.push([move, moves + 1, current_path + [move]])
          end
        end
      end

      break if paths.any?
    end

    if paths.empty?
      puts 'ERROR: path not found'
      return nil
    else
      puts "You made it in #{paths.first.length - 1} moves!"
      paths.each { |path| puts path.inspect }
      return paths
    end
  end
end
