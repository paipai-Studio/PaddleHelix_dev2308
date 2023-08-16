
import os
import pickle
from tqdm import tqdm

path = "../../../../pkl/smiles/"
lpath = os.listdir(path)[:]

with open("./data/dtrung/smiles", "w") as fw:
    for i in tqdm(lpath, desc="data for running"):
        with open(f"{path}/{i}", "rb") as fr:
            data = pickle.load(fr)
        # print(i, data)
        fw.write(f"{data}\n")
