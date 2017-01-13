import $ from 'jquery'

export default class MainView {
  mount () {
    var dailyTasks;
    var currentId = 0;
    loadData();
    loadButtons();

    // Bootstrap data to the page
    function loadData(resourceName) {
      if (!resourceName) { resourceName = 'daily_tasks'; }
      $('.content').html('');

      $.getJSON(resourceName, function(response) {
        dailyTasks = response.data;
        $.each(dailyTasks, function(i, element) {
          var parentElement = $("<div/>", {
            id: "element-" + i
          });
          var headerElement = $("<h2/>");

          var linkElement = $("<a/>", {
            href: element.info_link,
            text: element.title
          });
          var descriptionElement = $("<p/>", {
            text: element.description
          });

          headerElement.append(linkElement);
          parentElement.append(headerElement);
          parentElement.append(descriptionElement);
          parentElement.hide()

          $('.content').append(parentElement);

          $("#element-0").show();
        });
      });

      loadButtons(resourceName);
    }

    // Buttons to take you to other kinds of data
    function loadButtons(resourceName) {
      var resourceNames = [
        'daily_tasks',
        'government_actions',
        'inspirations',
        'news_items',
        'donations'
      ];

      if (!resourceName) { resourceName = 'daily_tasks'; }
      var currentResourceIndex = resourceNames.indexOf(resourceName);
      if (currentResourceIndex > -1) {
        resourceNames.splice(currentResourceIndex, 1);
      }

      $(".other-categories").html('');

      for (let rName of resourceNames) {
        var buttonElement = $("<button/>", {
          text: rName,
          class: "btn btn-danger"
        });
        buttonElement.on("click", function() {
          loadData(rName);
        });
        $(".other-categories").append(buttonElement);
      }
    }

    // Cycles through the data
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
