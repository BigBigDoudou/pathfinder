class MazesController < ApplicationController
  def server
    json_response(server: true)
  end

  def solve
    validation = Validation.new(maze_params)
    if validation.valid?
      solution = Solver.new(maze_params).solve
      json_response(solution)
    else
      json_response(validation.errors, :unprocessable_entity)
    end
  end

  private

  def maze_params
    params.permit(:serial, :width)
  end
end
