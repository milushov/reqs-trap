$ ->
  urlParts = location.pathname.substr(1).split('/')

  if urlParts.length is 2 && urlParts[1] is 'requests'

    source = new EventSource("#{location.pathname}/stream")

    source.addEventListener 'results', (e) ->
      itemEl = $(e.data)
      itemEl.hide().prependTo('.requests-list').fadeIn(400)

    source.addEventListener 'finished', (e) ->
      source.close()
