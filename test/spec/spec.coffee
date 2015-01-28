describe 'Textarea', ->
  $inputor = null

  beforeEach ->
    html = '<textarea id="inputor" name="textarea" rows="8" cols="40">Stay Foolish, Stay Hungry. @Jobs</textarea>'
    fixture = setFixtures(html)
    $inputor = fixture.find('#inputor')

  it 'Set and get caret pos by given data', ->
    inputor = $inputor.get(0)
    caret = new Caret(inputor)
    caret.setPos({start: 5, end: 12})
    expect(caret.getPos().start).toBe 5
    expect(caret.getPos().end).toBe 12
    expect(caret.getPos().text).toBe 'Foolish'

  it 'Inert text at pos', ->
    inputor = $inputor.get(0)
    caret = new Caret(inputor)
    caret.setPos({start: 5, end: 12})
    caret.insert({start: 5, end: 12}, 'Smart')
    expect(caret.getPos().start).toBe 10
    expect(caret.getPos().end).toBe 10
    expect(caret.getPos().text).toBe ''
    expect($inputor.val()).toBe 'Stay Smart, Stay Hungry. @Jobs'

describe 'Input', ->
  $inputor = null

  beforeEach ->
    html = '<input id="inputor" name="input" value="Stay Foolish, Stay Hungry. @Jobs">'
    fixture = setFixtures(html)
    $inputor = fixture.find('#inputor')

  it 'Set and get caret pos by given data', ->
    inputor = $inputor.get(0)
    caret = new Caret(inputor)
    caret.setPos({start: 5, end: 12})
    expect(caret.getPos().start).toBe 5
    expect(caret.getPos().end).toBe 12
    expect(caret.getPos().text).toBe 'Foolish'

  it 'Inert text at pos', ->
    inputor = $inputor.get(0)
    caret = new Caret(inputor)
    caret.setPos({start: 5, end: 12})
    caret.insert({start: 5, end: 12}, 'Smart')
    expect(caret.getPos().start).toBe 10
    expect(caret.getPos().end).toBe 10
    expect(caret.getPos().text).toBe ''
    expect($inputor.val()).toBe 'Stay Smart, Stay Hungry. @Jobs'
