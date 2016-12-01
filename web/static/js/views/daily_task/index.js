import MainView from '../main';

export default class View extends MainView {
  mount() {
    super.mount();

    // Specific logic here
    console.log('DailyTaskIndexView mounted');
  }

  unmount() {
    super.unmount();

    // Specific logic here
    console.log('DailyTaskIndexView unmounted');
  }
}
