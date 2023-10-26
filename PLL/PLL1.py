

import numpy as np, os, time, random, re

variable_names = ['LR8','LR1','LR2','AC9','AC10','LMna','WMna','LMn1','WMn1','LMp1','WMp1','LMn2','WMn2','LMp2','WMp2', 'LMn5','WMn5','LMn4','WMn4','LMn3','WMn3','Lp1','Wp1','Ln1','Wn1','Ln2','Wn2','Ln3','Wn3','Lp2','Wp2','Lp3','Wp3', 'Ln4','Wn4','Ln5','Wn5','Lp4','Wp4','Lp5','Wp5','Ln6','Wn6','Ln7','Wn7','Lp6','Wp6','Lp7','Wp7','Ln8','Wn8','Ln9','Wn9', 'Lp8','Wp8','Lp9','Wp9','Ln10','Wn10','Ln11','Wn11','Lp10','Wp10','Lp11','Wp11','Ln12','Wn12','Ln13','Wn13','Lp12','Wp12', 'Lp13','Wp13','Lp14','Wp14','Ln14','Wn14']

path_param = 'PATH/TO/param'
path_simlog = 'PATH/TO/simlog'# or 'PATH/TO/xxx.lis'
sim_command = 'system simulation command '
bound = np.zeros((2,77))
for j in range(77):
    if 'LR' in variable_names[j]:
        bound[:,j] = np.array([1e-6,1e-3])
    elif 'AC' in variable_names[j]:
        bound[:,j] = np.array([1e-10,2.5e-9])
    elif 'L' in variable_names[j]:
        bound[:,j] = np.array([2e-7,5e-6])
    elif 'W' in variable_names[j]:
        bound[:,j] = np.array([5e-7,1e-5])




def PLL77D(x_norm):
    bounds = bound

    x = x_norm*(bounds[1]-bounds[0])+bounds[0]
    ll = ''
    dim = 77
    for j in range(dim):
        ll = ll + '.param ' + variable_names[j] + ' = ' + str(x[j]) + '\n'
        
    with open(path_param, 'w') as (f):
        f.write(ll)
    if os.path.exists(path_simlog):
        os.remove(path_simlog)
    os.system(sim_command) # 'cd ./circuit'
    #os.system('pwd')
    if os.path.exists(path_simlog):
        with open(path_simlog,'r') as f:
            data = f.readlines()
        str_res = [s for s in data if 'fom' in s]
        if len(str_res)>0:
            slist = [s for s in re.split(r'=|\n| ',str_res[0]) if len(s)>0]
            fom = float(slist[1]) 
        else:
            fom = 2000
    else: 
        fom = 2000

    with open('result.csv','a+') as f1:
        f1.write(str(time.time())+','+str(fom)+'\n')
    return fom if not np.isnan(fom) else 2000



if __name__ == '__main__':
    #Mopta = MoptaSoftConstraints()
    print(PLL77D(1*np.ones(77)))
    print(PLL77D(np.random.random(77)))


