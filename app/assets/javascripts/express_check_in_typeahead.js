$(document).ready(function() {
  $('input#search_term').typeahead( {
    name: 'current-attendees',
    prefetch: 'prefetch.json',
    template: [
      '<p style="font-weight: bold;">{{ value }}</p>',
      '<p class="boof">{{ email }}</p>'
    ].join(' '),
    engine: Hogan
  });
});
