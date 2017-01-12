defmodule FlamingPlanet.Api.DailyTaskView do
  use FlamingPlanet.Web, :view

  def render("index.json", %{daily_tasks: daily_tasks}) do
    %{data: render_many(daily_tasks, FlamingPlanet.Api.DailyTaskView, "daily_task.json")}
  end

  def render("daily_task.json", %{daily_task: daily_task}) do
    %{
      id: daily_task.id,
      title: daily_task.title,
      info_link: daily_task.info_link,
      description: daily_task.description
    }
  end
end
