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

Current hyperparams

` {
  "action_selector": "soft_policies",
  "add_value_last_step": true,
  "agent": "th_rnn_ns",
  "agent_output_type": "pi_logits",
  "batch_size": 10,
  "batch_size_run": 10,
  "buffer_cpu_only": true,
  "buffer_size": 10,
  "checkpoint_path": "",
  "critic_type": "cv_critic",
  "entropy_coef": 0.001,
  "env": "sc2",
  "env_args": {
    "continuing_episode": false,
    "debug": false,
    "difficulty": "7",
    "game_version": null,
    "heuristic_ai": false,
    "heuristic_rest": false,
    "map_name": "3m",
    "move_amount": 2,
    "obs_all_health": true,
    "obs_instead_of_state": false,
    "obs_last_action": false,
    "obs_own_health": true,
    "obs_pathing_grid": false,
    "obs_terrain_height": false,
    "obs_timestep_number": false,
    "replay_dir": "",
    "replay_prefix": "",
    "reward_death_value": 10,
    "reward_defeat": 0,
    "reward_negative_scale": 0.5,
    "reward_only_positive": true,
    "reward_scale": true,
    "reward_scale_rate": 20,
    "reward_sparse": false,
    "reward_win": 200,
    "seed": null,
    "state_last_action": false,
    "state_timestep_number": false,
    "step_mul": 8
  },
  "epochs": 15,
  "eps_clip": 0.2,
  "evaluate": false,
  "gamma": 0.99,
  "grad_norm_clip": 10,
  "hidden_dim": 64,
  "hypergroup": null,
  "label": "default_label",
  "learner": "thesis_learner",
  "learner_log_interval": 2500,
  "load_step": 0,
  "local_results_path": "results",
  "log_interval": 12500,
  "lr": 0.0005,
  "mac": "non_shared_mac",
  "mask_before_softmax": true,
  "name": "th_mappo_distil_5e-4",
  "obs_agent_id": false,
  "obs_individual_obs": false,
  "obs_last_action": false,
  "optim_alpha": 0.99,
  "optim_eps": 1e-05,
  "q_nstep": 10,
  "repeat_id": 1,
  "runner": "parallel",
  "runner_log_interval": 2500,
  "save_model": false,
  "save_model_interval": 50000,
  "save_replay": false,
  "seed": 892292116,
  "standardise_returns": false,
  "standardise_rewards": true,
  "t_max": 1000000,
  "target_update_interval_or_tau": 0,
  "test_greedy": true,
  "test_interval": 2500,
  "test_nepisode": 100,
  "use_cuda": true,
  "use_rnn": true,
  "use_tensorboard": true
} `
