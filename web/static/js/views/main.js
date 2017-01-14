import $ from 'jquery'

export default class MainView {
  mount () {
    var resources;
    var currentId;
    var leadIns;
    var nextButtonTextOptions = [
      "Cool. Next.",
      "Okay, tell me more.",
      "Sure, what else?",
      "Yeah, and..."
    ];
    var resourcePairs = {
      daily_tasks: {
        buttonText: 'What can I do today?',
        leadIns: [
          'You could...',
          'Get on out there and...',
          'Why don\'t you...'
        ]
      },
      government_actions: {
        buttonText: 'Is my government doing anything?',
        leadIns: [
          'Check this out:',
          'This is in the works:',
          'They\'re working on...'
        ]
      },
      inspirations: {
        buttonText: "I'm bummed. Inspire me!",
        leadIns: [
          'This is awesome:',
          'Take heart!',
          'Get a load of this:'
        ]
      },
      news_items: {
        buttonText: "What's the latest?",
        leadIns: [
          'This is happening:',
          'Did you know...',
          'Extra, extra!'
        ]
      },
      donations: {
        buttonText: 'Who can I pay to fix it for me?',
        leadIns: [
          'These people!',
          'Great work is being done by:',
          'Send those dollars to:'
        ]
      }
    };

    loadData();

    // Bootstrap data to the page
    function loadData(resourceName) {
      if (!resourceName) { resourceName = 'daily_tasks'; }

      leadIns = resourcePairs[resourceName]['leadIns'];
      currentId = 0;
      $('.content').html('');

      $.getJSON(resourceName, function(response) {
        resources = response.data;
        $.each(resources, function(i, element) {
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

      populateNextButton();
      populateLeadIn();
      loadButtons(resourceName);
    }

    // Buttons to take you to other kinds of data
    function loadButtons(resourceName) {
      if (!resourceName) { resourceName = 'daily_tasks'; }

      $(".other-categories").html('');

      for (let rName in resourcePairs) {
        if (rName === resourceName) { continue; }
        var buttonElement = $("<button/>", {
          text: resourcePairs[rName]['buttonText'],
          class: "category-button"
        });
        buttonElement.on("click", function() {
          loadData(rName);
        });
        $(".other-categories").append(buttonElement);
      }
    }

    // Cycles through the data
    $(".next-button").on("click", nextResource);

    function nextResource() {
      $("#element-" + currentId).hide();
      currentId++;
      var nextElement = $("#element-" + currentId);
      if (nextElement.length !== 0) {
        nextElement.show();
      } else {
        currentId = 0;
        $("#element-0").show();
      }

      populateLeadIn();
      populateNextButton();
    }

    function populateNextButton() {
      $(".next-button").html(nextButtonTextOptions[Math.floor(Math.random() * nextButtonTextOptions.length)]);
    }

    function populateLeadIn() {
      $(".lead-in").html(leadIns[Math.floor(Math.random() * leadIns.length)]);
    }
  }

  unmount () {
    // console.log('Unmounted');
  }
}
