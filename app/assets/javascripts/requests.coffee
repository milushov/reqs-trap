$ ->
  urlParts = location.pathname.substr(1).split('/')

  if urlParts.length is 2 && urlParts[1] is 'requests'

    source = new EventSource("#{location.pathname}/stream")

    source.addEventListener 'results', (e) ->
      console.log 'Received a message:', e.data
      item = $.parseJSON(e.data)
      itemEl = $("<div class='well'>#{item.id}</div>")
      itemEl.hide().prependTo('.requests-list').fadeIn('slow')

    source.addEventListener 'finished', (e) ->
      console.log 'Close:', e.data
      source.close()
