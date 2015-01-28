class Caret
  constructor: (inputor) ->
    @inputor = inputor

  getPos: ->
    @inputor.focus();

    if document.selection
      this.getIEPos()
    else
      ret = {};
      ret.start = @inputor.selectionStart
      ret.end   = @inputor.selectionEnd
      ret.text  = @inputor.value.substring(ret.start, ret.end)
      ret

  getIEPos: ->
    ret     = {};
    inputor = @inputor
    range   = document.selection.createRange();

    if inputor.tagName.toLowerCase() is 'input'
      inputTextRange = inputor.createTextRange();
      inputTextRange.collapse(true);
      inputTextRange.select();
      dupRange = document.selection.createRange();
      dupRange.setEndPoint('EndToEnd', range);

      ret.start = dupRange.text.length - range.text.length;
      ret.end   = dupRange.text.length;
      ret.text  = range.text;

      range.select();
    else if inputor.tagName.toLowerCase() is 'textarea'
      textRange = document.body.createTextRange();
      textRange.moveToElementText(inputor);
      ret.text  = range.text;

      i = 0
      while textRange.compareEndPoints("StartToStart", range) < 0 and range.moveStart("character", -1) isnt 0
        i++  if inputor.value.charAt(i) is "\r"
        i++

      ret.start = i
      ret.end   = ret.text.length + i

    ret

  setPos: (pos)->
    inputor = @inputor
    inputor.focus()

    if inputor.createTextRange
      inputTextRange = inputor.createTextRange();
      inputTextRange.collapse(true);
      inputTextRange.moveStart('character', pos.start);
      inputTextRange.moveEnd('character', pos.end - pos.start);
      inputTextRange.select();
    else
      inputor.setSelectionRange(pos.start, pos.end);

    inputor

  insert: (pos, text)->
    inputor = @inputor
    inputor.focus()
    this.setPos(pos)

    if document.selection
      range = document.selection.createRange()
      range.text = text
      range.setEndPoint('StartToEnd', range)
      range.select()
    else
      oValue = inputor.value
      nValue = oValue.substring(0, pos.start) + text + oValue.substring(pos.end)
      nStart = nEnd = parseInt(pos.start, 10) + text.length
      inputor.value = nValue
      inputor.setSelectionRange(nStart, nEnd)

    inputor
