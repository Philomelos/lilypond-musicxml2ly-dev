import string

import musicexp
import musicxml
import musicxml2ly_conversion


class TestPrinter(musicexp.Output_printer):
    def __init__(self):
        super(TestPrinter, self).__init__()
        self.score_dict = {}
        self.current_section = None

    def newline(self):
        self.temp += (self._line + '\n')
        self._line = ' ' * self._indent * self._nesting
        self.skipspace = True

    def set_current(self, name):
        if self.current_section:
            self.score_dict[self.current_section] = self.temp
        self.temp = ''
        self.current_section = name

def trim(s):
    return s.translate(None, string.whitespace)

def xml_to_printer_object(string):
    from lxml import etree
    global layout_information

    tree = etree.fromstring(string)
    tree = musicxml.lxml_demarshal_node(tree)

    score_information = musicxml2ly_conversion.extract_score_information (tree)
    paper_information = musicxml2ly_conversion.extract_paper_information (tree)
    layout_information = musicxml2ly_conversion.layout_information

    parts = tree.get_typed_children (musicxml.Part)
    (voices, staff_info) = musicxml2ly_conversion.get_all_voices (parts)

    score = None
    mxl_pl = tree.get_maybe_exist_typed_child (musicxml.Part_list)
    if mxl_pl:
        score = musicxml2ly_conversion.extract_score_structure (mxl_pl, staff_info)
        part_list = mxl_pl.get_named_children ("score-part")

    musicxml2ly_conversion.update_score_setup (score, part_list, voices, parts)
    musicxml2ly_conversion.update_layout_information ()

    printer = TestPrinter()

    printer.set_current('header')
    musicxml2ly_conversion.print_ly_additional_definitions (printer)
    if score_information:
        score_information.print_ly (printer)

    printer.set_current('paper')
    if paper_information and conversion_settings.convert_page_layout:
        paper_information.print_ly (printer)

    printer.set_current('layout')
    if layout_information:
        layout_information.print_ly (printer)

    printer.set_current('voices')
    musicxml2ly_conversion.print_voice_definitions (printer, part_list, voices)

    printer.set_current('')
    printer.newline ()
    printer.dump ("% The score definition")
    printer.newline ()
    score.print_ly (printer)
    printer.newline ()

    return printer
