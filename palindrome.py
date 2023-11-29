def is_palindrome(s):
    s = s.replace(" ", "").lower()
    return s == s[::-1]

user_input = input("Enter a string: ")

if is_palindrome(user_input):
    print(" palindrome.")
else:
    print(" not a palindrome.")
