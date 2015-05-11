from utils import trim, xml_to_printer_object, TestPrinter

# cf. direction_font-size.xml

score = lambda work_number, work_title: \
'''
<score-partwise version="2.0">
  <work>
    <work-number> {work_number} </work-number>
    <work-title> {work_title} </work-title>
  </work>
  <part-list>
    <score-part id="P1">
      <part-name></part-name>
    </score-part>
  </part-list>
  <part id="P1">
    <measure number="1">
      <note>
        <pitch>
          <step>C</step><octave>5</octave>
        </pitch>
        <duration>4</duration>
        <voice>1</voice>
        <type>whole</type>
      </note>
    </measure>
  </part>
</score-partwise>
'''.format(work_number=work_number, work_title=work_title)


def test_work_number_and_work_title():

    xml = score(work_number="Op. 42",
                work_title="Work")
    printer = xml_to_printer_object(xml)
    expected = r'\header {opus = "Op. 42" title = "Work"}'
    result = printer.score_dict['header']

    assert trim(expected) == trim(result)

        


