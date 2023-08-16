#!/bin/bash
cd $(dirname $0)
cd ..

# source ~/.bashrc
# source ./scripts/utils.sh

root_path="../../../.."
export PYTHONPATH="$(pwd)/$root_path/":$PYTHONPATH
export CUDA_VISIBLE_DEVICES=0

### download demo data
# wget https://baidu-nlp.bj.bcebos.com/PaddleHelix/datasets/compound_datasets/demo_zinc_smiles.tgz
# tar xzf demo_zinc_smiles.tgz

### start pretrain
compound_encoder_config="model_configs/geognn_l8.json"
model_config="model_configs/pretrain_gem.json"
dataset="zinc"

# zinc 倒序
# data_path="./data/dtcniz"
# zinc sample for test
# data_path="./data/dtdemo"
# zinc for running
# data_path="./data/dtrung"
# zinc 正序
data_path="./data/dtzinc"

python pretrain.py \
		--batch_size=128 \
		--num_workers=8 \
		--max_epoch=1 \
		--lr=1e-3 \
		--dropout_rate=0.2 \
		--dataset=$dataset \
		--data_path=$data_path \
		--compound_encoder_config=$compound_encoder_config \
		--model_config=$model_config \
		--model_dir=./pretrain_models/$dataset
