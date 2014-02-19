import os
import subprocess

def main():
    current_dir = os.path.dirname(os.path.realpath(__file__))
    musicxml2ly_path = os.path.abspath(
        os.path.join(current_dir, '..', 'musicxml2ly'))

    passed, failed = [], []

    os.chdir(current_dir)
    for filename in os.listdir('.'):
        basename, extension = os.path.splitext(filename)
        if extension == '.xml':
            process = subprocess.Popen([musicxml2ly_path,
                                        filename])
            return_code = process.wait()
            if return_code == 0:
                passed.append(filename)
            else:
                failed.append(filename)

    print 'FAILURES:'
    for fail in failed:
        print fail
    print 'SUMMARY:'
    print 'passed:', len(passed)
    print 'failed:', len(failed)


if __name__ == '__main__':
    main()

