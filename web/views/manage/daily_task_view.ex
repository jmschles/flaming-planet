defmodule FlamingPlanet.Manage.DailyTaskView do
  use FlamingPlanet.Web, :view
  alias FlamingPlanet.DailyTask

  def next_id_url(%DailyTask{ id: id }) do
    daily_task_path(FlamingPlanet.Endpoint, :show, id + 1)
  end
end
