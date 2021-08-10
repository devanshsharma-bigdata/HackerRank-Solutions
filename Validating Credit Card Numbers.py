N=int(input())
for i in range(N):
    A=input()
    count1=0
    if '-' in A:
        
        if A[4]!='-' or A[9]!='-' or A[14]!='-':
            print('Invalid')
            continue
        
    for k in A:
        if k=='-':
            count1+=1
    if count1>3:
        print('Invalid')
        continue
    A_w=A.split('-')
    A_mod=''.join(A_w)
    count=0
    for j in range(3,len(A_mod)):
        if A_mod[int(j)]==A_mod[int(j)-1] and A_mod[int(j)-1]==A_mod[int(j)-2] and A_mod[int(j)-2]==A_mod[int(j)-3]:
            count+=1
    if count>=1:
        print('Invalid')
        continue
    
        
    if A_mod.isnumeric():
        if A_mod[0]=='4' or A_mod[0]=='5' or A_mod[0]=='6':
            if len(A_mod)==16:
                print('Valid')
            else:
                print('Invalid')
        else:
            print('Invalid')
               
    else:
        print('Invalid')
                                
