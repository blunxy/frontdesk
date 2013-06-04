$(document).ready(function() {
  $('input#search_term').typeahead( {
    name: 'current-attendees',
    prefetch: 'foos.json',
    template: [
      '<p style="font-weight: bold;">{{ name }}</p>',
      '<p class="boof">{{ value }}</p>'
    ].join(' '),
    engine: Hogan
  });
});
