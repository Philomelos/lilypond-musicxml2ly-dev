from utils import trim, xml_to_printer_object, TestPrinter

# direction_font-size.xml

header = '''
<score-partwise version="2.0">
  <part-list>
    <score-part id="P1">
      <part-name></part-name>
    </score-part>
  </part-list>
  <part id="P1">
    <measure number="1">
      <attributes>
        <divisions>1</divisions>
      </attributes>
'''

direction = lambda fontsize, fontstyle: \
'''
      <direction placement="above">
        <direction-type>
          <words font-family="CenturySchL" font-size="{fontsize}" font-weight="normal" font-style="{fontstyle}" relative-x="7.81" default-y="5.34">D.S. al Coda</words>
        </direction-type>
        <offset>-6720.00</offset>
        <sound dalsegno="0"/>
      </direction>
'''.format(fontsize=fontsize, fontstyle=fontstyle)

footer = '''
      <note>
        <pitch>
          <step>C</step><octave>4</octave>
        </pitch>
        <duration>4</duration>
        <voice>1</voice>
        <type>whole</type>
      </note>
    </measure>
 </part>
</score-partwise>
'''

class TestFontSize:

    def font_size_test(self, fontsize, cmd):
        from string import Template
        xml = header + direction(fontsize=fontsize, fontstyle='italic') + footer
        printer = xml_to_printer_object(xml)
        expected = Template(r'''PartPOneVoiceOne = {| % 1 c'1
            -\markup { $cmd \italic {D.S. al Coda} } }''').substitute(cmd=cmd)
        result = printer.score_dict['voices']
        assert trim(expected) == trim(result)

    def test_teeny_font_size_words(self):
        self.font_size_test('xx-small', r'\teeny')

    def test_huge_font_size_words(self):
        self.font_size_test('x-large', r'\huge')

    def test_teeny_font_size_with_number(self):
        self.font_size_test("7.8", r'\teeny')

    def test_tiny_font_size_with_number(self):
        self.font_size_test("8", r'\tiny')

    def test_small_font_size_with_number(self):
        self.font_size_test("11", r'\small')

    def test_default_font_size_with_number(self):
        self.font_size_test("12", r'')

    def test_large_font_size_with_number(self):
        self.font_size_test("18.9", r'\large')

    def test_huge_font_size_with_number(self):
        self.font_size_test("32", r'\huge')

    def test_extremely_large_font_size_with_number(self):
        self.font_size_test("32000", r'\huge')
