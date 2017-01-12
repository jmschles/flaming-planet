import $ from 'jquery'

export default class MainView {
  mount (resourceName) {
    var dailyTasks;
    var currentId = 0;

    $.getJSON('api/' + resourceName, function(response) {
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

  unmount () {
    // console.log('Unmounted');
  }
}
