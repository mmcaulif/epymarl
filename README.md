MAPPO-distil Introduction
------------

Diary
------------
* 2nd march: Implemented dna-ppo like distillation, decoupled epochs for policy/value/auxiliiary and huber loss. initial tests show good improvement with considerably stabler learning, this in turn allows for a higher learning rate of 0.0005 as opposed to the previously tuned 0.0003. Next tasks are below in to-do and notion list. Additionally, no-longer using CUDA has resulted in a wall-clock time of 75% of what it otherwise would be. After experiments are done, next move would be consider implementing GAE.

Demo list
------------
* Have graphs comparing 3 runs of mappo_distil vs mappo_ns on both 3m and 2s_vs_1sc, maybe try one other map 

To do list
------------
* Continue updating readme
* Create control mappo and mappo_ns config file for comparisons sake
* See if value or policy epochs can be reduced significantly now that the aux epochs have been introduced
* Double check value dimensions in aux epoch as using n_agents number of v_pi but 1 v_value
* Work more on 2s_vs_1sc, faster but more challenging environment, idk if LR=5e-4 is suitable though as learning collapses frequently
* Try different beta value's, MAPPO official repo uses 0.01
* You have good hyperparams now, try min/max stability and move onto other env's

Tests
------------
* 1 Start to decouple policy and value into individual epochs by first separating advantage calculation and value loss function
    - Results prove no negative effect on performance
* 2 Continue from above, now create separate epochs, policy epoch first and then value epoch 
* 3 Try different values for v_epochs

Done
------------
* decide on a fixed length for training, mayb 500k (roughly 45 minutes)
* Create script to graph results sections
* compare learning rates: 0.0003 vs 0.0005 , can act as first proper experiment
* Create specific config files for comparison for the thesis
* Create documentation for the config files and their differences
* Rename PPG learner and config file 
* Create new policy network to be used in the new algorithm, MAPPO-distil
* compare target update rates: 100 vs 0 vs 0.01
* test 2m_vs_1z traintime and hp's
* create script for running training several times
* Double check return/reward normalisation used: only reward norm

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

[Current hyperparams](src/config/algs/thesis/th_mappo_distil_debug.yaml)


Scenarios
------------

Name            Agents  Enemies Limit  
2m_vs_1m        2       1       60     
3m              3       3       60     
8m              8       8       120    
25m             25      25      150    
5m_vs_6m        5       6       70     
8m_vs_9m        8       9       120    
10m_vs_11m      10      11      150    
27m_vs_30m      27      30      180    
MMM             10      10      150    
MMM2            10      12      180    
2s3z            5       5       120    
3s5z            8       8       150    
3s5z_vs_3s6z    8       9       170    
3s_vs_3z        3       3       150    
3s_vs_4z        3       4       200    
3s_vs_5z        3       5       250    
1c3s5z          9       9       180    
2m_vs_1z        2       1       150    
corridor        6       24      400    
6h_vs_8z        6       8       150    
2s_vs_1sc       2       1       300    
so_many_baneling 7       32      100    
bane_vs_bane    24      24      200    
2c_vs_64zg      2       64      400