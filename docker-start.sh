#!/bin/bash -l

python -m venv /venv
. /venv/bin/activate
#
# Set up environment variables
ENV=${ENV:-"dev"}
workers=${workers:-"5"}
port=8008

echo "Application instance launch on port $port."

chmod +x /workspace/Docker/download.sh
/workspace/Docker/download.sh
python -m nltk.downloader averaged_perceptron_tagger cmudict;

ENV=${ENV} uvicorn server_api:app --host=0.0.0.0 --app-dir=src --port=$port --workers=$workers
