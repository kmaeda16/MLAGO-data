from sklearn.model_selection import train_test_split
from util import CVandPrediction as cvp
from util import ModelSelector as ms
import pandas as pd
import numpy as np
import time
import joblib
import sys
import os




## For Test
# python Prediction.py 0 1 2 ECO KNeighborsRegressor 1
# python Prediction.py 0 1 2 ECO ElasticNet 1e-5_1e-3
# python Prediction.py 0 1 2 ECO RandomForestRegressor 100_1
# python Prediction.py 0 1 2 ECO ExtraTreesRegressor None
# python Prediction.py 0 1 2 ECO LGBMRegressor 1e-3_1e-3_512_0.7_2_1.0
# python Prediction.py 0 1 2 ECO XGBRegressor 1_1_1e-6_1e-6_3_24_0.5
# python Prediction.py 0 1 2 ECO TabNetRegressor 8_8_0.02_3_1024_512


# ============ Main ============
def main():
    args = sys.argv

    if len(args)-1 != 6:
        print("6 args required: random_state n_cv n_splits Feature Algorithm HyperParam", file=sys.stderr)
        sys.exit(1)

    random_state = int(args[1])
    n_cv = int(args[2])
    n_splits = int(args[3])
    Feature = args[4]
    Algorithm = args[5]
    HyperParam = args[6]

    model = ms.model_selector(Algorithm,HyperParam)

    OutputDir = os.path.join('Results', str(random_state)+'_'+str(n_cv)+'_'+str(n_splits)+'_'+Feature+'_'+Algorithm+'_'+HyperParam)
    os.makedirs(OutputDir, exist_ok=True)

    # --------------- Reading Data ---------------
    print("Reading Data ...")
    root_path = "Data"
    df_KineticTable = pd.read_csv(os.path.join(root_path,"KineticTable_Km_NoDup.csv"))
    df_ECOneHot = pd.read_csv(os.path.join(root_path,"ECOneHot_NoDup.csv"))
    df_CompoundIDOneHot = pd.read_csv(os.path.join(root_path,"CompoundIDOneHot_NoDup.csv"))
    df_OrganismIDOneHot = pd.read_csv(os.path.join(root_path,"OrganismIDOneHot_NoDup.csv"))
    # df_PathwayOneHot = pd.read_csv(os.path.join(root_path,"PathwayOneHot_NoDup.csv"))
    # df_PfamOneHot = pd.read_csv(os.path.join(root_path,"PfamOneHot_NoDup.csv"))

    # --------------- Setting X and y ---------------
    print("Setting X and y ...")

    if Feature == 'ECO':
        Table = pd.concat([df_KineticTable[["KM (?M)"]], df_ECOneHot, df_CompoundIDOneHot, df_OrganismIDOneHot], axis=1)

    elif Feature == 'ECOT':
        Table = pd.concat([df_KineticTable[["KM (?M)"]], df_ECOneHot, df_CompoundIDOneHot, df_OrganismIDOneHot, df_KineticTable[["Temperature"]]], axis=1)

    elif Feature == 'ECOpH':
        Table = pd.concat([df_KineticTable[["KM (?M)"]], df_ECOneHot, df_CompoundIDOneHot, df_OrganismIDOneHot, df_KineticTable[["pH"]]], axis=1)

    elif Feature == 'ECOPathway':
        Table = pd.concat([df_KineticTable[["KM (?M)"]], df_ECOneHot, df_CompoundIDOneHot, df_OrganismIDOneHot, df_PathwayOneHot], axis=1)

    elif Feature == 'ECOPfam':
        Table = pd.concat([df_KineticTable[["KM (?M)"]], df_ECOneHot, df_CompoundIDOneHot, df_OrganismIDOneHot, df_PfamOneHot], axis=1)
    
    else:
        print("Error: Unexpected Feature: {}".format(Feature), file=sys.stderr)
        sys.exit(1)

    # Removing data for Maeda and Chassagnole (see SearchParameters_20220719_1.xlsx)
    indices = [ 4528-2, 4551-2, 4574-2, 4570-2, 13271-2, 
        13203-2, 7588-2, 13028-2, 1955-2, 6515-2,
        14804-2, 10680-2, 4020-2, 552-2, 553-2,
        1540-2, 1493-2 ]
    Table_wo_Maeda_Chassagnole = Table.drop(indices,axis=0)
    print('Table.shape = {}'.format(Table.shape))
    print('Table_wo_Maeda_Chassagnole.shape = {}'.format(Table_wo_Maeda_Chassagnole.shape))
    Table_for_Maeda_Chassagnole = Table.iloc[indices,:]
    print('Dropped data:')
    print(Table_for_Maeda_Chassagnole)
    
    Table_wo_Maeda_Chassagnole = Table_wo_Maeda_Chassagnole.sample(frac=1,random_state=0)
    X = Table_wo_Maeda_Chassagnole.iloc[:,1:].values
    print('X:')
    print(X)

    y_table = Table_wo_Maeda_Chassagnole[["KM (?M)"]] # y in microM
    y = y_table.values.squeeze() * 1e-3 # y in mM
    y = np.log10(y) # y in log10( mM )
    print('y: {}'.format(y))
    
    # --------------- Splitting data ---------------
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.20, random_state=random_state, shuffle=True)
    print('y_train: {}'.format(y_train))
    print('y_test : {}'.format(y_test))
    
    # --------------- CrossValidation ---------------
    if n_cv > 0:
        CV_result = cvp.CrossValidation( model, X_train, y_train, n_cv=n_cv, n_splits=n_splits )

    # --------------- Prediction ---------------
    Prediction_result, model, y_test_pred = cvp.Prediction( model, X_train, X_test, y_train, y_test )
    print('y_test_pred : {}'.format(y_test_pred))

    # --------------- Concatenate results ---------------
    if n_cv > 0:
        Result = pd.concat([CV_result, Prediction_result])
    else:
        Result = Prediction_result

    # --------------- Saving ---------------
    print("Saving ...")

    # Results for CV and prediction
    Result.to_csv(os.path.join(OutputDir,'Results.csv'),index=True)

    # Predicted y_test
    newarray = np.vstack([y_test, y_test_pred])
    columns = ['Measured', 'Predicted']
    df = pd.DataFrame(data=newarray.T,columns=columns)
    df.to_csv(os.path.join(OutputDir,'y_test_pred.csv'),index=False)
    
    # Saving model
    joblib.dump(model, os.path.join(OutputDir,'model.joblib'), compress=3)
    # Loading model (for test)
    model2 = joblib.load(os.path.join(OutputDir,'model.joblib'))
    print("Loaded model R2: {:.6f}".format(model2.score(X_test,y_test)))    




# ============ Main ============
if __name__ == "__main__":
    start = time.time()
    main()
    elapsed_time = time.time() - start
    print ("Total: {:.2f} sec".format(elapsed_time))
