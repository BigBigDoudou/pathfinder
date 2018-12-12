Rails.application.routes.draw do
  get 'mazes/server', to: 'mazes#server'
  post 'mazes/solve', to: 'mazes#solve'
end
