class Solver
  def initialize(params)
    @serial = params[:serial].to_s
    @width = params[:width].to_i
    @node = { position: @serial.index('S'), parent: nil, distance: 0 }
    @open_list = []
    @closed_list = [{ position: @serial.index('S'), parent: nil, distance: 0 }]
    @finish = nil
  end

  # PUBLIC METHOD TO GET THE SHORTEST PATH
  def solve
    start_time = Time.now
    measure_distances
    duration = ((Time.now - start_time) * 1_000).round
    @finish ? response_solved(duration) : response_unsolvable(duration)
  end

  private

  # RESPONSE TO RETURN WHEN MAZE IS SOLVED
  def response_solved(duration)
    {
      error: nil, path_found: true,
      path_length: @finish[:distance],
      path_positions: generate_path, path_serialized: serialized_path,
      calculation_time: duration
    }
  end

  # RESPONSE TO RETURN WHEN MAZE IS UNSOLVABLE
  def response_unsolvable(duration)
    {
      error: 'unsolvable maze: finish can not be reached', path_found: false,
      path_length: nil, path_positions: nil, path_serialized: @serial,
      calculation_time: duration
    }
  end

  # MAZE SERIALIZED PATH
  def serialized_path
    @serial.chars.each_with_index.map do |character, index|
      generate_path[1..-2].include?(index) ? 'X' : character
    end.join
  end

  # RETURN THE SHORTEST PATH FOUND FROM START TO FINISH
  def generate_path
    node = @finish
    steps = []
    loop do
      steps << node[:position]
      node[:parent] ? node = node[:parent] : break
    end
    steps.reverse
  end

  # MESURE SHORTEST DISTANCE FROM START TO EACH NODE
  def measure_distances
    positions = reachable_positions
    positions.each do |position|
      # skip if position is in closed list
      next if @closed_list.map { |node| node[:position] }.include? position

      # if position is the finish, update finish, otherwise update open list
      position == @serial.index('F') ? update_finish : update_open_list(position)
    end
    # stop calculation if there is no more nodes to analyze
    return nil if @open_list.empty?

    # define next node and recall the method to analyze it
    update_current_node
    measure_distances
  end

  # TOP POSITION OF CURRENT POSITION
  def top
    @node[:position] >= @width ? @node[:position] - @width : nil
  end

  # BOTTOM POSITION OF CURRENT POSITION
  def bottom
    @node[:position] < @serial.length - @width ? @node[:position] + @width : nil
  end

  # LEFT POSITION OF CURRENT POSITION
  def left
    (@node[:position] % @width).zero? ? nil : @node[:position] - 1
  end

  # RIGHT POSITION OF CURRENT POSITION
  def right
    ((@node[:position] + 1) % @width).zero? ? nil : @node[:position] + 1
  end

  # DEFINE REACHABLE POSITIONS FROM CURRENT POSITION
  def reachable_positions
    [top, bottom, left, right]
      .select { |side| side && %w[S F P].include?(@serial[side]) }
  end

  # UPDATE FINISH NODE
  def update_finish
    # do not update if distance is higher than the previous one found
    return nil if @finish && @node[:distance] + 1 >= @finish[:distance]

    @finish = {
      position: @serial.index('F'),
      parent: @node,
      distance: @node[:distance] + 1
    }
  end

  # ADD OR UPDATE A NODE IN THE OPEN LIST
  def update_open_list(position)
    # find node and update it or add it in the open list
    node = @open_list.find { |n| n[:position] == position }
    node ? update_node(node) : create_node(position)
  end

  # ADD A NODE IN THE OPEN LIST
  def create_node(position)
    # do not create if node is the finish
    return nil if position == @serial.index('F')

    @open_list << {
      position: position,
      parent: @node,
      distance: @node[:distance] + 1
    }
  end

  # UPDATE A NODE IN THE OPEN LIST
  def update_node(node)
    # do not update if distance is higher than the previous one found
    return nil if @node[:distance] + 1 >= node[:distance]

    node[:parent] = @node
    node[:distance] = @node[:distance] + 1
  end

  # UPDATE NODE WHICH DISTANCE WILL BE MEASURED
  def update_current_node
    @closed_list << @node = @open_list.shift
  end
end
