.PHONY: clean train-nlu train-core cmdline server

TEST_PATH=./

help:
	@echo "    clean"
	@echo "        Remove python artifacts and build artifacts."
	@echo "    train-nlu"
	@echo "        Trains a new nlu model using the projects Rasa NLU config"
	@echo "    run-nlu"
	@echo "        Runs a trained nlu model as a server"


clean:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f  {} +
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info
	rm -rf docs/_build


train-nlu:
	python3   -m rasa_nlu.train -c nlu_config.yml --data data/nlu_data.md -o models    --project default --verbose  
run-nlu:
	python3  -m rasa_nlu.server -c nlu_config.yml  --project default --verbose   --path ./models
train-core:
	python3 -m rasa_core.train -d data/domain.yml -s data/stories.md -o models/dialogue
	python3 -m rasa_nlu.train -c nlu_config.yml --data data/nlu_data.md  -o models --fixed_model_name nlu --project default --verbose
run-core:
	python3  -m rasa_core.run -d models/dialogue -u models/default/nlu
# run-socket:
# 	python3 -m rasa_core.run -d models/dialogue -u models/default/model_20181112-154255 --port 5002 --credentials credentials.yml
run-nlu-botpress:
	python3  -m rasa_nlu.server -c nlu_config.yml  --verbose   --path ./models