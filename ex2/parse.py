#!/usr/bin/env python3

TRAIN_FNAME = "training_data_tabular_format.csv"
TEST_FNAME = "test_data_tabular_format.csv"

import pandas as pd
pdd = lambda x: print(dir(x))
pt = lambda x: print(type(x))

def get_uniq(fname):
    df = pd.read_csv(fname)
    uniq1 = df["players.1.player_id"].unique()
    uniq0 = df["players.0.player_id"].unique()
    uniq_test = list(uniq0) + list(uniq1)
    return set(uniq_test)

train = get_uniq(TRAIN_FNAME)
test = get_uniq(TEST_FNAME)

# print(test)
# print(test.difference(train))

# print(pd.read_csv(TRAIN_FNAME).columns)
# print(pd.read_csv(TEST_FNAME).columns)


df = pd.read_csv(TEST_FNAME)
u = df["teams.1.3.gadgets_stats.4.id"].unique()
print(list(u))

df = pd.read_csv(TRAIN_FNAME)
u = df["teams.1.3.gadgets_stats.4.id"].unique()
print(list(u))

