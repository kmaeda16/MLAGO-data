from sklearn.model_selection import train_test_split
from sklearn.pipeline import make_pipeline
from sklearn.preprocessing import MinMaxScaler
from sklearn.neighbors import KNeighborsRegressor
from sklearn.linear_model import ElasticNet
from sklearn.ensemble import RandomForestRegressor
from sklearn.ensemble import ExtraTreesRegressor
from sklearn.metrics import r2_score
import lightgbm as lgb
import xgboost as xgb
from pytorch_tabnet.pretraining import TabNetPretrainer
from pytorch_tabnet.tab_model import TabNetRegressor
import torch
import sys




# ============ model_selector ============
def model_selector(Algorithm,HyperParam):

    if Algorithm == 'KNeighborsRegressor':
        n_neighbors = int(HyperParam)
        regressor = KNeighborsRegressor(n_neighbors=n_neighbors)
        scaler = MinMaxScaler()
        model = make_pipeline(scaler, regressor)
    
    elif Algorithm == 'ElasticNet':
        HyperParam_split = HyperParam.split('_')
        alpha     = float(HyperParam_split[0])
        l1_ratio  = float(HyperParam_split[1])
        regressor = ElasticNet(alpha=alpha, l1_ratio=l1_ratio)
        scaler = MinMaxScaler()
        model = make_pipeline(scaler, regressor)

    elif Algorithm == 'RandomForestRegressor':
        HyperParam_split = HyperParam.split('_')
        n_estimators = int(HyperParam_split[0])
        max_features = float(HyperParam_split[1])
        model = RandomForestRegressor(
            n_estimators = n_estimators,
            max_features = max_features,
            criterion = "squared_error",
            random_state = 0,
            n_jobs = -1
        )

    elif Algorithm == 'ExtraTreesRegressor':
        model = ExtraTreesRegressor(
            criterion = "squared_error",
            random_state = 0,
            n_jobs = -1
        )

    elif Algorithm == 'LGBMRegressor':
        HyperParam_split = HyperParam.split('_')
        reg_alpha    = float(HyperParam_split[0])
        reg_lambda   = float(HyperParam_split[1])
        num_leaves   = int(HyperParam_split[2])
        colsample_bytree = float(HyperParam_split[3])
        subsample_freq   = int(HyperParam_split[4])
        subsample        = float(HyperParam_split[5])
        model = LGBMRegressor_mod(
            reg_alpha = reg_alpha,
            reg_lambda = reg_lambda,
            num_leaves = num_leaves,
            colsample_bytree = colsample_bytree,
            subsample_freq = subsample_freq,
            subsample = subsample,
            n_estimators = 10000,
            random_state = 0,
            objective = 'regression',
            boosting_type = 'gbdt',
        )

    elif Algorithm == 'XGBRegressor':
        HyperParam_split = HyperParam.split('_')
        subsample  = float(HyperParam_split[0])
        colsample_bytree   = float(HyperParam_split[1])
        reg_alpha  = float(HyperParam_split[2])
        reg_lambda = float(HyperParam_split[3])
        min_child_weight = float(HyperParam_split[4])
        max_depth        = int(HyperParam_split[5])
        gamma            = float(HyperParam_split[6])
        model = XGBRegressor_mod(
            subsample = subsample,
            colsample_bytree = colsample_bytree,
            reg_alpha  = reg_alpha,
            reg_lambda = reg_lambda,
            min_child_weight = min_child_weight,
            max_depth = max_depth,
            gamma = gamma,
            n_estimators = 10000,
            random_state = 0,
        )

    elif Algorithm == 'TabNetRegressor':
        HyperParam_split = HyperParam.split('_')
        n_d  = int(HyperParam_split[0])
        n_a  = int(HyperParam_split[1])
        momentum   = float(HyperParam_split[2])
        n_steps    = int(HyperParam_split[3])
        batch_size = int(HyperParam_split[4])
        virtual_batch_size = int(HyperParam_split[5])
        model = TabNetRegressor_mod(
            n_d = n_d,
            n_a = n_a,
            momentum   = momentum,
            n_steps    = n_steps,
            mask_type  = 'entmax',
            batch_size = batch_size,
            virtual_batch_size = virtual_batch_size
        )

    else:
        print("Error: Unexpected Algorithm: {}".format(Algorithm), file=sys.stderr)
        sys.exit(1)

    return(model)




# ============ LGBMRegressor_mod ============
class LGBMRegressor_mod(lgb.LGBMRegressor):

    def fit(self, X_train, y_train):

        X_train_train, X_train_val, y_train_train, y_train_val = train_test_split(X_train, y_train, test_size=0.05, random_state=0, shuffle=True)

        super().fit(
            X_train_train, y_train_train,
            eval_metric = 'rmse',
            eval_set = [(X_train_val, y_train_val)],
            callbacks = [lgb.early_stopping(stopping_rounds=10,verbose=True)]
        )

        return(self)




