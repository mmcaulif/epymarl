MAPPO-distil Introduction
------------


To do list
------------
* Create specific config files for comparison for the thesis
* Create documentation for the config files and their differences
* Rename PPG learner and config file 
* Create new policy network to be used in the new algorithm, MAPPO-distil
* Continue updating readme
* Create script to graph results sections
* compare learning rates: 0.0003 vs 0.0005 , can act as first proper experiment
* compare target update rates: 100 vs 0 vs 0.01
* test 2m_vs_1z traintime and hp's
* create script for running training several times
* decide on a fixed length for training, mayb 500k (roughly 45 minutes)

Tests
------------
* 1 Start to decouple policy and value into individual epochs by first separating advantage calculation and value loss function
    - Results prove no negative effect on performance

* 2 Continue from above, now create separate epochs, policy epoch first and then value epoch 

* 3 Try different values for v_epochs


Done
------------


Objectives
------------

Layout
------------
Learner/algorithm is in thesis_learner.py, this will be where most of the coding is done

Config files are in config section and will only be created/used at the start, ideally don't tweak once you have something that works. Should try document each parameter better though as still confused slightly.

Usage
------------

For the algorithm being implemented in this thesis: 
`python3 src/main.py --config=thesis/th_mappo_distil  --env-config=sc2 with env_args.map_name=3m ` or ` with env_args.map_name=2m_vs_1z `

For the MAPPO_ns (closest algorithm we will be comparing to): 
`python3 src/main.py --config=thesis/th_mappo_ns  --env-config=sc2 with env_args.map_name=3m ` or ` with env_args.map_name=2m_vs_1z `

3 marine map takes ~30 minutes to reach +90% winrate, need to test 2m_vs_1z traintime

I've create an easier map (solves in ~5 mins with decided on hp's) of 2 friendly marines vs a single enemy marine, can be used by including: `  with env_args.map_name=2m_vs_1m `

To view tensorboard:
`tensorboard --logdir="results/tb_logs/"`
and go to: http://localhost:6006

Results
------------
to be completed

[Current hyperparams](src/config/algs/thesis/th_mappo_distil_a.yaml)