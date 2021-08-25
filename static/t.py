data = None
with open('1984.txt', 'r') as f:
    data = f.read()

chapters = []
thischapter = []
for line in data.split('\n'):

    if line.startswith('Chapter'):
        chapters.append('\n'.join(thischapter))
        thischapter = []
    else:
        thischapter.append(line)

chapters.append('\n'.join(thischapter))

import json
with open('cleaned.txt', 'w') as f:
    f.write(json.dumps(chapters))
