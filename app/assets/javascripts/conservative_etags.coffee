class ConservativeEtags
  @_checked: () ->
    @_lastPageChecked == location.href

  @_lastPageChecked = null
  @_tokenKey: () ->
    'csrf_token_' + location.href

  @_old = false

  @_checkPage: ->
    unless @_checked()
      window.new_csrf_token = $('meta[name=csrf-token]').attr('content')
      window.old_csrf_token = sessionStorage.getItem(@_tokenKey())
      if new_csrf_token == old_csrf_token
        @_old = true
      else
        @_old = false

      sessionStorage.setItem(@_tokenKey(), new_csrf_token)


  @pageIsOld: ->
    @_checkPage()
    @_old

window.ConservativeEtags = ConservativeEtags
