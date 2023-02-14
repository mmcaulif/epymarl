MAPPO-distil Introduction
------------


To do list
------------
* Create specific config files for comparison for the thesis
* Create documentation for the config files and their differences
* Rename PPG learner and config file 
* Create new policy network to be used in the new algorithm, MAPPO-distil
* Continue updating readme

Objectives
------------

Layout
------------
Learner/algorithm is in ppg_learner.py, this will be where most of the coding is done

Config files are in config section and will only be created/used at the start. Should try document each parameter better though as still confused slightly.

Usage
------------

For the algorithm being implemented in this thesis: 
`python3 src/main.py --config=mappg  --env-config=sc2 with env_args.map_name=3m ` or ` with env_args.map_name=2m_vs_1z `

For the MAPPO_ns (closest algorithm we will be comparing to): 
`python3 src/main.py --config=mappo_ns  --env-config=sc2 with env_args.map_name=3m ` or ` with env_args.map_name=2m_vs_1z `

I've create an easier map (solves in ~5 mins with decided on hp's) of 2 friendly marines vs a single enemy marine, can be used by including: `  with env_args.map_name=2m_vs_1m `

