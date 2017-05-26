 #!/bin/bash

while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -w|--workdir)
    WORKDIR="$2"
    shift # past argument 
    ;;
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done

WORKDIR="/probeurre-data/$WORKDIR/"

# send to parser
nodejs index.js "$WORKDIR/extracted.json" > "$WORKDIR/analyzed.json"
