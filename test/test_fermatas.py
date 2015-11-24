from utils import trim, xml_to_printer_object, TestPrinter

class TestFermata:

    header = \
    '''<score-partwise version="2.0">
    <part-list>
        <score-part id="P1">
          <part-name></part-name>
        </score-part>
      </part-list>
    <part id="P1">'''

    footer = \
    '''</part>
    </score-partwise>'''

    part = \
    '''<measure number="1">
      <note>
        <pitch>
          <step>A</step><octave>4</octave>
        </pitch>
        <duration>4</duration>
        <voice>1</voice>
        <type>whole</type>
        <notations>
          <fermata type="angled"></fermata>
        </notations>
      </note>
    </measure>'''

    xml = header + part + footer

    def test_type_attribute(self):
        printer = xml_to_printer_object(self.xml)

        expected = r'''PartPOneVoiceOne = {a'1\shortfermata }'''
        result = printer.score_dict['voices']

        assert trim(expected) == trim(result)
