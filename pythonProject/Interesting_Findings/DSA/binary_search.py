# -*- coding: utf-8 -*-
# !/usr/bin/env python


"""
Future: (important) . (urgent) .

Author: Vishal Paudel (2003)
Motivation: Introduction to Computation ... using Python 2nd Edition (Chap 10: Some simple algorithm & data structures)
Scope: The current one only searches on iterables.

Last Edit: February 17, 2021 (Probably giving astrological data makes more sense, that is, if worlds change)

Note: My usual defensive programming, I have to have more knowledge than a first sem, to comment on the implementation
"""


def binary_recursive_search(*, source, key) -> bool:
    """
    The function assumes semantically that the source is already sorted in ASCENDING order.
    We skip checking whether the iterator is in ASCENDING order, because that would be O( len( source ) )
    The notion of comparison should be predefined in the elements of 'source'.

    :param source: Must be an iterable, i.e. a list | tuple | or some user defined source
    :param key: Must be the target search key
    :return: Boolean, True if found, False otherwise.

    :exception if the source is not iterable, or the elements of the source cannot be compared
    """

    iter(source)  # Produces an error is the 'source' is not iterable.

    def inner_search(start_index: int, end_index: int) -> bool:
        """
        Defining an inner method to hide implementation details, and for modularity

        ASSUMPTIONS: This method is called inside the context of a global 'source' and 'key' variable

        :param start_index: the current left index, right of which to search
        :param end_index: the current right index, left of which to search
        :return: a boolean, whether 'key in source' in 0(  log( len(source) )  )
        """
        #

        if end_index - start_index == 0:
            return source[start_index] == key

        elif end_index - start_index > 0:

            middle_index = int((start_index + end_index) / 2)
            middle_element = source[middle_index]

            # Checking the middle element
            if middle_element == key:

                return True

            elif middle_element > key:
                # Cutting down the search scope

                return inner_search(start_index, middle_index - 1)

            elif middle_element < key:
                # Cutting down the search scope

                return inner_search(middle_index + 1, end_index)

            else:
                # This is never to happen in normal comparison contexts
                raise Exception('Something unexpected happened!')

    if len(source) == 0:
        return False

    else:
        return inner_search(0, len(source))


if __name__ == '__main__':
    data = [2, 5, 6, 7, 8, 9, 11]
    my_key = 4

    print(binary_recursive_search(source=data, key=my_key))
