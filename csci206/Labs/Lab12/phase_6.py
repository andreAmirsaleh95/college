def generate_array():
    first_cant_be = 1
    second_cant_be = 6
    third_cant_be = 2
    fourth_cant_be = 3
    fifth_cant_be = 4
    sixth_cant_be = 5
    array = [0, 0, 0, 0, 0, 0]
    length = len(array)
    i = 0
    while i < length:
        new_element = random.randint(1, 6)
        if i == 0 and new_element == first_cant_be:
            continue
        elif i == 1 and new_element == second_cant_be:
            continue
        elif i == 2 and new_element == third_cant_be:
            continue
        elif i == 3 and new_element == fourth_cant_be:
            continue
        elif i == 4 and new_element == fifth_cant_be:
            continue
        elif i == 5 and new_element == sixth_cant_be:
            continue
        else:
            array[i] = new_element
            i += 1

def generate_arrays():
    arrays = [][]
    array = generate_array()
    arrays


def generate_arrays():
    first_cant_be = 1
    second_cant_be = 6
    third_cant_be = 2
    fourth_cant_be = 3
    fifth_cant_be = 4
    sixth_cant_be = 5
    array = [0, 0, 0, 0, 0, 0]
    length = len(array)
    i = 0
    while i == 0:
        new_element = random.randint(1, 6)
        if new_element != first_cant_be:
            i += 1
            while i == 1:
                new_element = random.randint(1, 6)
#            if new_element != second_cant_be:
#                i += 1
#        array[i-1] = new_element    list_of_arrays = [][]
    array = generate_array()
