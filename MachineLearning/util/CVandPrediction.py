from sklearn.model_selection import KFold, train_test_split, cross_val_score
from sklearn.metrics import mean_squared_error, r2_score
import pandas as pd
import numpy as np
import time




# ============ CrossValidation ============
def CrossValidation( model, X, y, n_cv=1, n_splits=5 ):

    # Making CV_result table
    columns = ['RMSE_train', 'RMSE_test', 'R2_train', 'R2_test', 'R_train', 'R_test', 'Time']
    index = []
    for i in range(n_cv):
        for j in range(n_splits):
            index.append('CV'+str(i+1)+'-'+str(j+1))
    CV_result = pd.DataFrame(data=np.zeros([n_cv*n_splits,len(columns)]),columns=columns,index=index)

    # Loop for cross-validations
    for cv_index in range(n_cv):

        fold_index = 0

        kf = KFold(n_splits=n_splits, shuffle=True, random_state=cv_index)

        # Loop for folds
        for train_index, test_index in kf.split(X):

            start = time.time()

            print("CV"+str(cv_index+1)+"-"+str(fold_index+1) + " ...      ",end='')

            X_train = X[train_index]
            y_train = y[train_index]
            X_test  = X[test_index]
            y_test  = y[test_index]

            model.fit(X_train,y_train)

            y_train_pred = model.predict(X_train)
            y_test_pred  = model.predict(X_test)
            
            # for i in range(len(y_train)):
            #     print("{}\t{}".format(y_train[i],y_train_pred[i]))
            # for i in range(len(y_test)):
            #     print("{}\t{}".format(y_test[i],y_test_pred[i]))
            # print()

            RMSE_train = mean_squared_error(y_train,y_train_pred,squared=False)
            RMSE_test  = mean_squared_error(y_test, y_test_pred, squared=False)
            R2_train   = r2_score(y_train,y_train_pred)
            R2_test    = r2_score(y_test, y_test_pred)
            R_train    = np.corrcoef([y_train, y_train_pred])[0,1]
            R_test     = np.corrcoef([y_test,  y_test_pred] )[0,1]

            elapsed_time = time.time() - start

            overall_index = cv_index * n_splits + fold_index

            CV_result.iat[overall_index,0] = RMSE_train
            CV_result.iat[overall_index,1] = RMSE_test
            CV_result.iat[overall_index,2] = R2_train
            CV_result.iat[overall_index,3] = R2_test
            CV_result.iat[overall_index,4] = R_train
            CV_result.iat[overall_index,5] = R_test
            CV_result.iat[overall_index,6] = elapsed_time
            
            print("RMSE_test: {:.3f}, R2_test: {:.3f}, R_test: {:.3f}, Time: {:.3f}".format(RMSE_test,R2_test,R_test,elapsed_time))

            fold_index += 1

    return(CV_result)




# ============ Prediction ============
def Prediction( model, X_train, X_test, y_train, y_test ):

    start = time.time()

    print("Prediction ... ",end='')
    
    model.fit(X_train,y_train)
    
    y_train_pred = model.predict(X_train)
    y_test_pred  = model.predict(X_test)

    columns = ['RMSE_train', 'RMSE_test', 'R2_train', 'R2_test', 'R_train', 'R_test', 'Time']
    TEST_result = pd.DataFrame(data=np.zeros([1,len(columns)]),columns=columns,index=['Prediction'])

    RMSE_train = mean_squared_error(y_train,y_train_pred,squared=False)
    RMSE_test  = mean_squared_error(y_test, y_test_pred, squared=False)
    R2_train   = r2_score(y_train,y_train_pred)
    R2_test    = r2_score(y_test, y_test_pred)
    R_train    = np.corrcoef([y_train, y_train_pred])[0,1]
    R_test     = np.corrcoef([y_test,  y_test_pred] )[0,1]

    elapsed_time = time.time() - start

    TEST_result.iat[0,0] = RMSE_train
    TEST_result.iat[0,1] = RMSE_test
    TEST_result.iat[0,2] = R2_train
    TEST_result.iat[0,3] = R2_test
    TEST_result.iat[0,4] = R_train
    TEST_result.iat[0,5] = R_test
    TEST_result.iat[0,6] = elapsed_time
    
    print("RMSE_test: {:.3f}, R2_test: {:.3f}, R_test: {:.3f}, Time: {:.3f}".format(RMSE_test,R2_test,R_test,elapsed_time))

    return(TEST_result,model,y_test_pred)

     


# ============ test_CrossValidation ============
def test_CrossValidation():
    from sklearn.ensemble import RandomForestRegressor
    from sklearn.datasets import load_diabetes

    n_cv = 2 # Number of cross validation
    n_splits = 3 # Number of folds for each cross validation

    diabetes = load_diabetes()
    X = diabetes.data
    y = diabetes.target

    model = RandomForestRegressor(random_state=1)

    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.20, random_state=0, shuffle=True)
    
    CV_result = CrossValidation( model, X_train, y_train, n_cv=n_cv, n_splits=n_splits )
    Prediction_result, model, y_test_pred = Prediction( model, X_train, X_test, y_train, y_test )

    Result = pd.concat([CV_result, Prediction_result])

    print()
    print(Result)
    print()

    print("R2 calculated by cross_val_score()")
    for i in range(n_cv):
        kf = KFold(n_splits=n_splits, shuffle=True, random_state=i)
        R2 = cross_val_score(model, X_train, y_train, cv=kf)
        for j in range(n_splits):
            print("{:.6f}".format(R2[j]))

    print()
    
    print("R2 calculated by score()")
    R2 = model.fit(X_train,y_train).score(X_test,y_test)

    print("{:.6f}".format(R2))




# ============ Main ============
if __name__ == "__main__":
    test_CrossValidation()