# ============ XGBRegressor_mod ============
class XGBRegressor_mod(xgb.XGBRegressor):

    def fit(self, X_train, y_train):

        X_train_train, X_train_val, y_train_train, y_train_val = train_test_split(X_train, y_train, test_size=0.05, random_state=0, shuffle=True)

        super().fit(
            X_train_train, y_train_train,
            early_stopping_rounds = 10,
            eval_set = [[X_train_val, y_train_val]]
        )

        return(self)




# ============ TabNetRegressor_mod ============
class TabNetRegressor_mod(TabNetRegressor):

    def __init__(self, n_d=8, n_a=8, momentum=0.02, n_steps=3, mask_type='sparsemax', batch_size=1024, virtual_batch_size=128):

        tabnet_params = dict(
            n_d = n_d,
            n_a = n_a,
            n_steps = n_steps,
            mask_type = mask_type,
            optimizer_fn = torch.optim.Adam,
            optimizer_params = dict(lr=momentum, weight_decay=1e-5),
            scheduler_params = dict(
                mode = "min",
                patience = 10,
                scheduler_fn = torch.optim.lr_scheduler.ReduceLROnPlateau,
                verbose = 0,
            )
        )

        super().__init__(**tabnet_params)
        # super().__init__(n_d=n_d, n_a=n_a, momentum=momentum, n_steps=n_steps, mask_type=mask_type)

        self.batch_size = batch_size
        self.virtual_batch_size = virtual_batch_size

    def fit(self, X_train, y_train):

        X_train_train, X_train_val, y_train_train, y_train_val = train_test_split(X_train, y_train, test_size=0.05, random_state=0, shuffle=True)

        unsupervised_model = TabNetPretrainer(
            optimizer_fn = torch.optim.Adam,
            optimizer_params = dict(lr=1e-2),
            mask_type = 'entmax'
        )

        unsupervised_model.fit(
            X_train = X_train_train,
            eval_set = [X_train_val],
            pretraining_ratio = 0.8,
        )

        super().fit(
            X_train = X_train_train,
            y_train = y_train_train.reshape(-1, 1),
            eval_set  = [(X_train_train, y_train_train.reshape(-1, 1)), (X_train_val, y_train_val.reshape(-1, 1))],
            eval_name = ['train', 'valid'],
            eval_metric = ['rmse'],
            max_epochs  = 500,
            patience    = 20,
            batch_size  = self.batch_size,
            virtual_batch_size = self.virtual_batch_size,
            from_unsupervised  = unsupervised_model,
        )

        return(self)

    def predict(self, X):
        y_pred = super().predict(X)
        y_pred = y_pred.squeeze()
        return(y_pred)

    def score(self, X_test, y_test):
        y_test_pred = self.predict(X_test)
        r2 = r2_score(y_test,y_test_pred)
        return(r2)




# ============ test_ModelSelector ============
def test_ModelSelector():
    from sklearn.datasets import load_diabetes

    diabetes = load_diabetes()
    X = diabetes.data
    y = diabetes.target

    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.20, random_state=0, shuffle=True)

    print('KNeighborsRegressor')
    model = model_selector('KNeighborsRegressor','1')
    R2 = model.fit(X_train,y_train).score(X_test,y_test)
    print("R2: {:.6f}".format(R2))
    print()

    print('ElasticNet')
    model = model_selector('ElasticNet','1e-5_1e-3')
    R2 = model.fit(X_train,y_train).score(X_test,y_test)
    print("R2: {:.6f}".format(R2))
    print()

    print('RandomForestRegressor')
    model = model_selector('RandomForestRegressor','100_1')
    R2 = model.fit(X_train,y_train).score(X_test,y_test)
    print("R2: {:.6f}".format(R2))
    print()

    print('ExtraTreesRegressor')
    model = model_selector('ExtraTreesRegressor','None')
    R2 = model.fit(X_train,y_train).score(X_test,y_test)
    print("R2: {:.6f}".format(R2))
    print()

    print('LGBMRegressor')
    model = model_selector('LGBMRegressor','1e-3_1e-3_512_0.7_2_1.0')
    R2 = model.fit(X_train,y_train).score(X_test,y_test)
    print("R2: {:.6f}".format(R2))
    print()

    print('XGBRegressor')
    model = model_selector('XGBRegressor','1_1_1e-6_1e-6_3_24_0.5')
    R2 = model.fit(X_train,y_train).score(X_test,y_test)
    print("R2: {:.6f}".format(R2))
    print()

    print('TabNetRegressor')
    model = model_selector('TabNetRegressor','8_8_0.02_3_1024_512')
    R2 = model.fit(X_train,y_train).score(X_test,y_test)
    print("R2: {:.6f}".format(R2))
    print()




# ============ Main ============
if __name__ == "__main__":
    test_ModelSelector()
    