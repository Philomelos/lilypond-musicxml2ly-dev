from utils import trim, xml_to_printer_object, TestPrinter

score = '''
<score-partwise>
    <part-list>
        <score-part id="1"/>
    </part-list>
    <part id="1">
    <measure>
        <attributes>
            <divisions>16</divisions>
            <time>
                <beats>4</beats>
                <beat-type>4</beat-type>
            </time>
        </attributes>
        <note>
            <pitch>
                <step>C</step>
                <octave>4</octave>
            </pitch>
            <duration>8</duration>
            <beam>begin</beam>
        </note>
        <note>
            <pitch>
                <step>D</step>
                <octave>4</octave>
            </pitch>
            <duration>8</duration>
            <beam>end</beam>
            <notations>
                <articulations>
                    <breath-mark/>
                </articulations>
            </notations>
        </note>
    </measure>
</part>
</score-partwise>
'''

def test_breathing_sign():
    printer = xml_to_printer_object(score)
    expected = r'''PartOneVoiceNone = {\numericTimeSignature\time 4/4  c'8 [ d'8 ] \breathe }'''
    result = printer.score_dict['voices']

    assert trim(expected) == trim(result)
