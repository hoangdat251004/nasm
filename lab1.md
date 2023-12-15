# LAB1:

>```
>Input: Kinabler
>Output:
>Hello Kinabler !!
>Welcome, Kinabler to EHC
>```

## **Solution**

- First create some varibale and give them some default data.

  > ![Screenshot 2023-12-15 154424](https://github.com/hoangdat251004/nasm/assets/110254118/2c02b34c-8ed6-4e97-b1ae-b040a41be8c7)

- Datatype is db: define byte 1 byte
- `len1 equ $- msg1` is action get length of msg1 for len1.
- `0xa` is presented for newline character.
- `0xd` will make the cursor go to the next blank line.

- Create a uninitialized data for a variable `name` to prevent unexpected error.
  > ![Screenshot 2023-12-15 154430](https://github.com/hoangdat251004/nasm/assets/110254118/18fe6c06-2899-4124-b511-1f4e360a270c)

- Create a label start
  > ![image](https://github.com/hoangdat251004/nasm/assets/110254118/49ab5f36-628a-4cf3-8c7e-33c3a7713a3a)

- Here wirte code

  > ![1](https://github.com/hoangdat251004/nasm/assets/110254118/7a0395e9-3c11-4db0-a35a-3be4648b03ab)

- 1. This block code to print a string to monitor.

  > ![2](https://github.com/hoangdat251004/nasm/assets/110254118/99d93f9a-cd69-4b82-8f0c-7600c3359625)

- 2. This code read the input from keyboard.

  >  ![3](https://github.com/hoangdat251004/nasm/assets/110254118/8991f21f-3ff4-442c-ba8a-122377b8a148)

- 3. This code use to delete the newline character from the input above.
  - Copy data in `name` to `edx`, then the value in `eax` wil be the length of this data.
  - `sub eax, 0x1` to delete one lastest value in the eax
  - The value will change like this:
    -  > ![Screenshot 2023-12-15 154310](https://github.com/hoangdat251004/nasm/assets/110254118/dd7503af-782c-431e-bb1c-dcf9dcf2ac6b)
    -  > ![Screenshot 2023-12-15 154322](https://github.com/hoangdat251004/nasm/assets/110254118/9be19cf0-2a55-4cca-bac2-68c0e90f954e)
    -  > ![Screenshot 2023-12-15 154332](https://github.com/hoangdat251004/nasm/assets/110254118/b47eaeb4-b750-4882-bdb5-e89db629ce87)

- Then just write code to print follow the format above.

- After all of this, the output will be like this:
  -   >  ![image](https://github.com/hoangdat251004/nasm/assets/110254118/ce973b67-c084-417d-8d4a-bba588e17987)

   
