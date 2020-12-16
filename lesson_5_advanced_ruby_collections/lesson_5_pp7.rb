# Given this code, what would be the final values of a and b? 
# Try to work this out without running the code.


a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2 # modifying the array, arr, not a;  
# In effect we are assigning a new object at that index of the array so that instead of arr[0] containing a it now contains 4
arr[1][0] -= a # The value of b did change because b is an array and 
# we are modifying that array by assigning a new value at index 0 of that array.



p a # 2
p b # [3, 8]




