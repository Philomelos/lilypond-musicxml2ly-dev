import os
import sys
import subprocess
import time

def main():
    '''
    Simple script for logging error messages generated when
    running musicxml2ly on all testfiles in MusicXML-TestSuite.
    The result is collected in logs/logfile.txt. Can
    be used to compare different versions or check if changes to the
    code produce unexpected result.
    Example:

    `find . -name 'logs/logfile*' | sort -nr | head -2 | xargs diff `

    -- will show what has changed between this and the previous run.

    '''

    # output_dir = './temp/'
    output_dir = '/Users/pls/Dropbox/Philomelos/OpenMusicScore/temp/'
        # files_dir = '/Users/fredrik/programming/musicxml/musicxml2ly-dev/MusicXML-TestSuite/'
    # files_dir = '/Users/fredrik/Dropbox/Philomelos/musicxml_com-reference-samples/'
    # files_dir = '/Users/fredrik/Dropbox/Philomelos/philomelos-scores/'
    # files_dir = '/Users/fredrik/Dropbox/Philomelos/OpenMusicScore/'
    files_dir = '/Users/pls/Dropbox/Philomelos/OpenMusicScore/'
    passed, failed = [], []

    os.chdir(output_dir)
    now = time.strftime("_%Y_%m_%d_%H_%M_%S")
    # with open('./logs/logfile' + now + '.txt', 'w') as log:
    with open('/Users/pls/Dropbox/Philomelos/OpenMusicScore/logs/logfile' + now + '.txt', 'w') as log:
        for fn in os.listdir(files_dir):
            try:
                basename, extension = os.path.splitext(fn)
                if extension == '.xml':
                    filename = files_dir + fn
                    xml_to_ly = subprocess.Popen(['x2l', filename],
                                                 stderr=subprocess.PIPE)
                    xml_to_ly_data = xml_to_ly.communicate()
                    fn = basename + '.ly'
                    ly_to_pdf = subprocess.Popen(['lilypond', basename],
                                                stderr=subprocess.PIPE)
                    ly_to_pdf_data = ly_to_pdf.communicate()
                    passed.append(filename)
                    if not xml_to_ly.returncode == 0 or not ly_to_pdf.returncode == 0:
                        log.write('\n')
                        log.write('****************************************************')
                        log.write('\n')
                        log.write('FAILURE')
                        log.write('\n')
                        log.write('****************************************************')
                        log.write('\n')
                    else:
                        log.write('\n')
                        log.write('----------------------------------------------------')
                        log.write('\n')
                    log.write(filename)
                    log.write('\n')
                    for line in xml_to_ly_data[1]:
                        sys.stdout.write(line)
                        log.write(line)
                    for line in ly_to_pdf_data[1]:
                        sys.stdout.write(line)
                        log.write(line)
                    failed.append(filename)
                    log.write('\n')
            except KeyboardInterrupt:
                break

if __name__ == '__main__':
    main()
