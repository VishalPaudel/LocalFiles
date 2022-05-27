
def fibonacci(n, base):

    f_old = 0
    f_new = 1

    print(f_old % base)
    print(f_new % base)

    for i in range(0, n):

        f_old, f_new = f_new, f_new + f_old
        print(f_new % base)


def main():

    fibonacci(50, 2)


# Entry point
if __name__ == '__main__':
    main()
