import MainView from './main'
import DailyTaskIndexView from './daily_task/index'

const views = {
  DailyTaskIndexView,
}

export default function loadView(viewName) {
  return views[viewName] || MainView;
}
