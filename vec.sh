#!/usr/bin/env bash
source_path=$1
target_path=$2
inter_dir="inter"
split_dir="$inter_dir/split"
root_dir="save"
load_path="$root_dir/34/basic-20000"
shared_path="$root_dir/34/shared.json"
out_path="$inter_dir/34.json"

debug=True
python3 -m squad.prepro --mode single --single_path $source_path --debug $debug --target_dir $split_dir --glove_dir .

python3 -m basic.cli --data_dir $split_dir --nodump_eval --answer_path $target_path --load_path $load_path --shared_path $shared_path --draft $debug --eval_num_batches 0 --mode forward --batch_size 1 --len_opt --cluster --cpu_opt

