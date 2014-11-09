var searchPage = {
    initialized: false,
    init: function() {
        searchPage.initialized = true;
        var filters = $('[name="categories"],[name="volunteer"],[name="location"],[name="language"],[name="timeLeft"],[name="percentFunded"],[name="fundingStatus"]');
        filters.click(function() {
            searchPage.filterCall();
        });
        searchPage.filterCall();
    },
    filterCall: function() {
        var onFilterSuccess = function(data) {
            /*var searchResults = [{
                'imageSrc': 'http://www.rangde.org/images/landingPage/madness_pro_img7.jpg',
                'amountRaised': '1000',
                'amountNeeded': '10,000',
                'amountRemaining': '9,000',
                'percentageRaised': '10',
                'location': 'Bangalore',
                'timeLeft': '2 Days',
                'patientName': 'Suresh'
            }, {
                'imageSrc': 'http://www.rangde.org/images/landingPage/madness_pro_img7.jpg',
                'amountRaised': '1000',
                'amountNeeded': '10,000',
                'amountRemaining': '9,000',
                'percentageRaised': '10',
                'location': 'Bangalore',
                'timeLeft': '2 Days',
                'patientName': 'Suresh'
            }];*/
            $.get('js/templates/searchPageTemplate.mst', function(patientDescriptionSecTemplate) {
                $.each(data, function(i, field) {
                    var patientDescriptionSecTemplateRendered = Mustache.render(patientDescriptionSecTemplate, {
                        imageSrc: field.imageSrc,
                        amountRaised: field.amountRaised,
                        amountNeeded: field.amountNeeded,
                        amountRemaining: field.amountRemaining,
                        percentageRaised: field.percentageRaised,
                        locations: field.locations,
                        timeLeft: field.timeLeft,
                        patientName: field.patientName
                    });
                    $('.searchResultsDisplaySec').append(patientDescriptionSecTemplateRendered);
                });
            });

        };
        var onFilterError = function(data) {

        };
        var data = {
            "categories": ["Life Threatening", "Livelihood At Risk"],
            "volunteer": "Open",
            "location": "Bangalore",
            "language": "English",
            "timeLeft": "0-5",
            "percentFunded": "0-100",
            "fundingStatus": "All"
        };
        data = JSON.stringify(data);
        callToDB('/rangde-api/rest/search', 'POST', data, onFilterSuccess, onFilterError);
    }
};