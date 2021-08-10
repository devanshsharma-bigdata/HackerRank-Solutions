K,M=input().split()
sqrt_arr=[]
for i in range(int(K)):
    L = list(map(int, input().split()))
    N=L[0]
    L.remove(L[0])
    
    max_L=max(L)
    sqrt_arr.append(max_L**2)
print(sum(sqrt_arr)%int(M))
