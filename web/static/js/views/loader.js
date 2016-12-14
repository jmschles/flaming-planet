import MainView from './main'
import DailyTaskIndexView from './daily_task/index'
import PageIndexView from './page/index'

const views = {
  DailyTaskIndexView,
  PageIndexView,
}

export default function loadView(viewName) {
  return views[viewName] || MainView;
}
