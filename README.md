# Rasa NLU for botpress


  
sudo  docker run -it  --name rasa-botpress -v "$PWD":/usr/src/myapp  -p 5000:5000  tornabene/docker-rasa-botpress  python3  -m rasa_nlu.server -c nlu_config.yml  --verbose   --path ./models




Looked through the [Rasa NLU documentation](http://rasa.com/docs/nlu/) and ready to build your first intelligent assistant? We have some resources to help you get started! This repository contains the foundations of your first custom assistant.

 
We would recommend downloading this before getting started, although the tutorial will also work with just the data in this repo. 

The initial version of this starter-pack lets you build a basic Rasa NLU model capable of understanding few simple intents and entities. 


After you clone the repository, a directory    will be downloaded to your local machine. It contains all the files of this repo and you should refer to this directory as your 'project directory'.


## Setup and installation

If you haven’t installed Rasa NLU yet, you can do it by navigating to the project directory and running:
```
pip install -r requirements.txt
```

You also need to install a spaCy Italian language model. You can install it by running:

```
python -m spacy download it
```


## What’s in this starter-pack?

This starter-pack contains some training data and the main files which you can use as the basis of your first custom assistant. It also has the usual file structure of the assistant built with Rasa Stack. This starter-pack consists of the following files:

- **data/nlu_data.json** file contains the training examples of five simple intents:
	- greet
	- goodbye
	- thanks
	- affirm
	- name (examples of this intent contain an entity called name)
	
- **nlu_cofing.yml** file contains the configuration of the Rasa NLU training pipeline:
```text
language: "it"

pipeline: spacy_sklearn
```	

## How to use it?
Even though this starter-pack have only five and quite generic intents, you can train the Rasa NLU model by running:  
```make train-nlu```  
This will train the NLU model and store it inside the `/models/current/nlu` folder of your project directory.

To test the model, you can run it as a server using the following command which will start the server using port 5000:  
```make run-nlu```  

To get the results of the model, you can pass an input message by making a request:  
```curl XPOST localhost:5000/parse -d '{"query":"Hello", "project": "current"}'```  

## What's next?
Five intents and one entity are definitely not enough to build an awesome assistant so here are some ideas for what you can do to take this project to the next level:
 This dataset contains quite a few interesting intents which will enable your assistant to handle small talk. To use it, append the training examples to `data/nlu_data.md` file, retrain the NLU model and see how your assistant learns new skills.
- Enrich the `data/nlu_data.md` file with the intents you would like your bot to understand. Retrain the NLU model using the command above and see you assistant improving with every run!


##Botpress
On botpress dir edit this config file:
>
vi config/nlu.json
	{
	  "intentsDir": "./generated/intents",
 	 "entitiesDir": "./generated/entities",	
 	 "provider": "native",
	 "debugModeEnabled": true,
 	 "minimumConfidence": "0.3",
 	 "nativeAdjustementThreshold": "0.25"

	} 
	  

##Make sure to let us know how you are getting on and what have you built. Visit [Rasa Consulting](http://jointech.io) and share your experience .

###[http://jointech.io](http://jointech.io)
