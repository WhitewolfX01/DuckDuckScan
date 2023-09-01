for i in range(50):
	print("-",end="")
print()


def print_large_text(text):
    letters = {
        'D': r'''
DDDDD  
D    D 
D     D
D     D
D     D
D    D 
DDDDD  
''',
        'U': r'''
U     U
U     U				     DUCKDUCKSCAN
U     U				Created By - WhitewolfX01
U     U                        DuckDuckScan is a tool used for host discovery and port scanning over a network
U     U                        
U     U			       Check out more tools at :- https://github.com/WhitewolfX01/
 UUUUU 			
''',
        'C': r'''
   CCCC  
  C      
 C       
 C       
  C      
   CCCC  
''',
        'K': r'''
K    K
K   K 
K  K  
KKK   
K  K  
K   K 
K    K
'''
    }

    for letter in text:
        if letter in letters:
            print(letters[letter], end='  ')
        else:
            print('   ', end='  ')  # Print space for unsupported characters

    print()  # Move to the next line after printing the text

text_to_print = "DUCK"
print_large_text(text_to_print)

for i in range(50):
	print("-",end="")
print()
print()
