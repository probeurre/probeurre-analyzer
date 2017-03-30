import json
import re
from pprint import pprint

# TODO : get arg instead of sample file
with open('sample.json', encoding='utf-8') as data_file:
    json_data = json.loads(data_file.read())

def extractContent(dict):
    # "line start" OR "any separator" ... _todo_ .. "line end" or "any separator"
    reg = re.compile("(^|[\s,.])todo([\s,.]|$)", re.IGNORECASE)
    nbTodo = 0
    for fileName in dict:
        for line in dict[fileName]:
            if reg.search(dict[fileName][line]["content"]):
                print("Found a todo >>", dict[fileName][line]["content"])
                nbTodo+=1
    return nbTodo

result = extractContent(json_data)
print("total number of todo : ", result)