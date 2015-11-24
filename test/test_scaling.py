from __future__ import division
from utils import trim, xml_to_printer_object, TestPrinter

score = lambda millimeters, tenths, page_height, page_width: r'''
<score-partwise version="2.0">

  <defaults>
    <scaling>
      <millimeters> {millimeters} </millimeters>
      <tenths> {tenths} </tenths>
    </scaling>
    <page-layout>
      <page-height> {page_height} </page-height>
      <page-width> {page_width} </page-width>
    </page-layout>
  </defaults>

  <part-list>
    <score-part id="P1">
      <part-name>Music</part-name>
    </score-part>
  </part-list>
  <part id="P1">
    <measure number="1">
      <attributes>
        <divisions>1</divisions>
        <key>
          <fifths>0</fifths>
        </key>
        <time>
          <beats>4</beats>
          <beat-type>4</beat-type>
        </time>
        <clef>
          <sign>G</sign>
          <line>2</line>
        </clef>
      </attributes>
      <note>
        <pitch>
          <step>C</step>
          <octave>4</octave>
        </pitch>
        <duration>4</duration>
        <type>whole</type>
      </note>
      <direction>
        <direction-type>
          <words font-size="15">Example text...</words>
        </direction-type>
        <voice>1</voice>
        <staff>1</staff>
      </direction>
    </measure>
  </part>
</score-partwise>
'''.format(millimeters=millimeters, tenths=tenths,
           page_height=page_height, page_width=page_width)

class TestScaling:

    A4 = (210, 297)
    A3 = (297, 420)

    def scaling_test(self, millimeters, tenths, page_format):
        page_width, page_height = [x * (tenths / millimeters) for x in page_format]
        xml = score(millimeters=millimeters,
                    tenths=tenths,
                    page_height=page_height,
                    page_width=page_width)
        printer = xml_to_printer_object(xml)
        result = printer.score_dict['paper']
        return result

    def test_default_font_size_A4(self):
        result = self.scaling_test(
            millimeters=7, tenths=40, page_format=self.A4)
        expected = r'''
            #(set-global-staff-size 20.0)
                \paper {
                paper-width = 21.0\cm
                paper-height = 29.7\cm
                indent = 0.958333333333\cm
                }'''
        assert trim(expected) == trim(result)

    def test_default_font_size_A3(self):
        result = self.scaling_test(
            millimeters=7, tenths=40, page_format=self.A3)
        expected = r'''
            #(set-global-staff-size 20.0)
                \paper {
                paper-width = 29.7\cm
                paper-height = 42.0\cm
                indent = 1.32083333333\cm
                }'''
        assert trim(expected) == trim(result)

    def test_keep_paper_size_proportions(self):
        # This seems obvious, but musicxml2ly used to behave in a very weird way
        # when changing the millimeters/tenth-ratio from e.g. 7/40 to 7000/40000
        result = self.scaling_test(
            millimeters=7000, tenths=40000, page_format=self.A3)
        expected = r'''
            #(set-global-staff-size 20.0)
                \paper {
                paper-width = 29.7\cm
                paper-height = 42.0\cm
                indent = 1.32083333333\cm
                }'''
        assert trim(expected) == trim(result)
