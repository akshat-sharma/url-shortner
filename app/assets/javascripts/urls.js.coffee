# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

//= require tmpl

class Url
  @initialize : ->
    @cacheJqueryElements()
    @bindEvents()

  @cacheJqueryElements : ->
    @form     = $('#urls-form')
    @urlsArea = $('#urls-area')

  @bindEvents : ->
    @form.on 'submit', (e) => @add(e)

  @add : (event) ->
    _this = this
    $.ajax({
      url      : _this.form.attr('action'),
      dataType : 'JSON',
      method   : 'POST',
      data     : _this.form.serialize()
    }).done (data) ->
      unless _this.urlsTable
        _this.urlsArea.append(window.tmpl('urlsTableTemplate', data))
        _this.urlsTable = $('#urlsTable')

      _this.urlsTable.append(window.tmpl('urlsRowTemplate', data))
      Message.flash('notice', ['Successfully created Url'])
    .fail (jqXHR)->
      errors = $.parseJSON(jqXHR.responseText).errors
      Message.flash('error', errors)

    return false

$ ->
  Url.initialize()