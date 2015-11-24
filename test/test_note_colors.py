from utils import trim, xml_to_printer_object, TestPrinter

header = '''
<score-partwise>
  <movement-title>Colored Notes</movement-title>
  <part-list>
    <score-part id="P1">
      <part-name>MusicXML Part</part-name>
    </score-part>
  </part-list>
  <part id="P1">
    <measure number="1">
      <attributes>
        <divisions>2</divisions>
        <key>
          <fifths>0</fifths>
          <mode>major</mode>
        </key>
        <time symbol="common">
          <beats>4</beats>
          <beat-type>4</beat-type>
        </time>
        <clef>
          <sign>G</sign>
          <line>2</line>
        </clef>
      </attributes>'''

note_header = '''
<note>
    <pitch>
        <step>G</step>
        <octave>4</octave>
    </pitch>
    <duration>2</duration>
    <voice>1</voice>
    <type>quarter</type>'''

note_footer = '''</note>'''

stem = lambda color, direction: \
    '''<stem color= "{color}" >{direction}</stem>'''.format(color=color,
                                                            direction=direction)

notehead = lambda color: \
    '''<notehead color= "{color}" >normal</notehead>'''.format(color=color)

footer = '''
    </measure>
  </part>
</score-partwise>'''

def test_notehead_color():
    score = ''.join([header,
                     note_header,
                     notehead('#FF0000'),
                     note_footer,
                     footer])
    printer = xml_to_printer_object(score)

    expected = r'''PartPOneVoiceOne = {
        \clef "treble" \key c \major \time 4/4
        \once \override NoteHead #'color = #(rgb-color 1.0 0.0 0.0) g'4}'''

    result = printer.score_dict['voices']
    assert trim(expected) == trim(result)

def test_stem_color_and_stem_direction():
    from musicxml2ly_conversion import conversion_settings
    conversion_settings.convert_stem_directions = True

    score = ''.join([header,
                     note_header,
                     stem(color='#FF0000', direction='down'),
                     note_footer,
                     footer])
    printer = xml_to_printer_object(score)

    expected = r'''PartPOneVoiceOne = {
        \clef "treble" \key c \major \time 4/4
        \stemDown
        \once \override Stem #'color = #(rgb-color 1.0 0.0 0.0) g'4 }'''

    result = printer.score_dict['voices']
    assert trim(expected) == trim(result)
