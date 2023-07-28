#!/bin/bash

leftPyramid() {
    local rows=$1
    for ((i=1; i<=rows; i++))
    do
        for ((j=1; j<=i; j++))
        do
            echo -n "*"
        done
        echo
    done
}

rightPyramid() {
    local rows=$1
    for ((i=1; i<=rows; i++))
    do
        for ((j=1; j<=rows-i; j++))
        do
            echo -n " "
        done
        for ((k=1; k<=i; k++))
        do
            echo -n "*"
        done
        echo
    done
}

pyramid() {
    local rows=$1
    local k=0
    for ((i=1; i<=rows; i++, k=0))
    do
        for ((j=1; j<=rows-i; j++))
        do
            echo -n " "
        done
        while ((k != 2*i-1))
        do
            echo -n "*"
            ((k++))
        done
        echo
    done
}

invertedPyramid() {
    local rows=$1
    local k=$((2*rows-2))
    for ((i=rows; i>=1; i--))
    do
        for ((j=k; j>=1; j--))
        do
            echo -n " "
        done
        ((k++))
        for ((j=1; j<=i; j++))
        do
            echo -n "*"
        done
        echo
    done
}

diamond() {
    local rows=$1
    local space=$((rows-1))
    for ((i=1; i<=rows; i++))
    do
        for ((j=1; j<=space; j++))
        do
            echo -n " "
        done
        ((space--))

        for ((j=1; j<=2*i-1; j++))
        do
            echo -n "*"
        done
        echo
    done

    space=1
    for ((i=1; i<=rows-1; i++))
    do
        for ((j=1; j<=space; j++))
        do
            echo -n " "
        done
        ((space++))

        for ((j=1; j<=2*(rows-i)-1; j++))
        do
            echo -n "*"
        done
        echo
    done
}

hourGlass() {
    local rows=$1
    local space=1
    local k=$((rows-1))
    for ((i=1; i<=rows; i++, k=k-2))
    do
        for ((j=1; j<=space; j++))
        do
            echo -n " "
        done
        ((space++))

        for ((j=1; j<=k+1; j++))
        do
            echo -n "*"
        done
        echo
    done

    space=$((rows-1))
    k=3
    for ((i=1; i<=rows-1; i++, k=k+2))
    do
        for ((j=1; j<=space; j++))
        do
            echo -n " "
        done
        ((space--))

        for ((j=1; j<=k; j++))
        do
            echo -n "*"
        done
        echo
    done
}

printPattern() {
    local choice=$1
    local rows=$2

    case $choice in
        1) leftPyramid $rows ;;
        2) rightPyramid $rows ;;
        3) pyramid $rows ;;
        4) invertedPyramid $rows ;;
        5) diamond $rows ;;
        6) hourGlass $rows ;;
        *) echo "Invalid choice! Please try again." ;;
    esac
}

# Main script starts here
while true
do
    echo "Enter the pattern you want to print:"
    echo "1. Left Pyramid"
    echo "2. Right Pyramid"
    echo "3. Pyramid"
    echo "4. Inverted Pyramid"
    echo "5. Diamond"
    echo "6. Hour Glass"
    echo "0. Exit"
    read -p "Enter your choice: " choice

    if [ $choice -eq 0 ]; then
        break
    fi

    read -p "Enter the number of rows: " rows

    printPattern $choice $rows
    echo
done