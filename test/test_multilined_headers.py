from utils import trim, xml_to_printer_object, TestPrinter

score = '''
<score-partwise>
    <identification>
      <creator type="composer">John Francis Wade (1711-1786)</creator>
      <creator type="lyricist">German: Friedrich Heinrich Ranke (1798-1876) 
Latin: John Francis Wade (1711-1786)</creator>
    </identification>
    <part-list>
        <score-part id="P1">
            <part-name></part-name>
        </score-part>
    </part-list>
    <part id="P1">
        <measure number="1">
            <note>
                <pitch>
                    <step>C</step>
                    <octave>5</octave>
                </pitch>
                <duration>4</duration>
                <voice>1</voice>
                <type>whole</type>
            </note>
        </measure>
 </part>
</score-partwise>'''


def test_multilined_headers():
    printer = xml_to_printer_object(score)

    expected = r'''
    \header {
     poet = \markup \column {
         \line { "German: Friedrich Heinrich Ranke (1798-1876) "}
         \line { "Latin: John Francis Wade (1711-1786)"} }
    composer = "John Francis Wade (1711-1786)"}'''

    result = printer.score_dict['header']
    assert trim(expected) == trim(result)
