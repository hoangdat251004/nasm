# LAB2:

>  ```
>  Input:
>  Nhap vao chieu dai va chieu rong:
>  3
>  1
>  Output:
>  Chu vi cua hinh chu nhat: 8
>  Dien tich cua hinh chu nhat: 3
>  ```

## **Solution**

- Start with creating some variable and give some value following format above.

- Create `section .bss` for uninitialized data.

  - > ![Screenshot 2023-12-15 221210](https://github.com/hoangdat251004/nasm/assets/110254118/77c83484-524f-4948-9dcd-f6a6e6e11724)

- Then create `section .text` to write code here.

- Write some block codes to prompt user and get input from keyboard.

  - > ![image](https://github.com/hoangdat251004/nasm/assets/110254118/2d5fc112-b87e-4cf5-8feb-7a1a4c270e38)

- Now move to the most important part: turn mathematics into code
    **First calculate the acreage of the rectangle**

    - > ![Screenshot 2023-12-15 222803](https://github.com/hoangdat251004/nasm/assets/110254118/d82994f1-25a7-47ee-9c7c-31f3d89d5fbe)
    
    - Here, use `al` register to do multiplication.
    - Put num1 in `[]` to take value of num1's address.
    - Subtracting ASCII '0' to convert into decimal number.
    - Adding '0' to convert value from decimal to ASCII.
    - The value after multiplication will be stored in `al` register.
    - Then assign this value to num1's address and write line to print this.
    
- Write some line to print newline for decorating.

    > ![image](https://github.com/hoangdat251004/nasm/assets/110254118/bb064285-ca54-4670-a651-c3c94ce57b2b)


    **Next,  we calculate the perimeter of rectangle**

    - >

