# -*- coding: utf-8 -*-
import re
import string

def string_to_number(s):
    try:
        return int(s)
    except ValueError:
        return float(s)

def string_to_integer(s):
    num = string_to_number(s)
    if isinstance(num, int):
        return num
    else:
        return int(num)
        
def escape_ly_output_string (input_string):
    return_string = input_string
    needs_quotes = not re.match (u"^[a-zA-ZäöüÜÄÖßñ]*$", return_string);
    if needs_quotes:
        return_string = "\"" + string.replace (return_string, "\"", "\\\"") + "\""
    return return_string

def interpret_alter_element (alter_elm):
    alter = 0
    if alter_elm:
        val = eval(alter_elm.get_text ())
        if type (val) in (int, float):
            alter = val
    return alter

def musicxml_duration_to_log (dur):
    return  {'256th': 8,
             '128th': 7,
             '64th': 6,
             '32nd': 5,
             '16th': 4,
             'eighth': 3, 
             'quarter': 2,
             'half': 1,
             'whole': 0,
             'breve':-1,
             'longa':-2,
             'long':-2}.get (dur, 0)

def hexcolorval_to_nr (hex_val):
    try:
        v = int (hex_val, 16)
        if v == 255:
            v = 256
        return v / 256.
    except ValueError:
        return 0.

def hex_to_color(hex_val):
    res = re.match (
        r'#([0-9a-f][0-9a-f]|)([0-9a-f][0-9a-f])([0-9a-f][0-9a-f])([0-9a-f][0-9a-f])$',
        hex_val,
        re.IGNORECASE)
    if res:
        return map(lambda x: hexcolorval_to_nr (x), res.group (2, 3, 4))
    else:
        return None
