require 'csv'

module MazeSpecHelper
  require 'csv'

  def import_maze_from_csv(csv_name)
    csv_text = File.read(Rails.root.join('lib', 'seeds', "#{csv_name}.csv"))
    csv = CSV.parse(csv_text, :headers => false, :encoding => 'ISO-8859-1')
    serial = csv[2..-1].map(&:join).join
    { serial: serial, width: csv[1][0].to_i }
  end

  def import_solution_from_csv(csv_name)
    csv_text = File.read(Rails.root.join('lib', 'seeds', "#{csv_name}.csv"))
    csv = CSV.parse(csv_text, :headers => false, :encoding => 'ISO-8859-1')
    csv[2..-1].map(&:join).join
  end

  def areas
    import_maze_from_csv('areas')
  end

  def areas_solution
    import_solution_from_csv('areas_solution')
  end

  def complex
    import_maze_from_csv('complex')
  end

  def complex_solution
    import_solution_from_csv('complex_solution')
  end

  def cycles
    import_maze_from_csv('cycles')
  end

  def cycles_solution
    import_solution_from_csv('cycles_solution')
  end

  def dead_ends
    import_maze_from_csv('dead_ends')
  end

  def dead_ends_solution
    import_solution_from_csv('dead_ends_solution')
  end

  def empty
    import_maze_from_csv('empty')
  end

  def empty_solution
    import_solution_from_csv('empty_solution')
  end

  def mini
    import_maze_from_csv('mini')
  end

  def mini_solution
    import_solution_from_csv('mini_solution')
  end

  def no_wall
    import_maze_from_csv('no_wall')
  end

  def no_wall_solution
    import_solution_from_csv('no_wall_solution')
  end

  def one_road
    import_maze_from_csv('one_road')
  end

  def one_road_solution
    import_solution_from_csv('one_road_solution')
  end

  def unreachable_pathes
    import_maze_from_csv('unreachable_pathes')
  end

  def unreachable_pathes_solution
    import_solution_from_csv('unreachable_pathes_solution')
  end

  def unsolvable_1
    import_maze_from_csv('unsolvable_1')
  end

  def unsolvable_2
    import_maze_from_csv('unsolvable_2')
  end

  def unsolvable_3
    import_maze_from_csv('unsolvable_3')
  end

  def unsolvable_4
    import_maze_from_csv('unsolvable_4')
  end
end
