

import numpy as np, os, time, random, re

variable_names = ['AXd1','Pxd1','Axi0','Pxi0','Axi3','Pxi3','Lr0','Wr0','Lr1','Wr1','Ac0','Pc0', 'Ln11','Wn11','Ln2','Wn2','Lnpd1','Wnpd1','Ln1','Wn1','Lnpd2','Wnpd2','Lnc1','Wnc1','Lpb2','Wpb2', 'Lppd1','Wppd1','Lps11','Wps11','Lp11','Wp11','Lp1','Wp1','Lpb1','Wpb1']


bound = np.array([[1e-10,1e-6,1e-13,1e-6,1e-13,1e-6,5e-7,1e-7,1e-9,1e-6,2e-7,5e-7,2e-7,5e-7,2e-7,5e-7,2e-7, 5e-7,2e-7,5e-7,2e-7,5e-7,2e-7,5e-7,2e-7,5e-7,2e-7,5e-7,2e-7,5e-7,2e-7,5e-7,2e-7,5e-7,2e-7,5e-7],[4e-8,1e-3,1e-11,1e-5,1e-11,1e-5,1e-4,1e-5,2e-5,1e-3,5e-5,1e-4,5e-5,1e-4,5e-5,1e-4,5e-5,1e-4,5e-5,1e-4,5e-5, 1e-4,5e-5,1e-4,5e-5,1e-4,5e-5,1e-4,5e-5,1e-4,5e-5,1e-4,5e-5,1e-4,5e-5,1e-4]])

path_param = 'PATH/TO/param'
path_simlog = 'PATH/TO/simlog'# or 'PATH/TO/xxx.lis'
sim_command = 'system simulation command '




def OPAMP36(x_norm):
    bounds = bound

    x = x_norm*(bounds[1]-bounds[0])+bounds[0]
    ll = ''
    dim = 36
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
    print(OPAMP36(1*np.ones(36)))
    print(OPAMP36(np.random.random(36)))


