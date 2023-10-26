

import numpy as np, os, time, random, re

variable_names = ['Lp156','Wp156','Lp02','Wp02','Lp153','Wp153','Lp01','Wp01','Ln01','Wn01','Ln154','Wn154', 'Ln163','Wn163']


bound = np.array([[1e-8,1e-7,1e-8,1e-6,1e-8,1e-6,1e-5,1e-7,1e-8,1e-7,1e-8,1e-6,1e-8,1e-7],[5e-6,3e-5,6e-6,1e-4,6e-6,1e-4,4e-3,1e-5,6e-6,5e-5,6e-6,1e-4,6e-6,5e-5]])

path_param = 'PATH/TO/param'
path_simlog = 'PATH/TO/simlog'# or 'PATH/TO/xxx.lis'
sim_command = 'system simulation command '




def OSC14(x_norm):
    bounds = bound

    x = x_norm*(bounds[1]-bounds[0])+bounds[0]
    ll = ''
    dim = 14
    for j in range(dim):
        ll = ll + '.param ' + variable_names[j] + ' = ' + str(x[j]) + '\n'
        
    with open(path_param, 'w') as (f):
        f.write(ll)
    if os.path.exists(path_simlog):
        os.remove(path_simlog)
    os.system(sim_command)
    if os.path.exists(path_simlog):
        with open(path_simlog,'r') as f:
            data = f.readlines()
        str_res = [s for s in data if 'fom' in s]
        if len(str_res)>0:
            slist = [s for s in re.split(r'=|\n| ',str_res[0]) if len(s)>0]
            fom = float(slist[1]) if not 'fail' in slist[1] else 1000
        else:
            fom = 1000
    else: 
        fom = 1000

    with open('result.csv','a+') as f1:
        f1.write(str(time.time())+','+str(fom)+'\n')
    return fom if not np.isnan(fom) else 1000



if __name__ == '__main__':
    #Mopta = MoptaSoftConstraints()
    print(OSC14(1*np.ones(36)))
    print(OSC14(np.random.random(36)))


