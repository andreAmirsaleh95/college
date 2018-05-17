n = 2147483645
i = 2
 
while (i<=n):
 
    if (n % i == 0):
        print(i)
        n = n // i
        i -= 1
    
    i += 1
