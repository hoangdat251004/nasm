# LAB1:

>```
>Input: Kinabler
>Output:
>Hello Kinabler !!
>Welcome, Kinabler to EHC
>```

## **Solution**

- First create some varibale and give them some default data.
- Datatype is db: define byte 1 byte
- `len1 equ $- msg1` is action get length of msg1 for len1.
- `0xa` is presented for newline character.
- `0xd` will make the cursor go to the next blank line.

- Create a uninitialized data for a variable `name` to prevent unexpected error.

- Create a label start
- Here wirte code

fig

- 1. This block code to print a string to monitor.

fig

- 2. This code read the input from keyboard.

fig

- 3. This code use to delete the newline character from the input above.
- Copy data in `name` to `edx`, then the value in `eax` wil be the length of this data.
- `sub eax, 0x1` to delete one lastest value in the eax
- Now 
