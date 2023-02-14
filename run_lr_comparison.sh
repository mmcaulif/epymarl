#!/bin/bash

algs=(a b)

for e in "${algs[@]}"
do
   for i in {0..1}
   do
      python src/main.py --config=thesis/th_mappo_distil_$e --env-config=sc2 with env_args.map_name=3m seed=$i &
      echo "Running with seed=$i"
      sleep 2s
   done
done
