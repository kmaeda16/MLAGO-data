#!/bin/sh
echo $0


# Display environment
conda info
conda list --export


# Calculation
n_cv=4
n_splits=5
Feature=ECO
random_state=1


# KNeighborsRegressor
Algorithm=KNeighborsRegressor
HyperParam=5
echo python Prediction.py $random_state $n_cv $n_splits $Feature $Algorithm $HyperParam
python Prediction.py $random_state $n_cv $n_splits $Feature $Algorithm $HyperParam

# ElasticNet
Algorithm=ElasticNet
HyperParam=1e-4_2e-1
echo python Prediction.py $random_state $n_cv $n_splits $Feature $Algorithm $HyperParam
python Prediction.py $random_state $n_cv $n_splits $Feature $Algorithm $HyperParam

# RandomForestRegressor
Algorithm=RandomForestRegressor
HyperParam=300_0.01
echo python Prediction.py $random_state $n_cv $n_splits $Feature $Algorithm $HyperParam
python Prediction.py $random_state $n_cv $n_splits $Feature $Algorithm $HyperParam

# XGBRegressor (test_size=0.05)
Algorithm=XGBRegressor
HyperParam=1.0_0.9_1e-3_1e+0_2_36_0.5
echo python Prediction.py $random_state $n_cv $n_splits $Feature $Algorithm $HyperParam
python Prediction.py $random_state $n_cv $n_splits $Feature $Algorithm $HyperParam

# TabNetRegressor (test_size=0.05)
Algorithm=TabNetRegressor
HyperParam=12_12_0.02_3_1024_32
echo python Prediction.py $random_state $n_cv $n_splits $Feature $Algorithm $HyperParam
python Prediction.py $random_state $n_cv $n_splits $Feature $Algorithm $HyperParam
