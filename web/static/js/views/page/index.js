import MainView from '../main';


export default class View extends MainView {
  mount(resourceName) {
    super.mount(resourceName);
  }

  unmount() {
    super.unmount();

    // Specific logic here
  }
}
