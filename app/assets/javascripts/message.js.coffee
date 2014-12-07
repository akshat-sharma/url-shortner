exports = this;
class Message
  @flash : (type, messages, targetDiv) ->
    @create(type, messages, targetDiv)
    @remove(targetDiv)

  @create: (type, messages, targetDiv) ->
    targetDiv = targetDiv || $('.flash')
    data =
      type     : type,
      messages : messages

    targetDiv.html(window.tmpl('flashMessagesTemplate', data))

  @remove: (sourceDiv) ->
    setTimeout ->
      sourceDiv = sourceDiv || $('.flash')
      sourceDiv.html('');
    , 5000

exports.Message = Message