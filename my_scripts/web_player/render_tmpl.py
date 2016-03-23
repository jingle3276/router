import argparse
import os
import time
from Cheetah.Template import Template


SRC_DIR = "/mnt/storage/public/podcasts/downloads/"
TEMP_FILE =  "/opt/my_scripts/web_player/player.tmpl"
OUT_DIR = "/podcasts/downloads/"
OUT_FILE_NAME = "/mnt/storage/public/player.html"


def sorted_dirs(path):
    only_dirs = [item for item in os.listdir(path) if os.path.isdir(path + item)]
    return sorted(only_dirs, reverse=True)


def _get_files():
    out = []
    for d in sorted_dirs(SRC_DIR):
        files = []
        for f in os.listdir(SRC_DIR + d):
            if f.endswith(".mp3"):
                public_path = os.path.join(OUT_DIR, d, f) 
                f_dict = {
                    "path": public_path,
                    "name": f,
                    "date": d
                }
                files.append(f_dict)
        if files:
            out.append((d, files))
    return out


def main():
    name_space = {
        'files': _get_files()[:7]
    }
    temp = Template(file=TEMP_FILE, searchList=[name_space]) 
    write_to_file(str(temp))


def write_to_file(content):
    with open(OUT_FILE_NAME, 'w') as f:
        f.write(content)


if __name__ == '__main__':
    import sys
    sys.exit(main())
