import MainView from '../main';
import $ from 'jquery'

export default class View extends MainView {
  mount() {
    super.mount();

    var dailyTasks;
    var currentId = 0;

    $.getJSON('api/daily_tasks', function(response) {
      dailyTasks = response.data;
      $.each(dailyTasks, function(i, task) {
        var parentElement = $("<div/>", {
          id: "task-" + i
        });
        var headerElement = $("<h2/>");

        var linkElement = $("<a/>", {
          href: task.info_link,
          text: task.title
        });
        var descriptionElement = $("<p/>", {
          text: task.description
        });

        headerElement.append(linkElement);
        parentElement.append(headerElement);
        parentElement.append(descriptionElement);
        parentElement.hide()

        $('.content').append(parentElement);

        $("#task-0").show();
      });
    });

    $("#next").on("click", nextTask);

    function nextTask() {
      $("#task-" + currentId).hide();
      currentId++;
      var nextTaskElement = $("#task-" + currentId);
      if (nextTaskElement.length !== 0) {
        nextTaskElement.show();
      } else {
        currentId = 0;
        $("#task-0").show();
      }
    }
  }

  unmount() {
    super.unmount();

    // Specific logic here
  }
}
