from utils import trim, xml_to_printer_object, TestPrinter

import sys
sys.setdefaultencoding("utf-8")

score = lambda rights: r'''
<score-partwise>
  <identification>

    {rights}

  </identification>
  <part-list>
    <score-part id="P1">
      <part-name>MusicXML Part</part-name>
    </score-part>
  </part-list>
  <part id="P1">
    <measure number="1">
      <note>
        <rest/>
        <duration>4</duration>
        <voice>1</voice>
        <type>whole</type>
      </note>
      <barline location="right">
        <bar-style>light-heavy</bar-style>
      </barline>
    </measure>
  </part>
</score-partwise>
'''.format(rights=rights)


class TestIdentificationRightsTag:

    def test_rights_without_attributes(self):
        rights = r'''<rights>Copyright by X.Y.</rights>'''
        xml = score(rights)
        printer = xml_to_printer_object(xml)
        expected = r'''\header {copyright = "Copyright by X.Y." }'''
        result = printer.score_dict['header']
        assert trim(expected) == trim(result)

    def test_rights_with_attributes(self):
        rights = r'''<rights type="arrangement">X.Y.</rights>'''
        xml = score(rights)
        printer = xml_to_printer_object(xml)
        expected = r'''\header {copyright = "Arrangement: X.Y." }'''
        result = printer.score_dict['header']
        assert trim(expected) == trim(result)



