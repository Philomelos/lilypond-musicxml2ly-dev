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

    now = time.strftime("_%Y_%d_%m_%H_%M_%S")
    log = open('logs/logfile' + now + '.txt', 'w')
    current_dir = os.path.dirname(os.path.realpath(__file__))
    musicxml2ly_path = os.path.abspath(
        os.path.join(current_dir, '..', 'musicxml2ly'))

    passed, failed = [], []

    os.chdir(current_dir)
    count = 0
    for filename in os.listdir('.'):
        basename, extension = os.path.splitext(filename)
        if extension == '.xml':
            process = subprocess.Popen([musicxml2ly_path,
                                        filename],
                                       stderr=subprocess.PIPE)
            return_code = process.wait()
            if return_code == 0:
                for line in process.stderr:
                    sys.stdout.write(line)
                passed.append(filename)
            else:
                for line in process.stderr:
                    sys.stdout.write(line)
                    log.write(line)
                failed.append(filename)

    print 'SUMMARY:'
    print 'passed:', len(passed)
    print 'failed:', len(failed)


if __name__ == '__main__':
    main()
