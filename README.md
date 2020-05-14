# POC_UsingRFWithTaurus

In order to run this, you'll need to download the bzt package. It's also inside the requirements.txt file within this repo.

pip install bzt

Once you have that install make sure you also have the robotframework and robotframework-seleniumlibrary installed. 

Once everything is set up, in the terminal run:

bzt robot.yml

This will run the settings in the .yml file. It is programmed to run the application 5 times. It will also create a folder 
called the Results folder containing subfolders with the date and a Run folder containing the time when it was run. 

Conclusion from this experimentation: 

- Seems to only be useful if doing load testing if using in conjuction with Robot Framework. My original goal was to 
try to create multiple runs with each consective run giving details about what passed and what failed. However, on each
run, only 1 report is generated (the last report). If something fails in between, then the report will not be able to
give much insight. 


As an alternative, I'm creating a recipe for running keywords several times under the blazetest.robot file. I will add in a
fail condition argument if a certain number of failures occur in future.
